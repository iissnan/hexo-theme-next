{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} Tag: {{ page.tag }} | {{ config.title }} {% endblock %}

{% block content %}
  <h2 class="collection-title">{{ page.tag }}</h2>

  {% for post in page.posts %}
    {{ render.post(post) }}
  {% endfor %}
{% endblock %}