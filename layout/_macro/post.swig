{% macro post(post) %}

  {% set postLink = config.root + post.path %}

  {% if post.link %}
    {{ postLink = post.link }}
  {% endif %}

  <div class="post post-type-{{ post.type }}">
    <div class="post-header">

      <div class="post-meta">
          <span class="post-time">
            Posted on {{ date(post.date, "YYYY-MM-DD") }}
          </span>
      </div>

      {% if post.title %}
        <h1 class="post-title">
          <a class="post-title-link" href="{{ postLink }}">{{ post.title }}</a>
        </h1>
      {% else %}
        {{ post.title }}
      {% endif %}
    </div>

    <div class="post-body">
      {% if not is_post() and post.excerpt %}
        {{ post.excerpt }}
        <div class="post-more-link center">
          <a class="btn" href="{{ postLink }}">Read more &raquo;</a>
        </div>
      {% else %}
        {{ post.content }}
      {% endif  %}
    </div>

    <div class="post-footer">
      {% if post.tags and post.tags.length %}
        <div class="post-tags">
          {{ list_tags(post.tags, {show_count: false}) }}
        </div>
      {% endif %}

      {% if is_post() %}
        <div class="post-eof the-shape"></div>
      {% endif %}
    </div>
  </div>

{% endmacro %}