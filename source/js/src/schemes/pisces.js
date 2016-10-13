/* global NexT: true */

$(document).ready(function () {
  var sidebarTop = $('.header-inner').height() + 10;

  $('#sidebar').css({ 'margin-top': sidebarTop }).show();

  var $sidebarInner = $('.sidebar-inner');
  var sidebarPristinePaddingTop = $sidebarInner.css('padding-top');

  $(document)
    .on('motion:before', function () {
      NexT.motion.middleWares.sidebar = function (integrator) {
        $('.sidebar .motion-element').velocity(
          'transition.slideDownIn',
          {
            stagger: 50,
            drag: true,
            complete: function () {
              integrator.next();
            }
          }
        );
      };
    })
    .on('affix.bs.affix', function () {
      var width = $sidebarInner.width();
      $('.sidebar-inner')
        .width(width)
        .css({'padding-top': 20});
    })
    .on('affix-top.bs.affix', function () {
      $sidebarInner
        .width('auto')
        .css({'padding-top': sidebarPristinePaddingTop});
    });
});
