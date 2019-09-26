$(function() {
  $('.delete').on('click', function(e) {
    e.preventDefault();  // submitによるフォームの送信を中止
    $(this).parent().parent().remove();
  });
});