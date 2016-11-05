{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" %}
    {{ __('title.category') + page_title_suffix }}
  {% elif page.type === "tags" %}
    {{ __('title.tag') + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
    {# tagcloud page support #}
    {% if page.type === "tags" %}
      <div class="tag-cloud">
        <div class="tag-cloud-title">
            {{ _p('counter.tag_cloud', site.tags.length) }}
        </div>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
      </div>
    {% elif page.type === 'categories' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    {% else %}
      {% elif page.type === 'study' %}
      {% if theme.study.enable %}
        {% include 'extensions/study/study.swig' %}
      {% else %}
        <div style="text-align: center;color: #dddddd">信息：可能你需要在配置文件中设置study: enable:true</div>
      {% endif %}
      {{ page.content }}
    {% endif %}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}

  {% block css_extra %}
    {% if theme.study.enable and page.type === 'study' %}
      <link href='{{ url_for(theme.extensions) }}/study/study.css?v={{ theme.version }}'
            rel="stylesheet"
            type="text/css">
    {% endif %}
  {% endblock %}

  {% block script_extra %}
    {% if theme.study.enable and page.type === 'study' %}
      <script src='{{ url_for(theme.extensions) }}/study/study.js?v={{ theme.version }}'
              type="text/javascript"></script>
    {% endif %}
  {% endblock %}

