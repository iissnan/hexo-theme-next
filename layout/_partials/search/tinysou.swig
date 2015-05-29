{# 集成 tinysou 站内搜索功能#}
<form class="site-search-form" >
  <input type="text" id="ts-search-input" class="menu-search-input">
</form>
<script>
  var option = {
    engineKey: '{{ config.tinysou_Key }}'
  };
  (function(w,d,t,u,n,s,e){
    s = d.createElement(t);
    s.src = u;
    s.async = 1;
    w[n] = function(r){
      w[n].opts = r;
    };
    e = d.getElementsByTagName(t)[0];
    e.parentNode.insertBefore(s, e);
  })(window,document,'script','//tinysou-cdn.b0.upaiyun.com/ts.js','_ts');
  _ts(option);
</script>