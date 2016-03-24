/* global NexT: true */

$(document).ready(function () {
  var tocSelector = '.post-toc';
  var $tocElement = $(tocSelector);
  var activeCurrentSelector = '.active-current';

  $tocElement
    .on('activate.bs.scrollspy', function () {
      var $currentActiveElement = $(tocSelector + ' .active').last();

      removeCurrentActiveClass();
      $currentActiveElement.addClass('active-current');

      $currentActiveElement.scrollintoview();
      //$tocElement[0].scrollTop = $currentActiveElement.position().top;
    })
    .on('clear.bs.scrollspy', function () {
      removeCurrentActiveClass();
    });

  function removeCurrentActiveClass () {
    $(tocSelector + ' ' + activeCurrentSelector)
      .removeClass(activeCurrentSelector.substring(1));
  }

  $('body').scrollspy({ target: tocSelector });

});

$(document).ready(function () {
  var html = $('html');
  var TAB_ANIMATE_DURATION = 200;
  var hasVelocity = $.isFunction(html.velocity);

  $('.sidebar-nav li').on('click', function () {
    var item = $(this);
    var activeTabClassName = 'sidebar-nav-active';
    var activePanelClassName = 'sidebar-panel-active';
    if (item.hasClass(activeTabClassName)) {
      return;
    }

    var currentTarget = $('.' + activePanelClassName);
    var target = $('.' + item.data('target'));

    hasVelocity ?
      currentTarget.velocity('transition.slideUpOut', TAB_ANIMATE_DURATION, function () {
        target
          .velocity('stop')
          .velocity('transition.slideDownIn', TAB_ANIMATE_DURATION)
          .addClass(activePanelClassName);
      }) :
      currentTarget.animate({ opacity: 0 }, TAB_ANIMATE_DURATION, function () {
        currentTarget.hide();
        target
          .stop()
          .css({'opacity': 0, 'display': 'block'})
          .animate({ opacity: 1 }, TAB_ANIMATE_DURATION, function () {
            currentTarget.removeClass(activePanelClassName);
            target.addClass(activePanelClassName);
          });
      });

    item.siblings().removeClass(activeTabClassName);
    item.addClass(activeTabClassName);
  });

  $('.post-toc a').on('click', function (e) {
    e.preventDefault();
    var targetSelector = NexT.utils.escapeSelector(this.getAttribute('href'));
    var offset = $(targetSelector).offset().top;

    hasVelocity ?
      html.velocity('stop').velocity('scroll', {
        offset: offset  + 'px',
        mobileHA: false
      }) :
      $('html, body').stop().animate({
        scrollTop: offset
      }, 500);
  });

  // Expand sidebar on post detail page by default, when post has a toc.
  NexT.motion.middleWares.sidebar = function () {
    var $tocContent = $('.post-toc-content');

    if (CONFIG.sidebar.display === 'post' || CONFIG.sidebar.display === 'always') {
      if ($tocContent.length > 0 && $tocContent.html().trim().length > 0) {
        NexT.utils.displaySidebar();
      }
    }
  };
});
