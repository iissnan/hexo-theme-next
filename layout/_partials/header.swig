<div class="site-nav-toggle">
  <button>
    <span class="btn-bar"></span>
    <span class="btn-bar"></span>
    <span class="btn-bar"></span>
  </button>
</div>
<script>
  $(window).scroll(function() {    
    var scroll = $(window).scrollTop();
    if (scroll >= 100) {
        $(".navLink").addClass("fade-out");
        $(".logoLink").removeClass("fade-out");
    } else {
        $(".navLink").removeClass("fade-out");
        $(".logoLink").addClass("fade-out");
    }
  }); 

  $(window).scroll(function() {    
    var scroll = $(window).scrollTop();
    if (scroll >= 100) {
        $(".navLink").addClass("fade-out");
    } else {
        $(".navLink").removeClass("fade-out");
    }
  }); 

</script>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.tinysou_Key %}

  {% if theme.menu %}
      <a href="/">
        <div class="navLink">
          <img src="/images/home_icon.svg"
               alt="Home page" />
          <div>Home</div>
        </div>
      </a>
      <a href="/about">
        <div class="navLink">
          <img src="/images/about_icon.svg"
               alt="about" />
          <div>About</div>
        </div>
      </a>
      <a href="/blog">
        <div class="navLink">
          <img src="/images/blog_icon.svg"
               alt="blogs">
          <div>Blog</div>
        </div>
      </a>
        <div class="logoLink fade-out">
          <img src="/images/logo_icon.png"
               alt="logo">
        </div>
    
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>
