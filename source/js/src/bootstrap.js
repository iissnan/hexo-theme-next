/* global NexT: true */

$(document).ready(function () {

  $(document).trigger('bootstrap:before');

  NexT.utils.isMobile() && window.FastClick.attach(document.body);

  $('#posts').find('img').lazyload({
    placeholder: '/images/loading.gif',
    effect: 'fadeIn'
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


  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
  NexT.utils.embeddedVideoTransformer();
  NexT.utils.addActiveClassToMenuItem();


  // Define Motion Sequence.
  NexT.motion.integrator
    .add(NexT.motion.middleWares.logo)
    .add(NexT.motion.middleWares.menu)
    .add(NexT.motion.middleWares.postList)
    .add(NexT.motion.middleWares.sidebar);

  $(document).trigger('motion:before');

  // Bootstrap Motion.
  CONFIG.motion && NexT.motion.integrator.bootstrap();

  $(document).trigger('bootstrap:after');
});
