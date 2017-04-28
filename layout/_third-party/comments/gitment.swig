{% if theme.gitment.enable %}
    {% set owner = theme.gitment.githubID %}
    {% set repo = theme.gitment.repo %}
    {% set cid = theme.gitment.ClientID %}
    {% set cs = theme.gitment.ClientSecret %}
    <link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
    <script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
    {% if not theme.gitment.lazy %}
        <script type="text/javascript">
            var gitment = new Gitment({
                id: document.location.href, 
                owner: '{{owner}}',
                repo: '{{repo}}',
                oauth: {
                    client_id: '{{cid}}',
                    client_secret: '{{cs}}',
                }});
            gitment.render('gitment-container');
        </script>
    {% else %}
        <script type="text/javascript">
            function ShowGitment(){
                document.getElementById("gitment-display-button").style.display = "none";
                document.getElementById("gitment-container").style.display = "block";
                var gitment = new Gitment({
                    id: document.location.href, 
                    owner: '{{owner}}',
                    repo: '{{repo}}',
                    oauth: {
                        client_id: '{{cid}}',
                        client_secret: '{{cs}}',
                    }});
                gitment.render('gitment-container');
            }
        </script>
    {% endif %}
{% endif %}