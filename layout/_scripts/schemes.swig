{% import '../_macro/assets.swig' as assets_render %}

{% set theme_scheme = theme.scheme | lower %}

{# Attach Scheme Scripts #}
{% set scheme_scripts = theme.assets.js[theme_scheme] %}
{{ assets_render.scripts(scheme_scripts) }}

{# Attach Scheme Components #}
{% if theme[theme_scheme] and theme[theme_scheme].sidebar.affix %}
  {{ assets_render.scripts(theme.assets.js.components.affix) }}
{% endif %}

{% if theme[theme_scheme] and theme[theme_scheme].sidebar.fixed %}
  {{ assets_render.scripts(theme.assets.js.components.fixed_sidebar) }}
{% endif %}
