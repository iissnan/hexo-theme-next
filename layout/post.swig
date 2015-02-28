{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ page.title }} // {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  {{ render.post(page) }}

  {% if page.comments %}
    <div class="comments" id="comments">
      {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
        <div class="ds-thread" data-thread-key="{{ page.path }}"
             data-title="{{ page.title }}" data-url="{{ page.permalink }}">
        </div>

      {% elseif config.disqus_shortname %}
        <div id="disqus_thread">
          <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        </div>
      {% endif %}
    </div>
  {% endif %}
{% endblock %}


{% block script_extra %}
  <script type="text/javascript" id="helpers.escapeSelector">
    function escapeSelector (selector) {
      return selector.replace(/[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\$&")
    }
  </script>

  {% if theme.use_motion %}
    <script type="text/javascript" id="post-details-motion">
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

  <script type="text/javascript" id="bootstrap.scrollspy">
    /* ========================================================================
    * Bootstrap: scrollspy.js v3.3.2
    * http://getbootstrap.com/javascript/#scrollspy
    * ========================================================================
    * Copyright 2011-2015 Twitter, Inc.
    * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
    * ======================================================================== */


    +function ($) {
      'use strict';

      // SCROLLSPY CLASS DEFINITION
      // ==========================

      function ScrollSpy(element, options) {
        this.$body          = $(document.body)
        this.$scrollElement = $(element).is(document.body) ? $(window) : $(element)
        this.options        = $.extend({}, ScrollSpy.DEFAULTS, options)
        this.selector       = (this.options.target || '') + ' .nav li > a'
        this.offsets        = []
        this.targets        = []
        this.activeTarget   = null
        this.scrollHeight   = 0

        this.$scrollElement.on('scroll.bs.scrollspy', $.proxy(this.process, this))
        this.refresh()
        this.process()
      }

      ScrollSpy.VERSION  = '3.3.2'

      ScrollSpy.DEFAULTS = {
        offset: 10
      }

      ScrollSpy.prototype.getScrollHeight = function () {
        return this.$scrollElement[0].scrollHeight || Math.max(this.$body[0].scrollHeight, document.documentElement.scrollHeight)
      }

      ScrollSpy.prototype.refresh = function () {
        var that          = this
        var offsetMethod  = 'offset'
        var offsetBase    = 0

        this.offsets      = []
        this.targets      = []
        this.scrollHeight = this.getScrollHeight()

        if (!$.isWindow(this.$scrollElement[0])) {
          offsetMethod = 'position'
          offsetBase   = this.$scrollElement.scrollTop()
        }

        this.$body
          .find(this.selector)
          .map(function () {
            var $el   = $(this)
            var href  = $el.data('target') || $el.attr('href')
            var $href = /^#./.test(href) && $(escapeSelector(href)) // Need to escape selector.

            return ($href
              && $href.length
              && $href.is(':visible')
              && [[$href[offsetMethod]().top + offsetBase, href]]) || null
          })
          .sort(function (a, b) { return a[0] - b[0] })
          .each(function () {
            that.offsets.push(this[0])
            that.targets.push(this[1])
          })


      }

      ScrollSpy.prototype.process = function () {
        var scrollTop    = this.$scrollElement.scrollTop() + this.options.offset
        var scrollHeight = this.getScrollHeight()
        var maxScroll    = this.options.offset + scrollHeight - this.$scrollElement.height()
        var offsets      = this.offsets
        var targets      = this.targets
        var activeTarget = this.activeTarget
        var i

        if (this.scrollHeight != scrollHeight) {
          this.refresh()
        }

        if (scrollTop >= maxScroll) {
          return activeTarget != (i = targets[targets.length - 1]) && this.activate(i)
        }

        if (activeTarget && scrollTop < offsets[0]) {
          this.activeTarget = null
          return this.clear()
        }

        for (i = offsets.length; i--;) {
          activeTarget != targets[i]
            && scrollTop >= offsets[i]
            && (!offsets[i + 1] || scrollTop <= offsets[i + 1])
            && this.activate(targets[i])
        }
      }

      ScrollSpy.prototype.activate = function (target) {
        this.activeTarget = target

        this.clear()

        var selector = this.selector +
          '[data-target="' + target + '"],' +
          this.selector + '[href="' + target + '"]'

        var active = $(selector)
          .parents('li')
          .addClass('active')

        if (active.parent('.dropdown-menu').length) {
          active = active
            .closest('li.dropdown')
            .addClass('active')
        }

        active.trigger('activate.bs.scrollspy')
      }

      ScrollSpy.prototype.clear = function () {
        $(this.selector)
          .parentsUntil(this.options.target, '.active')
          .removeClass('active')
      }


      // SCROLLSPY PLUGIN DEFINITION
      // ===========================

      function Plugin(option) {
        return this.each(function () {
          var $this   = $(this)
          var data    = $this.data('bs.scrollspy')
          var options = typeof option == 'object' && option

          if (!data) $this.data('bs.scrollspy', (data = new ScrollSpy(this, options)))
          if (typeof option == 'string') data[option]()
        })
      }

      var old = $.fn.scrollspy

      $.fn.scrollspy             = Plugin
      $.fn.scrollspy.Constructor = ScrollSpy


      // SCROLLSPY NO CONFLICT
      // =====================

      $.fn.scrollspy.noConflict = function () {
        $.fn.scrollspy = old
        return this
      }


      // SCROLLSPY DATA-API
      // ==================

      $(window).on('load.bs.scrollspy.data-api', function () {
        $('[data-spy="scroll"]').each(function () {
          var $spy = $(this)
          Plugin.call($spy, $spy.data())
        })
      })

    }(jQuery);
  </script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('body').scrollspy({ target: '.post-toc' });
    });
  </script>
{% endblock %}
