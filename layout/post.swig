{% extends '_layout.swig' %}
{% import '_macro/post.swig' as render %}

{% block title %} {{ page.title }} // {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  {{ render.post(page) }}

  {% if page.comments %}
    {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
      <div class="comments" id="comments">
        <div class="ds-thread" data-thread-key="{{ page.path }}"
             data-title="{{ page.title }}" data-url="{{ page.permalink }}">
        </div>
      </div>
    {% elseif config.disqus_shortname %}
      <div id="disqus_thread">
        <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
      </div>
    {% endif %}
  {% endif %}
{% endblock %}