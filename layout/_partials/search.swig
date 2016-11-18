{% if theme.algolia_search.enable %}
  {% include '../_components/algolia-search/dom.swig' %}
{% elseif theme.swiftype_key %}
  {% include 'search/swiftype.swig' %}
{% elseif theme.tinysou_Key %}
  {% include 'search/tinysou.swig' %}
{% elseif config.search.path %}
  {% include 'search/localsearch.swig' %}
{% endif %}
