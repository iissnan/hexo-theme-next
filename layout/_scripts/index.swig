{% include './vendors.swig' %}
{% include './commons.swig' %}
{% include './schemes.swig' %}
{% include './boostrap.swig' %}

{% include './third-party/comments.swig' %}
{% include './third-party/tinysou.swig' %}
{% include './third-party/localsearch.swig' %}
{% include './third-party/mathjax.swig' %}
{% include './third-party/lean-analytics.swig' %}
{% include './third-party/baidu-push.swig' %}
{% include '_components/algolia-search/assets.swig' %}

{% if theme.exturl %}
    {% include '_scripts/third-party/exturl.swig' %}
{% endif %}
