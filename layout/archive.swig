{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} Archive | {{ config.title }} {% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block content %}

  <span class="archive-move-on"></span>
  <span class="archive-page-counter">
    Great! {{ site.posts.length }} posts in total. <br />
    Keep on posting.
  </span>

  {% for post in page.posts %}

    {# Show year #}
    {% set year %}
    {% set post.year = post.date | date('Y') %}

    {% if post.year !== year %}
      {% set year = post.year %}
      <div class="archive-year">
        <h2 class="collection-title">{{ year }}</h2>
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