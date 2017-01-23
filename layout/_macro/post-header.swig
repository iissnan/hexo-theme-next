{% macro render(post) %}
  <div class="post-header">
      <div class="tags">
      {% for tag in post.tags %}
        <a href="{{ url_for(tag.path) }}" rel="tag" title="{{ tag.name }}">{{ tag.name }}</a>
      {% endfor %}
      </div>
      <h1>{{ page.title }}</h1>
      <h2 class="subtitle">{{ page.subtitle || '' }}</h2>
      <div class="post-time">
        <span class="post-meta-item-text">{{ __('post.posted') }} </span>
        <time itemprop="dateCreated" datetime="{{ moment(post.date).format() }}" content="{{ date(post.date, config.date_format) }}" title="{{ moment(post.date).format('YYYY-MM-DD HH:mm:ss') }}">
          {{ date(post.date, config.date_format) }}
        </time>
      </div>
  </div>
{% endmacro %}
