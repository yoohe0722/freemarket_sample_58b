$(function() {
  $('.delete').on('click', function() {
    $(this).parent().parent().removeData();
    $(this).parent().parent().remove();
  });
});