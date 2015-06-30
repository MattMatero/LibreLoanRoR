$(document).on('mouseover',"#welcome", function(){
  $(this).addClass('rotateRight');
});

$(document).on('mouseleave', '#welcome', function(){
  $(this).removeClass('rotateRight');
});