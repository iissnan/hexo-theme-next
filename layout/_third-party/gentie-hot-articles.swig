{# 网易云跟帖热评文章 #}
{% if (theme.gentie_hotartical and page.title) %}
 

<div id="hot-news-wrap"></div>
<script>var yunModuleEnv = true;</script>
<script src="https://img1.cache.netease.com/f2e/tie/yun/sdk/loader.js"></script>
<script>
  var yunTieProductKey = "{{gentie_productKey}}";  
  var yunHotNewsWrap = "hot-news-wrap";   //放置的DOM节点ID 或 样式类
  Tie.loader("aHR0cHM6Ly9hcGkuZ2VudGllLjE2My5jb20vZXh0ZW5kL2hvdF9uZXdzX3NjcmlwdC5odG1s", true);
</script>


{% endif %}
