{% if theme.post_copyright.enable %}
  <div style="background-color: #f9f9f9; margin-top: 2em; border-left:3px solid #ff1700; padding:.5em 1em;">
    <strong>本文链接:</strong> <a href="{{ config.url }}{{ url_for(path) }}" title="{{ title }}">{{ config.url }}{{ url_for(path) }}</a>
    <br>
    <strong>版权声明:</strong>本博客所有文章除特别声明外，均采用<a href="{{ theme.post_copyright.license_url }}" rel="external nofollow" target="_blank">{{ theme.post_copyright.license }}</a>许可协议。转载请注明出处！<br>
  </div>
{% endif %}
