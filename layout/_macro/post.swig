{% macro post(post) %}

  <div class="post post-type-{{ post.type | default('normal') }}">
    <div class="post-header">

      <div class="post-meta">
          <span class="post-time">
            {% if is_home() or is_post() %}
              Posted on {{ post.date | date('Y-m-d') }}
            {% else %}
              {{ post.date | date('m-d') }}
            {% endif %}
          </span>
      </div>

      <h1 class="post-title">
        {% if not is_post() %}
          <a class="post-title-link" href="{{ config.root + post.path }}">
            {{ post.title | default('Untitled')}}
          </a>
        {% else %}
          {{ post.title }}
        {% endif %}
      </h1>
    </div>

    {% if not (is_archive() or is_category() or is_tag()) %}
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
    {% endif %}

    {% if is_home() or is_post() %}
      <div class="post-footer">
        {% if post.tags and post.tags.length %}
          <div class="post-tags">
            {% for tag in post.tags %}
              <a href="{{ config.root + tag.path }}">
                #{{ tag.name }}
              </a>
            {% endfor %}
          </div>
        {% endif %}

        {% set isLast = loop.index % page.per_page === 0 %}

        {% if is_home() and not isLast %}
          <div class="post-eof the-shape"></div>
        {% endif %}
      </div>
    {% endif %}
  </div>

{% endmacro %}