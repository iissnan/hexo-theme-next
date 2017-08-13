{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  
  <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/valine@1.1.4/dist/Valine.min.js"></script>
  <script type="text/javascript">
    new Valine({
        av: AV,
        el: '#vcomments' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        app_id: '{{ theme.valine.appid }}',
        app_key: '{{ theme.valine.appkey }}',
        placeholder: '{{ theme.valine.placeholder }}'
    });
  </script>
{% endif %}
