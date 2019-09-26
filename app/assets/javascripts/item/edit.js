$(function() {
  $('.delete').on('click', function() {
    $(this).parent().parent().remove();
  });
});