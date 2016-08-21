/**
 * Created by Jacks on 2016/8/20.
 */
$(function () {
  $(window).load(function () {
    var card = $('.card');
    card.height(card.width() * 1.414);
  });

  $('.tab-block').on('click', function (e) {

    if ($(this).hasClass('slider')) {
      return;
    }
    var whatTab = $(this).index();
    $('#tab-content-' + (whatTab + 1)).siblings().hide().end().show();
    var howFar = 32 * whatTab;

    $(".slider").css({
      left: howFar + "%"
    });

    $(".ripple").remove();

    var posX = $(this).offset().left,
      posY = $(this).offset().top,
      buttonWidth = $(this).width(),
      buttonHeight = $(this).height();

    $(this).prepend("<span class='ripple'></span>");

    if (buttonWidth >= buttonHeight) {
      buttonHeight = buttonWidth;
    } else {
      buttonWidth = buttonHeight;
    }

    var x = e.pageX - posX - buttonWidth / 2;
    var y = e.pageY - posY - buttonHeight / 2;

    $(".ripple").css({
      width: buttonWidth,
      height: buttonHeight,
      top: y + 'px',
      left: x + 'px'
    }).addClass("rippleEffect");

  });
});
