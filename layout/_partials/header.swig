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
    <nav>
          <div class="navLink">
            <a href="..">
              <img src="/homeIcon.png" />
              <div>Home</div>
            </a>
          </div>
          <div class="navLink">
            <a href="/about">
              <img src="/aboutIcon.png" />
              <div>About</div>
            </a>
          </div>
          <div class="navLink">
            <a href="/blog">
              <img src="/blogIcon.png" />
              <div>Blog</div>
            </a>
          </div>
        </nav>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

