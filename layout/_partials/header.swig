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
      <a href="/">
        <div class="navLink">
          <img src="/images/home_icon.png"
               alt="Home page" />
          <div>Home</div>
        </div>
      </a>
      <a href="/about">
        <div class="navLink">
          <img src="/images/about_icon.png"
               alt="about" />
          <div>About</div>
        </div>
      </a>
      <a href="/blog">
        <div class="navLink">
          <img src="/images/blog_icon.png"
               alt="blogs">
          <div>Blog</div>
        </div>
      </a>
    
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>
