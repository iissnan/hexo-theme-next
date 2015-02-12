<script type="text/javascript" src="{{ url_for(theme.vendors) }}/jquery/dist/jquery.min.js?v=0.2.1"></script>

{% if theme.fancybox %}
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/fancybox/source/jquery.fancybox.pack.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $(".fancybox").fancybox();
    });
  </script>
{% endif %}

{% if theme.duoshuo and theme.duoshuo.shortname %}
  <script type="text/javascript">
    var duoshuoQuery = {short_name:"{{config.duoshuo.shortname}}"};
    (function() {
      var ds = document.createElement('script');
      ds.type = 'text/javascript';ds.async = true;
      ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
      ds.charset = 'UTF-8';
      (document.getElementsByTagName('head')[0]
      || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
  </script>
{% endif %}