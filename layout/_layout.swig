<!doctype html>
<html class="{% if theme.motion %}has-motion{% endif %}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
</head>

<body>
  <div class="container one-column {% block page_class %}{% endblock %}">
    <div class="headband"></div>

    <div id="header" class="header">
      <div class="header-inner">
        {% include '_partials/header.swig' %}
      </div>
    </div>

    <div id="main" class="main">
      <div class="main-inner">
        <div id="content" class="content">
          {% if is_home() or is_post() %}
            {% set postsClass = "posts-expand" %}
          {% else %}
            {% set postsClass = "posts-collapse" %}
          {% endif %}

          <div id="posts" class="{{ postsClass }}">
            {% block content %}{% endblock %}
          </div>

          {% if not is_post() and (page.prev || page.next) %}
            <div class="pagination">
              {{ paginator({prev_text: '&laquo;', next_text: '&raquo;'}) }}
            </div>
          {% endif %}
        </div>

        <div class="sidebar-toggle">
          <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
          <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
          <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
        </div>

        <div id="sidebar" class="sidebar"></div>

      </div>
    </div>

    <div id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
      </div>
    </div>
  </div>

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/dist/jquery.min.js?v={{ theme.version }}"></script>
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.min.js"></script>
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.ui.min.js"></script>
  {% include '_partials/fancy-box.swig' %}

  {% if is_home() %}
  <script type="text/javascript">
    $.Velocity.RunSequence([
      { e: $('.brand'), p: { opacity: 1 }, o: { duration: 100 } },
      { e: $('.logo'), p: { opacity: 1, top: 0 }, o: { duration: 50} },
      { e: $('.site-title'), p: { opacity: 1, top: 0 }, o: { duration: 200, sequenceQueue: false } }
    ]);
    $('.menu-item').velocity('transition.slideDownIn', {display: null});
  </script>
  {% endif %}

  <script type="text/javascript">
    sidebatToggleAnimation();

    $('.post').velocity('transition.slideDownIn', {stagger: 300, drag: true});


    function sidebatToggleAnimation () {
      var arrowAnimationProperties = {width: '50%'};
      var topArrowAnimationProperties = $.extend({rotateZ: '-35deg', top: '2px'}, arrowAnimationProperties);
      var bottomArrowAnimationProperties = $.extend({rotateZ: '35deg', top: '-2px'}, arrowAnimationProperties);

      var sidebarToggle = $('.sidebar-toggle');
      var sidebarToggleLine1st = $('.sidebar-toggle-line-first')
      var sidebarToggleLine2nd = $('.sidebar-toggle-line-middle');
      var sidebarToggleLine3rd = $('.sidebar-toggle-line-last');

      sidebarToggle.hover(function () {
        sidebarToggle.velocity({right: '+=10px'});
        sidebarToggleLine1st.velocity(topArrowAnimationProperties);
        sidebarToggleLine2nd.velocity({width: '90%'});
        sidebarToggleLine3rd.velocity(bottomArrowAnimationProperties);
      }, function () {
        sidebarToggle.velocity('reverse');
        sidebarToggleLine1st.velocity('reverse');
        sidebarToggleLine2nd.velocity('reverse');
        sidebarToggleLine3rd.velocity('reverse');
      });
    }
  </script>

  {% block script_extra %}{% endblock %}


  {% include '_partials/comments/duoshuo.swig' %}
  {% include '_partials/comments/disqus.swig' %}
  {% include '_partials/analytics/google-analytics.swig' %}
</body>
</html>
