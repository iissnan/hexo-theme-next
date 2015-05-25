
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
      var $sidebarInner = $('.sidebar-inner');
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

    $(document).on('sidebar.didShow', function () {
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
          var self = this;

          this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
          event.preventDefault();

          toggleTOCOverflowIndicators();
      });
    }

    function tocOverflowIndicator (indicator, action) {
      $(indicator).velocity('stop').velocity({
        opacity: action === 'show' ? 0.4 : 0
      }, { duration: 100 });
    }

  });
</script>

{% if theme.use_motion %}
  <script type="text/javascript" id="sidebar.nav">
    $(document).ready(function () {
      var html = $('html');

      $('.sidebar-nav li').on('click', function () {
        var item = $(this);
        var activeTabClassName = 'sidebar-nav-active';
        var activePanelClassName = 'sidebar-panel-active';
        if (item.hasClass(activeTabClassName)) {
          return;
        }

        var currentTarget = $('.' + activePanelClassName);
        var target = $('.' + item.data('target'));

        currentTarget.velocity('transition.slideUpOut', 200, function () {
          target
            .velocity('stop')
            .velocity('transition.slideDownIn', 200)
            .addClass(activePanelClassName);
        });

        item.siblings().removeClass(activeTabClassName);
        item.addClass(activeTabClassName);
      });

      $('.post-toc a').on('click', function (e) {
        e.preventDefault();
        var offset = $(escapeSelector(this.getAttribute('href'))).offset().top;
        html.velocity('stop').velocity('scroll', {
          offset: offset  + 'px',
          mobileHA: false
        });
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
{% endif %}
