{% if theme.gitment.owner %}
    <link rel='stylesheet' href='http://imsun.github.io/gitment/style/default.css'>
    <script src='http://imsun.github.io/gitment/dist/gitment.browser.js'></script>
    <script type='text/javascript'>
        (function() {
            var id = '{{theme.gitment.id}}';
            var owner = '{{theme.gitment.owner}}';
            var repo = '{{theme.gitment.repo}}';
            var clientId = '{{theme.gitment.client_id}}';
            var clientSecret = '{{theme.gitment.client_secret}}';

            var gitment = new Gitment({
                owner: owner,
                repo: repo,
                oauth: {
                    client_id: clientId,
                    client_secret: clientSecret,
                },
            });
            gitment.render('comments');
        })();
    </script>
{% endif %}