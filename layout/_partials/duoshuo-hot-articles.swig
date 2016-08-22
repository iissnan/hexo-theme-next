{# 多说热评文章  //热评统计时间范围：daily：日；weekly：周；monthly：月；默认值daily #}
{% if (theme.duoshuo.hotartical and page.title) %}
  <p>热评文章</p>
  <div class="ds-top-threads" data-range="monthly" data-num-items="4"></div>
{% endif %}
