{% if theme.mathjax.enable %}
  {% if not theme.mathjax.per_page or (page.total or page.mathjax) %}
    <script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        tex2jax: {
          inlineMath: [ ['$','$'], ["\\(","\\)"]  ],
          processEscapes: true,
          skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
        }
      });
    </script>
    <script type="text/javascript" src="{{ theme.mathjax.cdn }}"></script>
  {% endif %}
{% endif %}
