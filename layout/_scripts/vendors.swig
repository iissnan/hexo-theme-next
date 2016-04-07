{%
  set js_vendors = [
    '//cdn.staticfile.org/jquery/1.11.3/jquery.min.js',
    '//cdn.staticfile.org/fastclick/1.0.6/fastclick.min.js',
    '//cdn.staticfile.org/jquery.lazyload/1.9.1/jquery.lazyload.min.js',
    '//cdn.staticfile.org/velocity/1.2.3/velocity.min.js',
    '//cdn.staticfile.org/velocity/1.2.3/velocity.ui.min.js'
  ]
%}

{% if theme.fancybox %}
  {% set js_vendors[js_vendors.length] = '//cdn.staticfile.org/fancybox/2.1.5/jquery.fancybox.pack.js' %}
{% endif %}

{# Reset `window.Promise` when it was not a function. #}
{# IE refers the element whose id is `Promise` as `window.Promise`, this causes Velocity throwing an exception #}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% for vendor in js_vendors %}
  <script type="text/javascript" src="{{ vendor }}"></script>
{% endfor %}
