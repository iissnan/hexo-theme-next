{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ __('title.tag') }}: {{ page.tag }} // {{ config.title }} {% endblock %}

{% block content %}
  <div class="collection-title">
    <h2 >{{ page.tag }}</h2>
  </div>

  {% for post in page.posts %}
    {{ render.post(post) }}
  {% endfor %}
{% endblock %}