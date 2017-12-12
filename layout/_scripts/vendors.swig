{# Reset `window.Promise` when it was not a function. #}
{# IE refers the element whose id is `Promise` as `window.Promise`, this causes Velocity throwing an exception #}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% set js_vendors = {} %}
{% set js_vendors.jquery      = 'jquery/index.js' %}
<script>basket.require({url: 'https://itswincer.com/lib/fastclick/lib/fastclick.min.js' });</script>
{% set js_vendors.lazyload    = 'jquery_lazyload/jquery.lazyload.js' %}
{% set js_vendors.velocity    = 'velocity/velocity.min.js' %}
{% set js_vendors.velocity_ui = 'velocity/velocity.ui.min.js' %}

{% if theme.fancybox %}
  {% set js_vendors.fancybox  = 'fancybox/source/jquery.fancybox.pack.js' %}
{% endif %}
{% if theme.canvas_nest %}
  <script>basket.require({ url: 'https://itswincer.com/lib/canvas-nest/canvas-nest.min.js' });</script>
{% endif %}

{% if theme.three_waves %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.three_waves  = 'three/three-waves.min.js' %}
{% endif %}

{% if theme.canvas_lines %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_lines  = 'three/canvas_lines.min.js' %}
{% endif %}

{% if theme.canvas_sphere %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_sphere  = 'three/canvas_sphere.min.js' %}
{% endif %}

{% if theme.canvas_ribbon.enable and theme.scheme === 'Pisces'%}
  {% set js_vendors.canvas_ribbon  = 'canvas-ribbon/canvas-ribbon.js' %}
{% endif %}
<script typy="text/javascript" src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>

<script>
        basket.require(
                 { url: 'https://cdn.bootcss.com/jquery_lazyload/1.9.7/jquery.lazyload.min.js' },
                 { url: 'https://itswincer.com/lib/velocity/velocity.min.js'},
                 { url: 'https://itswincer.com/lib/velocity/velocity.ui.min.js' },
                 { url: 'https://cdn.bootcss.com/fancybox/3.2.5/jquery.fancybox.min.js' },
                 { url: 'https://cdn.bootcss.com/sql.js/0.4.0/js/sql.js' },
                 { url: 'https://itswincer.com/js/src/scrollspy.js' }).then(function () {
                 basket.require({ url: 'https://itswincer.com/js/src/utils.js' },
                                { url: 'https://itswincer.com/js/src/motion.js' },
                                { url: 'https://itswincer.com/js/src/affix.js' }).then(function () {
                                basket.require({ url: 'https://itswincer.com/js/src/bootstrap.js' },
                                { url: 'https://itswincer.com/js/src/post-details.js' },
                                { url: 'https://itswincer.com/js/src/schemes/pisces.js' },
                                { url: 'https://itswincer.com/js/src/hitokoto.js' });
                                });
                        });
</script>
