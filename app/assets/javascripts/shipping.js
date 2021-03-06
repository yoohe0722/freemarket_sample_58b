$(function(){

  function buildHTML(children){
    var option = ``
    children.forEach(function(child){
      option += `<option value="${child.id}">${child.name}</option>`
    });

    var html = `<div class="select-wrap-box" id="chilren-select-wrap-box">
                <i class="fa fa-angle-down"></i>
                <div class="select-wrap-box_prefecture">
                  <div class="select-wrap">
                  <select class="select-default" id="children-form">
                  <option value label="---"></option>
                  ${option}
                </div>
                </div>`

    return html;
  };

  $("#parent-form").on("click",function(){
    $("#chilren-select-wrap-box").remove();
  })

  $("#parent-form").on("click",function(){
    $("#grand_children-select-wrap-box").remove();
  })

  $("#parent-form").on("change",function(){
    var parentValue = document.getElementById("parent-form").value;
    $.ajax({
      url: '/items/search_children',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.form-group_category').append(html);
    })
    .fail(function(){
      alert('error');
    })
  })
})


$(function(){
  function buildHTML(grand_children){
    var name = `category_id`
    if($(".edit_flag").val()=="1"){
      name = `item[category_id]`
    }
    var option = ``
    grand_children.forEach(function(grand_child){
      option += `<option value="${grand_child.id}">${grand_child.name}</option>`
    });

    var html = `<div class="select-wrap-box" id="grand_children-select-wrap-box">
                <i class="fa fa-angle-down"></i>
                <div class="select-wrap-box_prefecture">
                  <div class="select-wrap">
                  <select class="select-default" id="grand_children-form", name=`+name+`>
                  <option value label="---"></option>
                  ${option}
                </select>
                </div>
                </div>`

    return html;
  };

  $(document).on("click", "#children-form", function(){
    $("#grand_children-select-wrap-box").remove();
  })

  $(document).on("change", "#children-form", function(){
    var parentValue = document.getElementById("children-form").value;
    $.ajax({
      url: '/items/search_grand_children',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.form-group_category').append(html);
    })
    .fail(function(){
      alert('error');
    })
  })
})