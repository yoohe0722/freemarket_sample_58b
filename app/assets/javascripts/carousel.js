$(document).on('turbolinks:load', function(){
  
  $('.slider').slick({
    autoplay:true,
    autoplaySpeed: 2000,
    speed: 100000,
    dots:true,
  });
  console.log(this);
});