{% if theme.mathjax %}
  <script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"]  ],
        processEscapes: true,
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
      }
    });
  </script>

  <script type="text/x-mathjax-config">
    MathJax.Hub.Queue(function() {
      var all = MathJax.Hub.getAllJax(), i;
      for (i=0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
      }
    });
  </script>

  {% if config.language === 'zh-Hans' %}
    <script type="text/javascript" src="http://cdn.staticfile.org/mathjax/2.4.0/MathJax.js"></script>
    <script type="text/javascript" src="http://cdn.staticfile.org/mathjax/2.4.0/config/TeX-AMS-MML_HTMLorMML.js"></script>
  {% else %}
    <script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
  {% endif %}
{% endif %}
