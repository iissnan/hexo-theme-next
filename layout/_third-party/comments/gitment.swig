{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname %}
{% if theme.gitment.enable and theme.gitment.client_id %}
<!-- LOCAL: You can save these files to your site and update links -->
    {% if theme.gitment.mint %}
        {% set CommentsClass = "Gitmint" %}
        <link rel="stylesheet" href="https://aimingoo.github.io/gitmint/style/default.css">
        <script src="https://aimingoo.github.io/gitmint/dist/gitmint.browser.js"></script>
    {% else %}
        {% set CommentsClass = "Gitment" %}
        <link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
        <script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
    {% endif %}
<!-- END LOCAL -->

    {% if theme.gitment.cleanly %}
      <style>
        a.gitment-editor-footer-tip { display: none; }
        .gitment-container.gitment-footer-container { display: none; }
      </style>
    {% endif %}

    {% if page.comments %}
      <script type="text/javascript">
      function renderGitment(){
        var gitment = new {{CommentsClass}}({
            id: window.location.pathname, 
            owner: '{{ theme.gitment.github_user }}',
            repo: '{{ theme.gitment.github_repo }}',
            {% if theme.gitment.mint %}
            lang: "{{ theme.gitment.language }}" || navigator.language || navigator.systemLanguage || navigator.userLanguage,
            {% endif %}
            oauth: {
            {% if theme.gitment.mint and theme.gitment.redirect_protocol %}
                redirect_protocol: '{{ theme.gitment.redirect_protocol }}',
            {% endif %}
            {% if theme.gitment.mint and theme.gitment.proxy_gateway %}
                proxy_gateway: '{{ theme.gitment.proxy_gateway }}',
            {% else %}
                client_secret: '{{ theme.gitment.client_secret }}',
            {% endif %}
                client_id: '{{ theme.gitment.client_id }}'
            }});
        gitment.render('gitment-container');
      }

      {% if not theme.gitment.lazy %}
      renderGitment();
      {% else %}
      function showGitment(){
        document.getElementById("gitment-display-button").style.display = "none";
        document.getElementById("gitment-container").style.display = "block";
        renderGitment();
      }
      {% endif %}
      </script>
    {% endif %}

{% endif %}
{% endif %}
