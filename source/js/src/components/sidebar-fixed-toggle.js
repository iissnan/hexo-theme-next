/* global NexT: true */

$(document).ready(function () {
  NexT.components = NexT.components || {};

  var sidebarToggleLines = {
    lines: [],
    push: function (line) {
      this.lines.push(line);
    },
    init: function () {
      this.lines.forEach(function (line) {
        line.init();
      });
    },
    arrow: function (direction) {
      this.lines.forEach(function (line) {
        line.arrow(direction);
      });
    },
    close: function () {
      this.lines.forEach(function (line) {
        line.close();
      });
    }
  };

  function SidebarToggleLine(settings) {
    this.el = $(settings.el);
    this.status = $.extend({}, {
      init: {
        width: '100%',
        opacity: 1,
        left: 0,
        rotateZ: 0,
        top: 0
      }
    }, settings.status);
  }

  SidebarToggleLine.prototype.init = function () {
    this.transform('init');
  };
  SidebarToggleLine.prototype.arrow = function (direction) {
    var status = direction === 'right' ? 'arrowRight' : 'arrow';
    this.transform(status);
  };
  SidebarToggleLine.prototype.close = function () {
    this.transform('close');
  };
  SidebarToggleLine.prototype.transform = function (status) {
    this.el.velocity('stop').velocity(this.status[status]);
  };

  var sidebarToggleLine1st = new SidebarToggleLine({
    el: '.sidebar-toggle-line-first',
    status: {
      arrow: {width: '50%', rotateZ: '-45deg', top: '2px'},
      arrowRight: {width: '50%', rotateZ: '45deg', top: '2px', left: '7px'},
      close: {width: '100%', rotateZ: '-45deg', top: '5px'}
    }
  });
  var sidebarToggleLine2nd = new SidebarToggleLine({
    el: '.sidebar-toggle-line-middle',
    status: {
      arrow: {width: '90%'},
      arrowRight: {width: '90%'},
      close: {opacity: 0}
    }
  });
  var sidebarToggleLine3rd = new SidebarToggleLine({
    el: '.sidebar-toggle-line-last',
    status: {
      arrow: {width: '50%', rotateZ: '45deg', top: '-2px'},
      arrowRight: {width: '50%', rotateZ: '-45deg', top: '-2px', left: '7px'},
      close: {width: '100%', rotateZ: '45deg', top: '-5px'}
    }
  });

  sidebarToggleLines.push(sidebarToggleLine1st);
  sidebarToggleLines.push(sidebarToggleLine2nd);
  sidebarToggleLines.push(sidebarToggleLine3rd);

  NexT.components.fixedSidebarToggle = {
    $element: $('.sidebar-toggle'),
    sidebar: NexT.components.fixedSidebar,
    init: function () {
      this.$element.on('click', this.clickHandler.bind(this));
      this.$element.on('mouseenter', this.mouseEnterHandler.bind(this));
      this.$element.on('mouseleave', this.mouseLeaveHandler.bind(this));
    },
    clickHandler: function () {
      this.sidebar.isVisible ? this.hideSidebar() : this.showSidebar();
      this.sidebar.isVisible = !this.sidebar.isVisible;
    },
    mouseEnterHandler: function () {
      if (this.sidebar.isVisible) {
        return;
      }
      var arrowDirection = this.sidebar.isOnLeft ? 'right' : 'left';
      sidebarToggleLines.arrow(arrowDirection);
    },
    mouseLeaveHandler: function () {
      if (this.sidebar.isVisible) {
        return;
      }
      sidebarToggleLines.init();
    },
    showSidebar: function () {
      var self = this;

      sidebarToggleLines.close();
      this.sidebar.show(updateToggleStatus, null);

      function updateToggleStatus() {
        var toggleDirection = self.sidebar.isOnLeft ? 'left' : 'right';
        var toggleAnimateProps = {};
        toggleAnimateProps[toggleDirection] = self.sidebar.width + 5;

        self.$element
          .velocity('stop')
          .velocity(toggleAnimateProps);
      }
    },
    hideSidebar: function () {
      this.sidebar.hide(null, updateToggleStatus.bind(this));

      function updateToggleStatus() {
        var isSidebarPositionLeft = this.sidebar.isOnLeft;
        var toggleDirection = isSidebarPositionLeft ? 'left' : 'right';
        var toggleAnimateProps = {};
        toggleAnimateProps[toggleDirection] = 50;

        this.$element.velocity('stop').velocity(toggleAnimateProps, {
          duration: 200,
          complete: function () {
            sidebarToggleLines.init();
          }
        });
      }
    }
  };
});
