{% if page.comments %}
  {% if page.comments_show %}
    <div class="comments" id="comments">
      {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
        <div class="ds-thread" data-thread-key="{{ page.path }}"
             data-title="{{ page.title }}" data-url="{{ page.permalink }}">
        </div>
      {% elseif theme.disqus_shortname %}
        <div id="disqus_thread">
          <noscript>
            Please enable JavaScript to view the
            <a href="//disqus.com/?ref_noscript">comments powered by Disqus.</a>
          </noscript>
        </div>
      {% endif %}
    </div>
  {% else %}
    <div class="feed-link text-center">
      <a href="{{ url_for(theme.menu.about) }}">
        给我留言
        <i class="fa fa-spinner fa-spin"></i>
      </a>
    </div>
  {% endif %}
{% endif %}
