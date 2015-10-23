$(document).ready(function () {
  if (CONFIG.sidebar === 'always') {
    displaySidebar();
  }
  if (isMobile()) {
    FastClick.attach(document.body);
  }

  $("#posts").find('img').lazyload({
    placeholder: "{{ url_for(theme.images) }}/loading.gif",
    effect: "fadeIn"
  });

  $('.back-to-top').on('click', function () {
    $('body').velocity('scroll');
  });

  $('.site-nav-toggle button').on('click', function () {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', function () {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });

  CONFIG.motion && motionIntegrator.bootstrap();
});
