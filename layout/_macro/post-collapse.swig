{% macro render(post) %}

  <article class="post post-type-{{ post.type | default('normal') }}"itemscope itemtype="http://schema.org/Article">
    <header class="post-header">

      <h1 class="post-title">
        {% if post.link %}{# Link posts #}
          <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}" itemprop="url">
            {{ post.title or post.link }}
            <i class="icon-next-external-link"></i>
          </a>
        {% else %}
            <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
              <span itemprop="name">{{ post.title | default(__('post.untitled')) }}</span>
            </a>
        {% endif %}
      </h1>

      <div class="post-meta">
        <time class="post-time" datetime="{{ post.date|date('c') }}" itemprop="dateCreated" content="{{ post.date|date('Y-m-d') }}"> {{ date(post.date, 'MM-DD') }} </time>
      </div>

    </header>
  </article>

{% endmacro %}
