/* global NexT: true */

$(document).on('motion:before', function () {
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
});
