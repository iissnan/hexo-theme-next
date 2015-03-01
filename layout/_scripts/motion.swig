{% if theme.use_motion %}

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.min.js"></script>
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.ui.min.js"></script>

  {% include 'motion/page-home.swig' %}
  {% include 'motion/global.swig' %}

{% else %}

  {% include 'motion/fallback.swig' %}

{% endif %}
