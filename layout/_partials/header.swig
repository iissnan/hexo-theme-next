<h1 class="brand">
  <a href="{{ url_for() }}">
    <span class="logo the-shape"></span>
    <span class="site-title">{{ config.title }}</span>
  </a>
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