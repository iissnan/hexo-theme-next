/**
 * Created by Jacks on 2016/8/20.
 */
$(function () {
  //region 横竖屏判断
  var card = $('.card');

  function hengshuping() {
    if (window.orientation == 180 || window.orientation == 0) {
      // alert("竖屏状态！")
    }
    if (window.orientation == 90 || window.orientation == -90) {
      // alert("横屏状态！")
    }
    var visible_width = $('.tab-content').children(':visible').children().width();
    card.height(visible_width * 1.414);

  }

  window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", hengshuping, false);
  //endregion

  $(window).load(function () {
    var visible_width = $('.tab-content').children(':visible').children().width();
    card.height(visible_width * 1.414);
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
