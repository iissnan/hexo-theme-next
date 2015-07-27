
{% include '../bootstrap.scrollspy.swig' %}

<script type="text/javascript" id="sidebar.toc.highlight">
  $(document).ready(function () {
    var tocSelector = '.post-toc';
    var $tocSelector = $(tocSelector);
    var activeCurrentSelector = '.active-current';

    $tocSelector
      .on('activate.bs.scrollspy', function () {
        var $currentActiveElement = $(tocSelector + ' .active').last();

        removeCurrentActiveClass();
        $currentActiveElement.addClass('active-current');

        $tocSelector[0].scrollTop = $currentActiveElement.position().top;
      })
      .on('clear.bs.scrollspy', function () {
        removeCurrentActiveClass();
      });

    function removeCurrentActiveClass () {
      $(tocSelector + ' ' + activeCurrentSelector)
        .removeClass(activeCurrentSelector.substring(1));
    }

    function processTOC () {
      getTOCMaxHeight();
      toggleTOCOverflowIndicators();
    }

    function getTOCMaxHeight () {
      var height = $('.sidebar').height() -
                   $tocSelector.position().top -
                   $('.post-toc-indicator-bottom').height();

      $tocSelector.css('height', height);

      return height;
    }

    function toggleTOCOverflowIndicators () {
      tocOverflowIndicator(
        '.post-toc-indicator-top',
        $tocSelector.scrollTop() > 0 ? 'show' : 'hide'
      );

      tocOverflowIndicator(
        '.post-toc-indicator-bottom',
        $tocSelector.scrollTop() >= $tocSelector.find('ol').height() - $tocSelector.height() ? 'hide' : 'show'
      )
    }

    $(document).on('sidebar.motion.complete', function () {
      processTOC();
    });

    $('body').scrollspy({ target: tocSelector });
    $(window).on('resize', function () {
      if ( $('.sidebar').hasClass('sidebar-active') ) {
        processTOC();
      }
    });

    onScroll($tocSelector);

    function onScroll (element) {
      element.on('mousewheel DOMMouseScroll', function (event) {
          var oe = event.originalEvent;
          var delta = oe.wheelDelta || -oe.detail;

          this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
          event.preventDefault();

          toggleTOCOverflowIndicators();
      });
    }

    function tocOverflowIndicator (indicator, action) {
      var $indicator = $(indicator);
      var opacity = action === 'show' ? 0.4 : 0;
      $indicator.velocity ?
        $indicator.velocity('stop').velocity({
          opacity: opacity
        }, { duration: 100 }) :
        $indicator.stop().animate({
          opacity: opacity
        }, 100);
    }

  });
</script>

<script type="text/javascript" id="sidebar.nav">
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
      var targetSelector = escapeSelector(this.getAttribute('href'));
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
    var $tocContent = $('.post-toc-content');
    if (isDesktop() && CONFIG.sidebar === 'post') {
      if ($tocContent.length > 0 && $tocContent.html().trim().length > 0) {
        displaySidebar();
      }
    }
  });
</script>
