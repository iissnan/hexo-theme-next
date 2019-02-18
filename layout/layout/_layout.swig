<!DOCTYPE html>
{# 下面几行是在线版本，我的改成了本地版本
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
   <script src="https://cdn.bootcss.com/jquery.pjax/2.0.1/jquery.pjax.min.js"></script>
   <script src="https://cdn.bootcss.com/jquery.pjax/2.0.1/jquery.pjax.min.js"></script> #}

<script src="/js/src/pjax/jquery_min_js.js"></script>
<script src="/js/src/pjax/jquery_pjax_min_js.js"></script>
<script src="/js/src/pjax/pjaxMain.js"></script>



{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}
<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
</head>
<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
<link rel="stylesheet" href="/dist/APlayer.min.css">




{#header放到和sidebar同级的地方#}
<header id="header_left" class="header_left" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header_left_inner"> {%- include '_partials/header_left.swig' %} </div>
      <div class=header_sidebar>黑匣子</div>
</header>


<div class="eye">
  <div class="eye1">
    <ul>
      <li style="background-color:#C7EDCC">豆沙绿</li>
      <li style="background-color:#FAF9DE">杏仁黄 </li>
      <li style="background-color:#FFFFFF">银河白</li>
      <li style="background-color:#323232">极光黑</li>
      <li style="background-color:#FFF2E2">秋叶褐</li>
      <li style="background-color:#FDE6E0">胭脂红</li>
      <li style="background-color:#E3EDCD">青草绿</li>
      <li style="background-color:#DCE2F1">海天蓝</li>
      <li style="background-color:#E9EBFE">葛巾紫</li>
      <li style="background-color:#EAEAEF">极光灰</li>
      <li style="background-color:rgb(204,232,207)">qq管家</li>
    </ul>
  </div>
  <div class="eye2">满天星</div>
</div>
<div id="aplayer"></div>
{# 这个只能通过这里加载，因为RequireJS 介绍说一个JS文件里只能放一个Define，这个众所周知，不提。#}
<script type="text/javascript" src="/dist/APlayer.min.js"></script>




  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <div class="headband"></div>
<a href="https://github.com/dataiyangu?tab=repositories"><img style="position: absolute; top: 0; left: 0; border: 0;" src="/images/github_fork.png" alt="Fork me on GitHub"></a>
  <div class="bg_content">
       <canvas id="canvas"></canvas>
  </div>
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>





<div id="pjax-container">
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>

      {#博文加密#}
      {% include 'password.swig' %}


    </main>
</div>


    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}

    {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
      <div id="needsharebutton-float">
        <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
      </div>
    {% endif %}

  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/analytics/firestore.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
</body>
</html>





{#将看板娘的功能注释掉，想要实现，打开下面一行的注释即可，但是注意接口上面运行的服务是否还运行着。#}
{# <script src="/live/autoload.js"></script> #}
{#顶部常驻js,不好看暂时先不加了#}
{# <script type="text/javascript"  defer="defer"  async src="/js/src/pjax/topDiv.js" ></script>#}
{#懒加载#}
{#去掉cdn<script src="https://cdn.bootcss.com/lazyload/2.0.3/lazyload-min.js"></script>#}
<script src="/js/src/pjax/lazyload_min.js"></script>

{#require主函数#}
<script src="/js/src/pjax/comments/comments.gitalk.js"></script>
<script src="/js/src/pjax/require.js" defer async="true" data-main="/js/src/pjax/main.js"></script>





