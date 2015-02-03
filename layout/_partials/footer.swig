<div class="copyright">
  {% set current = date(Date.now(), "YYYY") %}
  &copy; &nbsp; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  {{ current }}
  <span class="with-love">&hearts;</span>
  <span class="author">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered') }} - <a class="theme-link" href="http://hexo.io">Hexo</a>
</div>

<div class="theme-info">
  {{ __('footer.theme') }} - <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">NexT</a>
</div>

{% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'public': 1} %}
{% if theme.creative_commons in cc %}
  <div class="cc-license">
    <a href="http://creativecommons.org/licenses/{{ theme.creative_commons }}/4.0" class="cc-opacity" target="_blank">
      <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.png" alt="Creative Commons" />
    </a>
  </div>
{% endif %}

{% block footer %}{% endblock %}