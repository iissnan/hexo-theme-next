/* global NexT: true */

$(document).ready(function () {
  NexT.components = NexT.components || {};

  NexT.components.sidebarElements = {
    $sidebar: $('.sidebar'),
    $elements: $('.sidebar-nav'),

    /**
     * Show Sidebar Elements.
     * @param {String} transition - Transition Effect defined in Velocity's UI Pack.
     * @param {Function} [onComplete] - Function to execute when elements have been show.
     */
    show: function (transition, onComplete) {
      var self = this;
      var contentEffect = transition || getTransition();

      this.$elements.add('.sidebar-panel-active')
        .velocity(contentEffect, {
          stagger: 50,
          drag: true,
          complete: function () {
            self.$sidebar.trigger('sidebar.motion.complete');
            $.isFunction(onComplete) && onComplete();
          }
        }
      );

      function getTransition() {
        return $('.container').hasClass('sidebar-position-left') ?
          'transition.slideLeftIn' :
          'transition.slideRightIn';
      }
    },
    hide: function (transition) {
      var contentEffect = transition || getTransition();

      this.$elements.add('.sidebar-panel-active').hide();
      this.$elements.add('.sidebar-panel-active').velocity(contentEffect);

      function getTransition() {
        return $('.container').hasClass('sidebar-position-left') ?
          'transition.slideLeftOut' :
          'transition.slideRightOut';
      }
    }
  };
});
