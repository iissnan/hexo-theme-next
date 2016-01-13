<div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
  {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
    <div class="site-meta-headline">
      <a>
        <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
             alt="{{ config.title }}"/>
      </a>
    </div>
  {% endif %}

  <div class="custom-logo-site-title">
    <a href="{{ config.root }}"  class="brand" rel="start">
      <span class="logo-line-before"><i></i></span>
      <span class="site-title">{{ config.title }}</span>
      <span class="logo-line-after"><i></i></span>
    </a>
  </div>
  <p class="site-subtitle">{{ config.subtitle }}</p>
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
              <i class="menu-item-icon fa fa-{{theme.menu_icons[itemName] || 'question-circle'}} fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.' + itemName) }}
          </a>
        </li>
      {% endfor %}

      {# Search icon for default scheme #}
      {% set use_search_icon = theme.scheme === 'Muse' or theme.scheme === 'Pisces' %}
      {% if use_search_icon and theme.swiftype_key %}
        <li class="menu-item menu-item-search">
          <a href="#" class="st-search-show-outputs">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
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

