<div id="content" class="content">
  {% set postListClass = is_home() || is_post() ? "posts-expand" : "posts-collapse" %}
  <div id="posts" class="{{ postListClass }}">
    {% block content %}{% endblock %}

    {% if not is_post() and (page.prev || page.next) %}
      <div class="pagination">
        {{ paginator({prev_text: '&laquo;', next_text: '&raquo;'}) }}
      </div>
    {% endif %}
  </div>
</div>