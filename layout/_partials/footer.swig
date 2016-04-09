<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT.{{ theme.scheme }}
  </a>
</div>

{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv">{{ theme.busuanzi_count.site_uv_header }}<span class="busuanzi-value" id="busuanzi_value_site_uv"></span>{{ theme.busuanzi_count.site_uv_footer }}</span>
  {% endif %}
  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv">{{ theme.busuanzi_count.site_pv_header }}<span class="busuanzi-value" id="busuanzi_value_site_pv"></span>{{ theme.busuanzi_count.site_pv_footer }}</span>
  {% endif %}
</div>
{% endif %}

{% block footer %}{% endblock %}
