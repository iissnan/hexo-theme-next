{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ __('title.archive') }} // {{ config.title }} {% endblock %}

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
        <h2 class="archive-year motion-element" id="archive-year-{{ year }}">{{ year }}</h2>
      </div>
    {% endif %}
    {# endshow #}

    {{ render.post(post) }}

  {% endfor %}
{% endblock %}

{% block script_extra_before %}
  {% if theme.use_motion %}
    <script type="text/javascript">
      postMotionOptions = {stagger: 100, drag: true};
    </script>
  {% endif %}
{% endblock %}

{% block script_extra %}
  {% if theme.use_motion %}
    <script type="text/javascript" id="motion.page.archive">
      $('.archive-year').velocity('transition.slideLeftIn');
    </script>
  {% endif %}
{% endblock %}
