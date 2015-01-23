<script type="text/javascript" src="/vendors/jquery/dist/jquery.min.js"></script>

{% if theme.pjax %}
  <script type="text/javascript" src="/vendors/jquery-pjax/jquery.pjax.js"></script>
  <script type="text/javascript" src="/vendors/nprogress/nprogress.js"></script>
  <script type="text/javascript">
    $(document)
        .pjax('a', '#main', {fragment: '#main'})
        .on('pjax:start', function () { NProgress.start() })
        .on('pjax:end', function () { NProgress.done(); duoshuo(); });

    function duoshuo() {
      var dst = $(".ds-thread");
      dst.size() === 1 && DUOSHUO.EmbedThread(dst[0]);
    }
  </script>
{% endif %}

{% if theme.duoshuo and theme.duoshuo.enable and theme.duoshuo.shortname %}
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

{% if theme.google_analytics %}
  <script type="text/javascript">
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
        function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','{{ theme.google_analytics }}');ga('send','pageview');
  </script>
{% endif %}