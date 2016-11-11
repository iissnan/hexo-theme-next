{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}

  {% if theme.disqus_shortname %}

    <script type="text/javascript">
      var disqus_shortname = '{{theme.disqus_shortname}}';
      var disqus_identifier = '{{ page.path }}';

      var disqus_title = "{{ page.title|addslashes }}";


      function run_disqus_script(disqus_script) {
        var dsq = document.createElement('script');
        dsq.type = 'text/javascript';
        dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/' + disqus_script;
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      }

      run_disqus_script('count.js');

      {% if page.comments %}
        var disqus_config = function () {
            this.page.url = disqus_url;
            this.page.identifier = disqus_identifier;
            this.page.title = disqus_title;
        };
        run_disqus_script('embed.js');
      {% endif %}

    </script>
  {% endif %}
{% endif %}
