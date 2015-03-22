{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{  __('title.category')  }}: {{ page.category }} // {{ config.title }} {% endblock %}

{% block content %}

  <div class="collection-title">
    <h2 >
      {{ page.category }}
      <small>{{  __('title.category')  }}</small>
    </h2>
  </div>

  {% for post in page.posts %}
    {{ render.post(post) }}
  {% endfor %}

{% endblock %}
