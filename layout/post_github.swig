

{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">

    <script src="//cdn.bootcss.com/lazysizes/1.4.0/lazysizes.min.js"></script>
    {% for data_item in page.data_github %}
      <h2 id="{{ data_item.keywords }}" style="text-align: center;">{{ data_item.keywords }}</h2>
      {% for project in data_item.projects %}
        <h3 id="{{ project.repo }}">
        <a href="//github.com/{{ project.user }}/{{ project.repo }}" target="_blank">{{ project.repo }}</a>
        <iframe data-src="https://ghbtns.com/github-btn.html?user={{ project.user }}&repo={{ project.repo }}&type=star&count=true" frameborder="0" scrolling="0" width="120px" height="20px" class="lazyload"></iframe>
        </h3>
        {{ project.description }}
        {% for img in project.imgs %}
          <img src="{{ img }}">
        {% endfor %}
        <div class="post-eof"></div>
      {% endfor %}
    {% endfor %}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}


{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
