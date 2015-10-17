{% set useCustomLogo = theme.custom_logo.replace and theme.custom_logo.image %}

<div class="site-meta {% if useCustomLogo %}custom-logo{% endif %}">
  {% if useCustomLogo %}
    <h1 class="site-meta-headline">
      <a class="custom-logo-brand" href="{{ config.root }}" rel="start">
        <img class="custom-logo-image" src="{{ theme.custom_logo.image }}" alt="{{ config.title }}"/>
      </a>
    </h1>
    <p class="custom-logo-site-title">
      <a href="{{ config.root }}">{{ config.title }}</a>
    </p>
    <p class="custom-logo-site-subtitle">{{ config.subtitle }}</p>
  {% else %}
    <span class="logo-line-before"><i></i></span>
    <a href="{{ config.root }}" class="brand" rel="start">
      <span class="site-title">{{ config.title }}</span>
    </a>
    <span class="logo-line-after"><i></i></span>
  {% endif %}
</div>

<div class="site-nav-toggle">
  <button>
    <span class="btn-bar"></span>
    <span class="btn-bar"></span>
    <span class="btn-bar"></span>
  </button>
</div>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.tinysou_Key %}

  {% if theme.menu %}
    <ul id="menu" class="menu {{ hasSearch and 'menu-left' }}">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName }}">
          <a href="{{ url_for(path) }}" rel="section">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-{{theme.menu_icons[itemName] || 'question-circle'}}"></i> <br />
            {% endif %}
            {{ __('menu.' + itemName) }}
          </a>
        </li>
      {% endfor %}

      {# Search icon for default scheme #}
      {% if not theme.scheme and theme.swiftype_key %}
        <li class="menu-item menu-item-search">
          <a href="#" class="st-search-show-outputs">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search icon-next-search"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

