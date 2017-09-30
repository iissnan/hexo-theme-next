{% if theme.needMoreShare2.postbottom.enable or theme.needMoreShare2.float.enable %}
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

  <script>
    {% if theme.needMoreShare2.postbottom.enable %}
      pbOptions = {};
      {% for k,v in theme.needMoreShare2.postbottom.Options %}
          pbOptions.{{ k }} = "{{ v }}";
      {% endfor %}
      new needShareButton('#need-share-button-postbottom', pbOptions);
    {% endif %}
    {% if theme.needMoreShare2.float.enable %}
      flOptions = {};
      {% for k,v in theme.needMoreShare2.float.Options %}
          flOptions.{{ k }} = "{{ v }}";
      {% endfor %}
      new needShareButton('#need-share-button-float', flOptions);
    {% endif %}
  </script>
{% endif %}