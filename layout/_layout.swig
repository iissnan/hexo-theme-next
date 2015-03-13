<!doctype html>
<html class="theme-next {% if theme.use_motion %}use-motion{% endif %}">
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

        {% include '_partials/sidebar.swig' %}

      </div>
    </div>

    <div id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
      </div>
    </div>

    <div class="back-to-top"></div>
  </div>

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/index.js?v=2.1.3"></script>

  {# This block is used to set options before any other scripts run #}
  {% block script_extra_before %}{% endblock %}

  {% include '_scripts/fancy-box.swig' %}
  {% include '_scripts/helpers.swig' %}
  {% include '_scripts/motion.swig' %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/mathjax.swig' %}
  {% include '_scripts/comments/duoshuo.swig' %}
  {% include '_scripts/comments/disqus.swig' %}
  {% include '_scripts/analytics/google-analytics.swig' %}
</body>
</html>
