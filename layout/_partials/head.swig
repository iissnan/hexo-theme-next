{% if theme.rss === '' and config.feed and config.feed.path %}
    {% set theme.rss = config.root + config.feed.path %}
{% endif %}

<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

{# #238, Disable Baidu tranformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

{% if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}" />
{% endif %}

{% if theme.qihu_site_verification %}
  <meta name="360-site-verification" content="{{ theme.qihu_site_verification }}" />
{% endif %}

{% if theme.fancybox %}
  <link rel="stylesheet" type="text/css" href="{{ url_for(theme.vendors) }}/fancybox/source/jquery.fancybox.css?v=2.1.5"/>
{% endif %}

{% if config.language !== 'zh-Hans' and theme.use_font_lato %}
  <link href='//fonts.googleapis.com/css?family=Lato:300,400,700,400italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
{% endif %}

<link rel="stylesheet" type="text/css" href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}"/>

{% if config.description %}
    <meta name="description" content="{{ config.description }}" />
{% endif %}

{% if page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}

{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}

{% if theme.favicon %}
  <link rel="shorticon icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}?v={{ theme.version }}" />
{% endif %}

{{ open_graph({
  twitter_id: theme.twitter,
  google_plus: theme.google_plus,
  fb_admins: theme.fb_admins,
  fb_app_id: theme.fb_app_id}) }}

{# HEXO CONFIGURATIONS #}
<script type="text/javascript" id="hexo.configuration">
  var CONFIG = {
    scheme: '{{ theme.scheme }}',
    sidebar: '{{ theme.sidebar }}'
  };
</script>
