{% extends '_layout.swig' %}

{% block title %}
  {{ page.title + ' // ' + config.title }}
{% endblock %}

{% block content %}

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
    {{ page.content }}
  {% endif %}

{% endblock %}
