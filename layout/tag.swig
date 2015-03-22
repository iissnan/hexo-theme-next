{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ __('title.tag') }}: {{ page.tag }} // {{ config.title }} {% endblock %}

{% block content %}
  <div class="collection-title">
    <h2 >
      {{ page.tag }}
      <small>{{  __('title.tag')  }}</small>
    </h2>
  </div>

  {% for post in page.posts %}
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
