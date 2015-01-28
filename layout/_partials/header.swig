{% set has_feed_class = '' %}

{# Search feed settings from site configuration #}
{% if config.feed and config.feed.path %}
    {% set has_feed_class = 'has-feed' %}
    {% set feed_path = config.feed.path %}
{% endif %}

<h1 class="site-meta {% if has_feed_class %} {{ has_feed_class }} {% endif %}">
    <a href="{{ config.root }}" class="brand">
        <span class="logo the-shape"></span>
        <span class="site-title">{{ config.title }}</span>
    </a>
    {% if feed_path %}
        <a class="feed" href="{{ config.root + feed_path }}"></a>
    {% endif %}
</h1>

{% if theme.menu %}
  <ul id="menu" class="menu">
    {% for name, path in theme.menu %}
      {% set itemName = name.toLowerCase() %}
      <li class="menu-item menu-item-{{ itemName }}">
        {{ link_to(path, __('menu.' + itemName)) }}
      </li>
    {% endfor %}
  </ul>
{% endif %}