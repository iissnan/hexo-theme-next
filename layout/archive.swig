{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} Archive | {{ config.title }} {% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block content %}

  <span class="archive-move-on"></span>

  <span class="archive-page-counter">
    {% set cheers %}
    {% set posts_length = site.posts.length %}
    {% if posts_length > 210 %} {% set cheers = 'excellent' %}
    {% elif posts_length > 130 %} {% set cheers = 'great' %}
    {% elif posts_length > 80 %} {% set cheers = 'good' %}
    {% elif posts_length > 50 %} {% set cheers = 'nice' %}
    {% elif posts_length > 30 %} {% set cheers = 'ok' %}
    {% else %} {% set cheers = 'um' %}
    {% endif %}
    {{ __('cheers.' + cheers) }}! {{ _p("counter.archive_posts", site.posts.length) }} {{ __('keep_on') }}
  </span>

  {% for post in page.posts %}

    {# Show year #}
    {% set year %}
    {% set post.year = post.date | date('Y') %}

    {% if post.year !== year %}
      {% set year = post.year %}
      <div class="collection-title">
        <h2 id="archive-year-{{ year }}">{{ year }}</h2>
      </div>
    {% endif %}
    {# endshow #}

    {{ render.post(post) }}

  {% endfor %}
{% endblock %}

{% block script_extra %}
  <script type="text/javascript">
    $(document).ready(function () {
      var clock = 0;
      function moveOn() {
        $('.archive-move-on').animate({
          opacity: clock ? 1 : 0.1
        }, 1000);
        clock = !clock;
        setTimeout(moveOn, 1000);
      }
      moveOn();
    });
  </script>
{% endblock %}