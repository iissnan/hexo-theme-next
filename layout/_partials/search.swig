{% if config.swiftype_key %}
  {% include 'search/swiftype.swig' %}
{% elseif config.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% endif %}
<div class="site-search-toggle"></div>