<h1 class="brand">
  <a href="{{ url_for() }}">
    <span class="logo the-shape"></span>
    <span class="site-title">{{ config.title }}</span>
  </a>
</h1>

{% if theme.menu %}
  <ul id="menu" class="menu">
    {% for path, name in theme.menu %}
      <li class="menu-item menu-item-{{ name.toLowerCase() }}">
        {{ link_to(path, name) }}
      </li>
    {% endfor %}
  </ul>
{% endif %}