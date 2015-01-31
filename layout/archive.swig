{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} Archive | {{ config.title }} {% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block content %}
  {# clock #}
  {% set clock = 0 %}

  <span class="archive-move-on"></span>

  {% for post in page.posts %}

    {# Show year #}
    {% set year %}
    {% set post.year = post.date | date('Y') %}

    {% if post.year !== year %}
      {% set year = post.year %}
      <h2 class="collection-title">{{ year }}</h2>
    {% endif %}
    {# endshow #}

    {% if clock % 2 === 0 %}
      {% set post_extra_class = "post-align-left" %}
    {% else %}
      {% set post_extra_class = "post-align-right" %}
    {% endif %}

    {{ render.post(post, post_extra_class) }}

    {% set clock = clock + 1 %}
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