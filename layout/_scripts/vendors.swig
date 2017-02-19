{% import '../_macro/assets.swig' as assets_render %}

{#
  Reset `window.Promise` when it was not a function.
  IE refers the element whose id is `Promise` as `window.Promise`,
  this causes Velocity throwing an exception
#}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% set assets_vendors = theme.assets.vendors.static %}
{% if theme.fancybox %}
  {% set assets_vendors.fancybox = theme.assets.vendors.dynamic.fancybox %}
{% endif %}
{% if theme.canvas_nest %}
  {% set assets_vendors.canvas_nest = theme.assets.vendors.dynamic.canvas_nest %}
{% endif %}
{{ assets_render.scripts(assets_vendors) }}
