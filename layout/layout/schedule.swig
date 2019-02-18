{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ __('title.schedule') }} | {{ config.title }}{% endblock %}

{% block page_class %}page-post-detail page-calendar{% endblock %}

{% block content %}
  {######################}
  {### SCHEDULE BLOCK ###}
  {######################}
  <div class="post-block schedule">
    <div id="schedule">
      <ul id="event-list">
      </ul>
    </div>
  </div>
  {##########################}
  {### END SCHEDULE BLOCK ###}
  {##########################}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
