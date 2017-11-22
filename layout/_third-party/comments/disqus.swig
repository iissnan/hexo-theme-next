{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}
  {% if theme.disqus.enable %}

    {% if page.comments %}
           <script type="text/javascript">
        var disqus = {
            load : function disqus(){
                if(typeof DISQUS !== 'object') {
                (function () {
                var s = document.createElement('script'); s.async = true;
                s.type = 'text/javascript';
                s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';
                (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
                }());
                $('#load-disqus').remove(); ///加载后移除按钮
                }
            }
        }
      </script>
    {% endif %}
  {% endif %}
{% endif %}
