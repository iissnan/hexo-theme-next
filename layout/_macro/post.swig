{% macro render(post, is_index, post_extra_class) %}

  {% set headlessPost = Array.prototype.indexOf.call(['quote', 'picture'], post.type) > -1 %}

  {% set post_class = 'post post-type-' + post.type | default('normal') %}
  {% set post_class = post_class + ' ' + post_extra_class | default('') %}
  {% if post.sticky > 0 %}
    {% set post_class = post_class + ' ' + 'post-sticky' %}
  {% endif %}

  <article class="{{ post_class }}" itemscope itemtype="http://schema.org/Article">
    <link itemprop="mainEntityOfPage" href="{{ config.url }}{{ url_for(post.path) }}">

    <span hidden itemprop="author" itemscope itemtype="http://schema.org/Person">
      <meta itemprop="name" content="{{ theme.author }}">
      <meta itemprop="description" content="{{ theme.signature }}">
      <meta itemprop="image" content="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}">
    </span>

    <span hidden itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
      <meta itemprop="name" content="{{ config.title }}">
    </span>

    {% if not headlessPost %}
      <header class="post-header">

        {# Not to show title for quote posts that do not have a title #}
        {% if not (is_index and post.type === 'quote' and not post.title) %}
          <{% if theme.seo %}h2{% else %}h1{% endif %} class="post-title" itemprop="name headline">{#
          #}{# Link posts #}{#
          #}{% if post.link %}
              {% if post.sticky > 0 %}
                {{ post.sticky }}
                <span class="post-sticky-flag" title="{{ __('post.sticky') }}">
                  <i class="fa fa-thumb-tack"></i>
                </span>
              {% endif %}
              <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}" itemprop="url">
                {{ post.title or post.link }}
                <i class="fa fa-external-link"></i>
              </a>
            {% else %}{#
            #}{% if is_index %}
                {% if post.sticky > 0 %}
                  <span class="post-sticky-flag" title="{{ __('post.sticky') }}">
                    <i class="fa fa-thumb-tack"></i>
                  </span>
                {% endif %}
                <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">{#
                #}{{ post.title | default(__('post.untitled'))}}{#
              #}</a>{#
            #}{% else %}{{ post.title }}{% endif %}{#
          #}{% endif %}{#
        #}</{% if theme.seo %}h2{% else %}h1{% endif %}>
        {% endif %}

        <div class="post-meta">
          <span class="post-time">
            {% if theme.post_meta.created_at %}
              <span class="post-meta-item-icon">
                <i class="fa fa-calendar-o"></i>
              </span>
              {% if theme.post_meta.item_text %}
                <span class="post-meta-item-text">{{ __('post.posted') }}</span>
              {% endif %}
              <time title="{{ __('post.created') }}" itemprop="dateCreated datePublished" datetime="{{ moment(post.date).format() }}">
                {{ date(post.date, config.date_format) }}
              </time>
            {% endif %}

            {% if theme.post_meta.created_at and theme.post_meta.updated_at %}
              <span class="post-meta-divider">|</span>
            {% endif %}

            {% if theme.post_meta.updated_at %}
              <span class="post-meta-item-icon">
                <i class="fa fa-calendar-check-o"></i>
              </span>
              {% if theme.post_meta.item_text %}
                <span class="post-meta-item-text">{{ __('post.modified') }}</span>
              {% endif %}
              <time title="{{ __('post.modified') }}" itemprop="dateModified" datetime="{{ moment(post.updated).format() }}">
                {{ date(post.updated, config.date_format) }}
              </time>
            {% endif %}
          </span>

          {% if post.categories and post.categories.length and theme.post_meta.categories %}
            <span class="post-category" >
            {% if theme.post_meta.created_at or theme.post_meta.updated_at %}
              <span class="post-meta-divider">|</span>
            {% endif %}
              <span class="post-meta-item-icon">
                <i class="fa fa-folder-o"></i>
              </span>
              {% if theme.post_meta.item_text %}
                <span class="post-meta-item-text">{{ __('post.in') }}</span>
              {% endif %}
              {% for cat in post.categories %}
                <span itemprop="about" itemscope itemtype="http://schema.org/Thing">
                  <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
                    <span itemprop="name">{{ cat.name }}</span>
                  </a>
                </span>

                {% set cat_length = post.categories.length %}
                {% if cat_length > 1 and loop.index !== cat_length %}
                  {{ __('symbol.comma') }}
                {% endif %}
              {% endfor %}
            </span>
          {% endif %}

          {% if post.comments %}
            {% if (theme.duoshuo and theme.duoshuo.shortname) or theme.duoshuo_shortname %}
              <span class="post-comments-count">
                <span class="post-meta-divider">|</span>
                <span class="post-meta-item-icon">
                  <i class="fa fa-comment-o"></i>
                </span>
                <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
                  <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}" itemprop="commentCount"></span>
                </a>
              </span>
            {% elseif theme.facebook_comments_plugin.enable %}
              <span class="post-comments-count">
                <span class="post-meta-divider">|</span>
                <span class="post-meta-item-icon">
                  <i class="fa fa-comment-o"></i>
                </span>
                <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
                  <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span> comments
                </a>
              </span>
            {% elseif theme.disqus.enable and theme.disqus.count %}
              <span class="post-comments-count">
                <span class="post-meta-divider">|</span>
                <span class="post-meta-item-icon">
                  <i class="fa fa-comment-o"></i>
                </span>
                <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
                  <span class="post-comments-count disqus-comment-count"
                        data-disqus-identifier="{{ post.path }}" itemprop="commentCount"></span>
                </a>
              </span>
            {% elseif theme.hypercomments_id %}
            <!--noindex-->
              <span class="post-comments-count">
                <span class="post-meta-divider">|</span>
                <span class="post-meta-item-icon">
                  <i class="fa fa-comment-o"></i>
                </span>
                <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
                  <span class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>
                </a>
              </span>
              <!--/noindex-->
            {% elseif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
              <span class="post-comments-count">
              <span class="post-meta-divider">|</span>
              <span class="post-meta-item-icon">
                <i class="fa fa-comment-o"></i>
              </span>
              {% if is_post() %}
                <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
                  <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentsCount"></span>
                </a>
              {% else %}
                <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
                  <span id="url::{{ post.permalink }}" class="cy_cmt_count" data-xid="{{ post.path }}" itemprop="commentsCount" ></span>
                </a>
              {% endif %}
            {% endif %}
          {% endif %}

          {# LeanCould PageView #}
          {% if theme.leancloud_visitors.enable %}
             <span id="{{ url_for(post.path) }}" class="leancloud_visitors" data-flag-title="{{ post.title }}">
               <span class="post-meta-divider">|</span>
               <span class="post-meta-item-icon">
                 <i class="fa fa-eye"></i>
               </span>
               {% if theme.post_meta.item_text %}
                 <span class="post-meta-item-text">{{__('post.visitors')}} </span>
               {% endif %}
                 <span class="leancloud-visitors-count"></span>
             </span>
          {% endif %}

          {% if not is_index and theme.busuanzi_count.enable and theme.busuanzi_count.page_pv %}
            <span class="post-meta-divider">|</span>
            <span class="page-pv">{{ theme.busuanzi_count.page_pv_header }}
            <span class="busuanzi-value" id="busuanzi_value_page_pv" ></span>{{ theme.busuanzi_count.page_pv_footer }}
            </span>
          {% endif %}

          {% if theme.post_wordcount.wordcount or theme.post_wordcount.min2read %}
            <div class="post-wordcount">
              {% if theme.post_wordcount.wordcount %}
                {% if not theme.post_wordcount.separated_meta %}
                  <span class="post-meta-divider">|</span>
                {% endif %}
                <span class="post-meta-item-icon">
                  <i class="fa fa-file-word-o"></i>
                </span>
                {% if theme.post_wordcount.item_text %}
                  <span class="post-meta-item-text">{{ __('post.wordcount') }}</span>
                {% endif %}
                <span title="{{ __('post.wordcount') }}">
                  {{ wordcount(post.content) }}
                </span>
              {% endif %}

              {% if theme.post_wordcount.wordcount and theme.post_wordcount.min2read %}
                <span class="post-meta-divider">|</span>
              {% endif %}

              {% if theme.post_wordcount.min2read %}
                <span class="post-meta-item-icon">
                  <i class="fa fa-clock-o"></i>
                </span>
                {% if theme.post_wordcount.item_text %}
                  <span class="post-meta-item-text">{{ __('post.min2read') }}</span>
                {% endif %}
                <span title="{{ __('post.min2read') }}">
                  {{ min2read(post.content) }}
                </span>
              {% endif %}
            </div>
          {% endif %}

          {% if post.description and (not theme.excerpt_description or not is_index) %}
              <div class="post-description">
                  {{ post.description }}
              </div>
          {% endif %}

        </div>
      </header>
    {% endif %}

    <div class="post-body{% if theme.han %} han-init-context{% endif %}" itemprop="articleBody">

      {# Gallery support #}
      {% if post.photos and post.photos.length %}
        <div class="post-gallery" itemscope itemtype="http://schema.org/ImageGallery">
          {% set COLUMN_NUMBER = 3 %}
          {% for photo in post.photos %}
            {% if loop.index0 % COLUMN_NUMBER === 0 %}<div class="post-gallery-row">{% endif %}
              <a class="post-gallery-img fancybox"
                 href="{{ url_for(photo) }}" rel="gallery_{{ post._id }}"
                 itemscope itemtype="http://schema.org/ImageObject" itemprop="url">
                <img src="{{ url_for(photo) }}" itemprop="contentUrl"/>
              </a>
            {% if loop.index0 % COLUMN_NUMBER === 2 %}</div>{% endif %}
          {% endfor %}

          {# Append end tag for `post-gallery-row` when (photos size mod COLUMN_NUMBER) is less than COLUMN_NUMBER #}
          {% if post.photos.length % COLUMN_NUMBER > 0 %}</div>{% endif %}
        </div>
      {% endif %}

      {% if is_index %}
        {% if post.description and theme.excerpt_description %}
          {{ post.description }}
          <!--noindex-->
          <div class="post-button text-center">
            <a class="btn" href="{{ url_for(post.path) }}">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
          <!--/noindex-->
        {% elif post.excerpt  %}
          {{ post.excerpt }}
          <!--noindex-->
          <div class="post-button text-center">
            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#{{ __('post.more') }}{% endif %}" rel="contents">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
          <!--/noindex-->
        {% elif theme.auto_excerpt.enable %}
          {% set content = post.content | striptags %}
          {{ content.substring(0, theme.auto_excerpt.length) }}
          {% if content.length > theme.auto_excerpt.length %}...{% endif %}
          <!--noindex-->
          <div class="post-button text-center">
            <a class="btn" href="{{ url_for(post.path) }}{% if theme.scroll_to_more %}#{{ __('post.more') }}{% endif %}" rel="contents">
              {{ __('post.read_more') }} &raquo;
            </a>
          </div>
          <!--/noindex-->
        {% else %}
          {% if post.type === 'picture' %}
            <a href="{{ url_for(post.path) }}">{{ post.content }}</a>
          {% else %}
            {{ post.content }}
          {% endif %}
        {% endif %}
      {% else %}
        {{ post.content }}
      {% endif  %}
    </div>

    <div>
      {% if not is_index %}
        {% include 'wechat-subscriber.swig' %}
      {% endif %}
    </div>

    <div>
      {% if not is_index %}
        {% include 'reward.swig' %}
      {% endif %}
    </div>

    <div>
      {% if not is_index %}
        {% include 'post-copyright.swig' with { post: post } %}
      {% endif %}
    </div>

    <footer class="post-footer">
      {% if post.tags and post.tags.length and not is_index %}
        <div class="post-tags">
          {% for tag in post.tags %}
            <a href="{{ url_for(tag.path) }}" rel="tag"># {{ tag.name }}</a>
          {% endfor %}
        </div>
      {% endif %}

      {% if not is_index %}
      {% if theme.rating.enable or (theme.vkontakte_api.enable and theme.vkontakte_api.like) or (theme.facebook_sdk.enable and theme.facebook_sdk.like_button) %}
        <div class="post-widgets">
        {% if theme.rating.enable %}
          <div class="wp_rating">
            <div id="wpac-rating"></div>
          </div>
        {% endif %}

        {% if (theme.vkontakte_api.enable and theme.vkontakte_api.like) or (theme.facebook_sdk.enable and theme.facebook_sdk.like_button) %}
          <div class="social-like">
            {% if theme.vkontakte_api.enable and theme.vkontakte_api.like %}
              <div class="vk_like">
                <span id="vk_like"></span>
              </div>
            {% endif %}

            {% if theme.facebook_sdk.enable and theme.facebook_sdk.like_button %}
              <div class="fb_like">
                <div class="fb-like" data-layout="button_count" data-share="true"></div>
              </div>
            {% endif %}
          </div>
        {% endif %}
        </div>
      {% endif %}
      {% endif %}

      {% if not is_index and (post.prev or post.next) %}
        <div class="post-nav">
          <div class="post-nav-next post-nav-item">
            {% if post.next %}
              <a href="{{ url_for(post.next.path) }}" rel="next" title="{{ post.next.title }}">
                <i class="fa fa-chevron-left"></i> {{ post.next.title }}
              </a>
            {% endif %}
          </div>

          <span class="post-nav-divider"></span>

          <div class="post-nav-prev post-nav-item">
            {% if post.prev %}
              <a href="{{ url_for(post.prev.path) }}" rel="prev" title="{{ post.prev.title }}">
                {{ post.prev.title }} <i class="fa fa-chevron-right"></i>
              </a>
            {% endif %}
          </div>
        </div>
      {% endif %}

      {% set isLast = loop.index % page.per_page === 0 %}
      {% if is_index and not isLast %}
        <div class="post-eof"></div>
      {% endif %}
    </footer>
  </article>

{% endmacro %}
