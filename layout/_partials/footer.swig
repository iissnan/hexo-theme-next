<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.footer.since and theme.footer.since != current %} {{ theme.footer.since }} &mdash; {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.footer.icon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>

  {% if theme.post_wordcount.totalcount %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.post_wordcount.item_text %}
      <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>
    {% endif %}
    <span title="{{ __('post.totalcount') }}">
      {{ totalcount(site, '0,0.0a') }}
    </span>
  {% endif %}
</div>

{% if theme.footer.powered %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" href="https://hexo.io">Hexo</a>') }}{#
#}</div>

  {% if theme.footer.theme %}
    <span class="post-meta-divider">|</span>
    <div class="theme-info">{#
    #}{{ __('footer.theme') }} &mdash; {#
    #}<a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">{#
      #}NexT.{{ theme.scheme }}{#
    #}</a>{% if theme.footer.version %} v{{ theme.version }}{% endif %}{#
  #}</div>
  {% endif %}

  {% if theme.footer.custom_text %}
    <span class="post-meta-divider">|</span>
    <div class="powered-by">{#
    #}{{ theme.footer.custom_text }}{#
  #}</div>
  {% endif %}
{% endif %}
