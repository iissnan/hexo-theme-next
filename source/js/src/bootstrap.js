/* global NexT: true */

$(document).ready(function () {

  $(document).trigger('bootstrap:before');

  NexT.utils.isMobile() && window.FastClick.attach(document.body);
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();

  NexT.utils.lazyLoadPostsImages();
  NexT.utils.registerBackToTop();
  NexT.utils.registerNavToggle();
  NexT.utils.embeddedVideoTransformer();
  NexT.utils.addActiveClassToMenuItem();

  $(document).trigger('motion:before');

  // Define Motion Sequence.
  NexT.motion.integrator
    .add(NexT.motion.middleWares.logo)
    .add(NexT.motion.middleWares.menu)
    .add(NexT.motion.middleWares.postList)
    .add(NexT.motion.middleWares.sidebar);

  // Bootstrap Motion.
  CONFIG.motion && NexT.motion.integrator.bootstrap();

  $(document).trigger('motion:before');

  $(document).trigger('bootstrap:after');
});
