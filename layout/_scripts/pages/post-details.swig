
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
      if ($('.post-toc').html().trim().length > 0 && isDesktop()) {
        setTimeout(function () {
          $('.sidebar-toggle').trigger('click');
        }, 800);
      }
    });
  </script>
{% endif %}

{% include '../bootstrap.scrollspy.swig' %}

<script type="text/javascript" id="sidebar.toc.highlight">
  $(document).ready(function () {
    var tocSelector = '.post-toc';
    var activeCurrentSelector = '.active-current';

    $(tocSelector)
      .on('activate.bs.scrollspy', function () {
        var $currentActiveElement = $(tocSelector + ' .active').last();

        removeCurrentActiveClass()
        $currentActiveElement.addClass('active-current');
      })
      .on('clear.bs.scrollspy', function () {
        removeCurrentActiveClass()
      });

    function removeCurrentActiveClass () {
      $(tocSelector + ' ' + activeCurrentSelector)
        .removeClass(activeCurrentSelector.substring(1));
    }

    $('body').scrollspy({ target: tocSelector });
  });
</script>
