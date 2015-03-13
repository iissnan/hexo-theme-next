{% macro post(post, post_extra_class) %}

  <div class="post post-type-{{ post.type | default('normal') }} {{ post_extra_class | default('') }}">
    <div class="post-header">

      {# Not to show title for quote posts that do not have a title #}
      {% if not (is_home() and post.type === 'quote' and not post.title) %}
        <h1 class="post-title">
          {# Link posts #}
          {% if post.link %}
            <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}">
              {{ post.title or post.link }}
              <i class="icon-external-link"></i>
            </a>
          {% else %}
            {% if is_post() %}
              {{ post.title }}
            {% else %}
              <a class="post-title-link" href="{{ url_for(post.path) }}">
                {{ post.title | default(__('post.untitled'))}}
              </a>
            {% endif %}
          {% endif %}
        </h1>
      {% endif %}

      <div class="post-meta">
        <span class="post-time">
          {% if is_home() or is_post() %}
            {{ __('post.posted') }} {{ post.date | date('Y-m-d') }}
          {% else %}
            {{ post.date | date('m-d') }}
          {% endif %}
        </span>
        {% if post.comments %}
          {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ config.root + post.path }}#comments" >
              <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}"></span>
            </a>
          </span>
          {% elseif config.disqus_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ config.root + post.path }}#comments" >
              <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}"></span>
            </a>
          </span>
          {% endif %}
        {% endif %}
      </div>
    </div>

    {% if is_home() or is_post() %}
      <div class="post-body">

        {# Gallery support #}
        {% if post.photos and post.photos.length %}
          <div class="post-gallery">
            {% for photo in post.photos %}
              <a class="post-gallery-img fancybox" href="{{ url_for(photo) }}"
                 rel="gallery_{{ post._id }}">
                <img src="{{ url_for(photo) }}" />
              </a>
            {% endfor %}
          </div>
        {% endif %}

        {% if is_home() %}
          {% if post.description %}
            {{ post.description }}
            <div class="post-more-link text-center">
              <a class="btn" href="{{ url_for(post.path) }}">
                {{ __('post.read_more') }} &raquo;
              </a>
            </div>
          {% elseif post.excerpt  %}
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

        {% if is_post() and (post.prev or post.next) %}
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
        {% if is_home() and not isLast %}
          <div class="post-eof"></div>
        {% endif %}
      </div>
    {% endif %}
  </div>

{% endmacro %}
