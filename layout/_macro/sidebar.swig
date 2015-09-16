{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {% if is_post %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap" >
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview">

      <div class="search-box">
        <textarea class="st-default-search-input" ></textarea>
      </div>

      <div class="tag-box">
        <a class="tag-anchor" href='/tags/lang-Chinese/'>All Chinese Posts</a>
        <a class="tag-anchor" href='/tags/lang-English/'>All English Posts</a>
      </div>

      {% if hasSearch %}
        <div class="site-search">
          {% include '../_partials/search.swig' %}
        </div>
      {% endif %}

      </section>

      {% if is_post %}
        <section class="post-toc-wrap sidebar-panel-active">
          <div class="post-toc-indicator-top post-toc-indicator"></div>
          <div class="post-toc">
            {% set toc = toc(page.content, {"class": "nav", list_number: theme.toc_list_number}) %}
            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}
          </div>
          <div class="post-toc-indicator-bottom post-toc-indicator"></div>
        </section>
      {% endif %}

    </div>
  </aside>
{% endmacro %}
