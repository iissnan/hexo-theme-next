{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ page.title }} // {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  {{ render.post(page) }}

  {% if page.comments %}
    {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
      <div class="comments" id="comments">
        <div class="ds-thread" data-thread-key="{{ page.path }}"
             data-title="{{ page.title }}" data-url="{{ page.permalink }}">
        </div>
      </div>
    {% elseif config.disqus_shortname %}
      <div id="disqus_thread">
        <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
      </div>
    {% endif %}
  {% endif %}
{% endblock %}


{% block script_extra %}
  {% if theme.use_motion %}
    <script type="text/javascript">
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

          $.Velocity
            .animate(currentTarget, 'transition.slideUpOut', 200)
            .then(function () {
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
          var offset = $(this.getAttribute('href')).offset().top;
          html.velocity('stop').velocity('scroll', {
            offset: offset  + 'px',
            mobileHA: false
          });
        });
      });
    </script>
  {% endif %}
{% endblock %}
