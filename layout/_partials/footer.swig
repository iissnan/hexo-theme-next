<div class="copyright">
  &copy; &nbsp; {% if theme.since %} {{ theme.since }} - {% endif %}
  {{ date(Date.now(), "YYYY") }} &hearts;
  <span class="author">{{ config.author }}</span>
</div>

<div class="powered-by">
  Powered By <a class="theme-link" href="http://hexo.io">Hexo</a>
</div>

<div class="theme-info">
  Theme - <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">NextT</a>
</div>

{% block footer %}{% endblock %}