{% macro render(post, is_index, post_extra_class) %}

  <div class="post post-type-{{ post.type | default('normal') }} {{ post_extra_class | default('') }}">
    <div class="post-header">

      {# Not to show title for quote posts that do not have a title #}
      {% if not (is_index and post.type === 'quote' and not post.title) %}
        <h1 class="post-title">
          {# Link posts #}
          {% if post.link %}
            <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}">
              {{ post.title or post.link }}
              <i class="icon-external-link"></i>
            </a>
          {% else %}
            {% if is_index %}
              <a class="post-title-link" href="{{ url_for(post.path) }}">
                {{ post.title | default(__('post.untitled'))}}
              </a>
            {% else %}
              {{ post.title }}
            {% endif %}
          {% endif %}
        </h1>
      {% endif %}

      <div class="post-meta">
        <span class="post-time">
          {{ __('post.posted') }} {{ date(post.date, 'YYYY-MM-DD') }}
        </span>

        {% if post.categories and post.categories.length %}
          <span class="post-category">
            &nbsp; | &nbsp; {{ __('post.in') }}
            {% for cat in post.categories %}
              <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>

              {% set cat_length = post.categories.length %}
              {% if cat_length > 1 and loop.index !== cat_length %}
                {{ __('symbol.comma') }}
              {% endif %}

            {% endfor %}
          </span>
        {% endif %}

        {% if post.comments %}
          {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ url_for(post.path) }}#comments" >
              <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}"></span>
            </a>
          </span>
          {% elseif config.disqus_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ url_for(post.path) }}#comments" >
              <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}"></span>
            </a>
          </span>
          {% endif %}
        {% endif %}
      </div>
    </div>

    <div class="post-body">

      {# Gallery support #}
      {% if post.photos and post.photos.length %}
        <div class="post-gallery">
          {% for photo in post.photos %}
            <a class="post-gallery-img fancybox" href="{{ url_for(photo) }}" rel="gallery_{{ post._id }}">
              <img src="{{ url_for(photo) }}" />
            </a>
          {% endfor %}
        </div>
      {% endif %}

      {% if is_index %}
        {% if post.description %}
          {{ post.description }}
          <div class="post-more-link text-center">
            <a class="btn" href="{{ url_for(post.path) }}">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
          {% elif post.excerpt  %}
          {{ post.excerpt }}
          <div class="post-more-link text-center">
            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#more{% endif %}">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
        {% else %}
          {{ post.content }}
        {% endif %}
      {% else %}
        {{ post.content }}
      {% endif  %}
    </div>

    <div class="post-footer">
      {% if post.tags and post.tags.length and not is_index %}
        <div class="post-tags">
          {% for tag in post.tags %}
            <a href="{{ url_for(tag.path) }}"> #{{ tag.name }} </a>
          {% endfor %}
        </div>
      {% endif %}

      {% if not is_index and (post.prev or post.next) %}
        <div class="post-nav">
          <div class="post-nav-prev post-nav-item">
            {% if post.prev %}
              <a href="{{ url_for(post.prev.path) }}">{{post.prev.title}}</a>
            {% endif %}
          </div>

          <div class="post-nav-next post-nav-item">
            {% if post.next %}
              <a href="{{ url_for(post.next.path) }}">{{post.next.title}}</a>
            {% endif %}
          </div>
        </div>
      {% endif %}

      {% set isLast = loop.index % page.per_page === 0 %}
      {% if is_index and not isLast %}
        <div class="post-eof"></div>
      {% endif %}
    </div>
  </div>

{% endmacro %}
