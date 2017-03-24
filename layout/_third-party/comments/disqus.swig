{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}
  {% if theme.disqus.enable %}

    {% if theme.disqus.count  %}
      <script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>
    {% endif %}

    {% if page.comments %}
      <script type="text/javascript">
        var disqus_config = function () {
          this.page.url = '{{ page.permalink }}';
          this.page.identifier = '{{ page.path }}';
          this.page.title = '{{ page.title| addslashes }}';
        };
        var d = document, s = d.createElement('script');
        s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';
        s.setAttribute('data-timestamp', '' + +new Date());
        (d.head || d.body).appendChild(s);
      </script>
    {% endif %}

  {% endif %}
{% endif %}
