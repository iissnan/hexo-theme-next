{% macro script(path, version) %}
  <script src="{{ url_for(path) }}?v={{ version || theme.version }}"></script>
{% endmacro %}

{% macro scripts(list) %}
  {% for item in list %}
    {{ script(item.src, item.version) }}
  {% endfor %}
{% endmacro %}
