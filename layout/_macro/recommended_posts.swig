<div class="recommended_posts">
    {% set recommended_posts = recommended_posts(post, site) %}
    {% if recommended_posts.length > 0 %}
    <h1>{{ __('post.recommended_posts') }} </h1>
    <ul>
        {% for link in recommended_posts  %}
            <li><a href="{{ link.permalink }}">{{ link.title }}</a></li>
        {% endfor %}
    </ul>
    {% endif %} 
</div>