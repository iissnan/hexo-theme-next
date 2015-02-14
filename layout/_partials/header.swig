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
        <a href="{{ url_for(path) }}">
          <i class="menu-item-icon icon-{{ itemName }}"></i> <br />
          {{ __('menu.' + itemName) }}
        </a>
      </li>
    {% endfor %}
  </ul>
{% endif %}
