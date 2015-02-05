{% if theme.rss !== false %}
  {% if theme.rss %}
    {% set feed_uri = theme.rss %}
  {% elif config.feed and config.feed.path %}
    {% set feed_uri = config.root + config.feed.path %}
  {% endif %}
{% endif %}

<h1 class="site-meta">
    <a href="{{ config.root }}" class="brand">
        <span class="logo">
          <i class="icon-logo"></i>
        </span>
        <span class="site-title">{{ config.title }}</span>
    </a>
</h1>

{% if theme.menu %}
  <ul id="menu" class="menu">
    {% for name, path in theme.menu %}
      {% set itemName = name.toLowerCase() %}
      <li class="menu-item menu-item-{{ itemName }}">
        <a href="{{ path }}">
          <i class="menu-item-icon icon-{{ itemName }}"></i> <br />
          {{ __('menu.' + itemName) }}
        </a>
      </li>
    {% endfor %}
    {% if feed_uri %}
      <li class="menu-item menu-item-feed">
        <a href="{{ feed_uri }}">
          <i class="menu-item-icon icon-feed"></i> <br />
          RSS
        </a>
      </li>
    {% endif %}
  </ul>
{% endif %}