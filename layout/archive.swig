{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} Archive | {{ config.title }} {% endblock %}

{% block content %}
  {% for post in page.posts %}

    {# Show year #}
    {% set year %}
    {% set post.year = post.date | date('Y') %}
    {% if post.year !== year %}
      {% set year = post.year %}
      <h2 class="collection-title">{{ year }}</h2>
    {% endif %}
    {# endshow #}

    {{ render.post(post) }}
  {% endfor %}
{% endblock %}