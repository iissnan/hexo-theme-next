{% if config.tinysou_Key %}
  <script>
    var customRenderActFunction = function(item) {
      var out = '<p class="title">' + item['document']['title'].split(" // ")[0] + '</p>';
      return out;
    };
    var option = {
      engineKey: '{{ config.tinysou_Key }}',
      renderActFunction: customRenderActFunction
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
{% endif %}