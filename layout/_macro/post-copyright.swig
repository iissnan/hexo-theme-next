{% if theme.post_copyright.enable %}
  <ul class="post-copyright">
    <li class="post-copyright-author">
      <strong>{{ __('post.copyright.author') + __('symbol.colon') }}</strong>
      {{ config.author }}
    </li>
    <li class="post-copyright-history">
      <strong>{{ __('post.copyright.history') + __('symbol.colon') }} </strong>
      <a href="{{ theme.post_copyright.history_url + 'source/_posts/' + String(post.path).split('/')[String(post.path).split('/').length -2] + '.md'}}" title="{{ '《' + post.title + '》'+ '在Github上的迭代日志'}}" target = "_blank">{{ '本文在Github上的迭代日志'}}</a>
    </li>
    <li class="post-copyright-link">
      <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
      <a href="{{ post.permalink }}" title="{{ post.title }}">{{ post.permalink }}</a>
    </li>
    {% if post.wechatmpurl %}
    	<li class="post-copyright-wechatmp">
		<strong>{{ __('post.copyright.feature') + __('symbol.colon') }}</strong>
		{{ theme.post_copyright.feature_prefix }}<a href="{{ post.wechatmpurl }}" target = "_blank"> {{ '《' + post.wechatmptitle + '》' }} </a>
	</li>
    {% endif %}
    <li class="post-copyright-license">
      <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
      {{ __('post.copyright.license_content', theme.post_copyright.license_url, theme.post_copyright.license) }}
    </li>
  </ul>
{% endif %}
