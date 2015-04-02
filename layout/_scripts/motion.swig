{% if theme.use_motion %}

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.min.js"></script>
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/velocity/velocity.ui.min.js"></script>

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/csp/motion_global.js" id="motion.global"></script>

{% else %}

  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/csp/motion_fallback.js" id="motion.fallback"></script>

{% endif %}
