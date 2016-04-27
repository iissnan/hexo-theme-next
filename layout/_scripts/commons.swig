
{% if !theme.sidebar.position %}
{%
  set js_commons = [
    'src/utils.js',
    'src/motion-right.js'
  ]
%}
{% elif theme.sidebar.position==='right' %}
{%
  set js_commons = [
    'src/utils.js',
    'src/motion-right.js'
  ]
%}
{% else %}
{%
  set js_commons = [
    'src/utils.js',
    'src/motion.js'
  ]
%}
{% endif %}

{% for common in js_commons %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ common }}?v={{ theme.version }}"></script>
{% endfor %}
