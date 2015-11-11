{% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}

  {% if theme.duoshuo %}
    {% set duoshuo_shortname = theme.duoshuo.shortname %}
  {% else %}
    {% set duoshuo_shortname = theme.duoshuo_shortname %}
  {% endif %}

  <script type="text/javascript">
    var duoshuoQuery = {short_name:"{{duoshuo_shortname}}"};
    (function() {
      var ds = document.createElement('script');
      ds.type = 'text/javascript';ds.async = true;
      ds.id = 'duoshuo-script';
      ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
      ds.charset = 'UTF-8';
      (document.getElementsByTagName('head')[0]
      || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
  </script>
    {% if theme.duoshuo_info.ua_enable %}
     {% if theme.duoshuo_info.admin_enable %}
     {% if theme.duoshuo_info.user_id %}
  	  <script type="text/javascript">
  		var duoshuo_user_ID = {{theme.duoshuo_info.user_id}}
      var duoshuo_admin_nickname="{{theme.duoshuo_info.admin_nickname}}"
  	  </script>
     {% endif %}
  	<script src="{{ url_for(theme.js) }}/ua-parser.min.js"></script>
  	<script src="{{ url_for(theme.js) }}/hook-duoshuo.js"></script>
  {% endif %}
{% endif %}
