{% if theme.gitment.owner %}
    <link rel='stylesheet' href='https://imsun.github.io/gitment/style/default.css'>
    <style>
        .gitment-editor-avatar {
            border-bottom: none !important;
        }
        .gitment-container a:hover {
            text-decoration: none !important;
        }
        .gitment-markdown a,
        .gitment-footer-project-link {
            color: #555 !important;
        }
        .gitment-footer-project-link:hover,
        .gitment-editor-logout-link:hover,
        .gitment-editor-footer-tip:hover,
        .gitment-header-issue-link:hover,
        .gitment-comment-name:hover,
        .gitment-markdown a:hover {
            color: #222 !important;
        }
    </style>
    <script src='https://imsun.github.io/gitment/dist/gitment.browser.js'></script>
    <script type='text/javascript'>
        (function() {
            var id = window.location.pathname.replace(/(\/$)/g, '');
            var owner = '{{theme.gitment.owner}}';
            var repo = '{{theme.gitment.repo}}';
            var clientId = '{{theme.gitment.client_id}}';
            var clientSecret = '{{theme.gitment.client_secret}}';

            var gitment = new Gitment({
                id: id,
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