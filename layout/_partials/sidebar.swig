
<div class="sidebar-toggle">
  <div class="sidebar-toggle-line-wrap">
    <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
    <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
    <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
  </div>
</div>

<div id="sidebar" class="sidebar">
  <div class="sidebar-inner">

    {% if is_post() %}
      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc">
          {{ __('sidebar.toc') }}
        </li>
        <li class="sidebar-nav-overview" data-target="site-overview">
          {{ __('sidebar.overview') }}
        </li>
      </ul>
    {% endif %}

    <div class="site-overview">
      <div class="site-author motion-element">
        <img class="site-author-image" src="{{ theme.avatar || url_for(theme.images) + '/default_avatar.jpg' }}" alt="{{ theme.author }}" />
        <p class="site-author-name">{{ theme.author }}</p>
      </div>
      <p class="site-description motion-element">{{ theme.description }}</p>
      <div class="site-state motion-element">
        <div class="site-state-item site-state-posts">
          <span class="site-state-item-count">{{ site.posts.length }}</span>
          <span class="site-state-item-name">{{ __('state.posts') }}</span>
        </div>
        <div class="site-state-item site-state-tags">
            <span class="site-state-item-count">{{ site.tags.length }}</span>
            <span class="site-state-item-name">{{ __('state.tags') }}</span>
        </div>
        <div class="site-state-item site-state-pages">
            <span class="site-state-item-count">{{ site.pages.length }}</span>
            <span class="site-state-item-name">{{ __('state.pages') }}</span>
        </div>
      </div>

      {% if theme.rss %}
        <div class="feed-link motion-element">
          <a href="{{ url_for(theme.rss) }}">
            <i class="menu-item-icon icon-feed"></i>
            RSS
          </a>
        </div>
      {% endif %}

      <div class="social-info motion-element">
        {% if theme.social %}
          {% for name, link in theme.social %}
            <span class="social-item">
              <a href="{{ link }}">{{ name }}</a>
            </span>
          {% endfor %}
        {% endif %}
      </div>

    </div>

    {% if is_post() %}
      <div class="post-toc sidebar-panel-active">
        {{ toc(page.content, {"class": "nav"}) }}
      </div>
    {% endif %}
  </div>
</div>
