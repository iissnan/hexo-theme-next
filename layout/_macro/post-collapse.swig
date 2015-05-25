{% macro render(post) %}

  <div class="post post-type-{{ post.type | default('normal') }}">
    <div class="post-header">

      <div class="post-title">
        {% if post.link %}{# Link posts #}
          <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}">
            {{ post.title or post.link }}
            <i class="icon-external-link"></i>
          </a>
        {% else %}
            <a class="post-title-link" href="{{ url_for(post.path) }}">
              {{ post.title | default(__('post.untitled')) }}
            </a>
        {% endif %}
      </div>

      <div class="post-meta">
        <span class="post-time"> {{ date(post.date, 'MM-DD') }} </span>
      </div>

    </div>
  </div>

{% endmacro %}
