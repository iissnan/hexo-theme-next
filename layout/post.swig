{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  {{ render.post(page) }}

  {% if config.duoshuo and config.duoshuo.shortname and page.comments %}
    <div class="comments" id="comments">
      <div class="ds-thread" data-thread-key="{{ page.path }}"
          data-title="{{ page.title }}" data-url="{{ page.permalink }}">
      </div>
    </div>
  {% endif %}
{% endblock %}