{% if page.comments || is_home() %}
    {% include 'comments/duoshuo.swig' %}
    {% include 'comments/disqus.swig' %}
{% endif%}
