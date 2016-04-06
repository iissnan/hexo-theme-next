{% if theme.font.enable %}

  {% set font_config = theme.font %}
  {% set font_families = '' %}
  {% set font_styles = ':300,300italic,400,400italic,700,700italic' %}
  {% set font_found = false %}

  {% if font_config.global.family and font_config.global.external %}
    {% set font_families += font_config.global.family + font_styles %}
    {% set font_found = true %}
  {% endif %}

  {% if font_config.heading.family and font_config.heading.external %}
    {% if font_found %}
      {% set font_families += '|' %}
    {% endif %}

    {% set font_families += font_config.heading.family + font_styles %}
  {% endif %}

  {% if font_config.post.family and font_config.post.external %}
    {% if font_found %}
      {% set font_families += '|' %}
    {% endif %}

    {% set font_families += font_config.post.family + font_styles %}
  {% endif %}

  {% if font_config.logo.family and font_config.logo.external %}
    {% if font_found %}
      {% set font_families += '|' %}
    {% endif %}

    {% set font_families += font_config.logo.family + font_styles %}
  {% endif %}

  {% if font_config.code.family and font_config.code.external %}
    {% if font_found %}
      {% set font_families += '|' %}
    {% endif %}

    {% set font_families += font_config.code.family + font_styles %}
  {% endif %}

  {% if font_families !== '' %}
    {% set font_families += '&subset=latin,latin-ext' %}
    {% set font_host = font.host | default('//fonts.googleapis.com') %}
    <link href="{{ font_host }}/css?family={{ font_families }}" rel="stylesheet" type="text/css">
  {% endif %}

{% endif %}
