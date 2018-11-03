{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
  <script src="/js/src/md5.min.js"></script>
  <script type="text/javascript">
    var gitalk = new Gitalk({
      clientID: '{{ theme.gitalk.ClientID }}',
      clientSecret: '{{ theme.gitalk.ClientSecret }}',
      repo: '{{ theme.gitalk.repo }}',
      owner: '{{ theme.gitalk.githubID }}',
      admin: ['{{ theme.gitalk.adminUser }}'],
      id: md5(location.pathname),
      distractionFreeMode: '{{ theme.gitalk.distractionFreeMode }}'
    })
    gitalk.render('gitalk-container')           
  </script>
{% endif %}