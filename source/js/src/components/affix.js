/* global NexT: true */

$(document).ready(function () {
  NexT.components = NexT.components || {};

  NexT.components.affix = {
    init: function () {
      var $sidebarInner = $('.sidebar-inner');
      var sidebarPristinePaddingTop = $sidebarInner.css('padding-top');

      $(document)
        .on('motion:before', function () {
          NexT.motion.middleWares.sidebar = function (integrator) {
            NexT.components.sidebarElements.show(
              'transition.slideDownIn', function () {
                integrator.next();
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
    }
  };
});
