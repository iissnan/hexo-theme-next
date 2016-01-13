{%
  set js_vendors = [
    'jquery/index.js?v=2.1.3',
    'fastclick/lib/fastclick.min.js?v=1.0.6',
    'jquery_lazyload/jquery.lazyload.js?v=1.9.7',
    'velocity/velocity.min.js',
    'velocity/velocity.ui.min.js'
  ]
%}

{% if theme.fancybox %}
  {% set js_vendors[js_vendors.length] = 'fancybox/source/jquery.fancybox.pack.js' %}
{% endif %}

{% for vendor in js_vendors %}
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/{{ vendor }}"></script>
{% endfor %}
