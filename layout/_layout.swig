<!doctype html>
<html lang="zh">
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
      </div>
    </div>

    <div id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
      </div>
    </div>

  </div>

  {% include '_partials/scripts.swig' %}
  {% block script_extra %}{% endblock %}
</body>
</html>