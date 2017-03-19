/* global NexT: true */

$(document).ready(function () {

  $(document).trigger('bootstrap:before');

  NexT.utils.isMobile() && window.FastClick.attach(document.body);
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();

  NexT.utils.lazyLoadPostsImages();
  NexT.utils.registerESCKeyEvent();
  NexT.utils.registerBackToTop();
  NexT.utils.registerNavToggle();
  NexT.utils.embeddedVideoTransformer();
  NexT.utils.addActiveClassToMenuItem();

  // Initialize Components
  ['fixedSidebarToggle', 'affix'].forEach(function (name) {
    var component = NexT.components[name];
    var couldInit = component && $.isFunction(component.init);

    couldInit && component.init();
  });

  $(document).trigger('motion:before');

  // Define Motion Sequence.
  NexT.motion.integrator
    .add(NexT.motion.middleWares.logo)
    .add(NexT.motion.middleWares.menu)
    .add(NexT.motion.middleWares.sidebar)
    .add(NexT.motion.middleWares.postList);

  // Bootstrap Motion.
  CONFIG.motion && NexT.motion.integrator.bootstrap();

  $(document).trigger('motion:before');

  $(document).trigger('bootstrap:after');
});
