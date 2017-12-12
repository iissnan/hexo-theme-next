{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}
  {% if theme.disqus.enable %}

    {% if page.comments %}
      <script type="text/javascript">
        var disqus_config = function () {
          this.page.url = '{{ page.permalink }}';
          this.page.identifier = '{{ page.path }}';
          this.page.title = '{{ page.title| addslashes }}';
        }
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
<script>
var serviceWorkerUri='/sw.js';
if('serviceWorker'in navigator){navigator.serviceWorker.register(serviceWorkerUri).then(function(){if(navigator.serviceWorker.controller){console.log('Assets cached by the controlling service worker toolbox.')}else{console.log('Please reload this page to allow the service worker to handle network operations.')}}).catch(function(error){console.log('ERROR: '+error)})}else{console.log('Service workers are not supported in the current browser.')};
window.addEventListener('beforeinstallprompt',event=>{event.userChoice.then(result=>{console.log(result.outcome)})});
</script>
