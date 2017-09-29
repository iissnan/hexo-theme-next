{% if theme.needMoreShare2.enable %}
  {% set needMoreShare2_css = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.min.css') %}
  {% if theme.vendors.needMoreShare2 %}
    {% set needMoreShare2_css = theme.vendors.needMoreShare2_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ needMoreShare2_css }}">

  {% set needMoreShare2_js = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.min.js') %}
  {% if theme.vendors.needMoreShare2_js %}
    {% set needMoreShare2_js = theme.vendors.needMoreShare2_js %}
  {% endif %}
  <script src="{{ needMoreShare2_js }}"></script>
{% endif %}