{% if theme.google_analytics %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/analytics_google-analytics.js?v={{ theme.version }}"></script>
{% endif %}
