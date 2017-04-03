{% if theme.algolia_search.enable %}
  {% include '../_third-party/search/algolia-search/dom.swig' %}
{% elseif theme.swiftype_key %}
  {% include 'search/swiftype.swig' %}
{% elseif theme.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% elseif theme.local_search.enable %}
  {% include 'search/localsearch.swig' %}
{% endif %}
