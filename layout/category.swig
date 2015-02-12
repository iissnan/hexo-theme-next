{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{  __('title.category')  }}: {{ page.category }} // {{ config.title }} {% endblock %}

{% block content %}
  {% for post in page.posts %}
    {{ render.post(post) }}
  {% endfor %}
{% endblock %}