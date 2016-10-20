/* global NexT: true */

$(document).ready(function () {
  NexT.components.fixedSidebar = {
    $element: $('.sidebar'),
    children: NexT.components.sidebarElements,
    width: 320,
    isVisible: false,
    isOnLeft: $('.container').hasClass('sidebar-position-left'),

    /**
     * Show Sidebar.
     * @param {Function} pre - Function to be executed before hiding Sidebar.
     * @param {Function} post - Function to be executed after Sidebar has been hidden.
     */
    show: function (pre, post) {
      var self = this;

      this.body(this.width);
      this.$element.velocity('stop').velocity({
        width: self.width
      }, {
        display: 'block',
        duration: 200,
        begin: function () {
          $.isFunction(pre) && pre();
        },
        complete: function () {
          self.$element.addClass('sidebar-active');
          self.children.show();
          $.isFunction(post) && post();
        }
      });
    },

    /**
     * Hide sidebar.
     * @param {Function} pre - Function to be executed before hiding Sidebar.
     * @param {Function} post - Function to be executed after Sidebar has been hidden.
     */
    hide: function (pre, post) {
      var self = this;

      this.body(0);
      this.children.hide();
      this.$element.velocity('stop').velocity({
        width: 0
      }, {
        display: 'none',
        before: function () {
          $.isFunction(pre) && pre();
          self.children.hide();
        },
        complete: function () {
          self.$element.removeClass('sidebar-active');
          $.isFunction(post) && post();
        }
      });
    },

    /**
     * Adjust body padding to offset the sidebar's space.
     * @param offset
     */
    body: function (offset) {
      var animateProps = {};
      var bodyPadding = this.isOnLeft ? 'padding-left' : 'padding-right';
      animateProps[bodyPadding] = offset;

      NexT.utils.isDesktop() && $('body').velocity('stop').velocity(animateProps);
    }
  };
});
