{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %} {{ page.title }} // {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>

    {% if page.comments %}
      <div class="comments" id="comments">
        {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
          <div class="ds-thread" data-thread-key="{{ page.path }}"
               data-title="{{ page.title }}" data-url="{{ page.permalink }}">
          </div>
        {% elseif config.disqus_shortname %}
          <div id="disqus_thread">
            <noscript>Please enable JavaScript to view the <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
          </div>
        {% endif %}
      </div>
    {% endif %}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}


{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}

{% block comment_system %}
  {% include '_scripts/comments/duoshuo.swig' %}
  {% include '_scripts/comments/disqus.swig' %}
{% endblock %}