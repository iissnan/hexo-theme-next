{% if page.comments and page.comments_show %}
  {% include './comments/duoshuo.swig' %}
  {% include './comments/disqus.swig' %}
{% endif %}