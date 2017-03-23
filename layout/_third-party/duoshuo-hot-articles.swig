{# 多说热评文章 #}
{% if (theme.duoshuo_hotartical and page.title) %}
  <p>热评文章</p>
  <div class="ds-top-threads" data-range="weekly" data-num-items="4"></div>
{% endif %}
