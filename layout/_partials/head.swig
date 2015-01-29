<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

{% if theme.fancybox %}
  <link rel="stylesheet" type="text/css" href="/vendors/fancybox/source/jquery.fancybox.css?v=2.1.5"/>
{% endif %}

<link rel="stylesheet" type="text/css" href="/css/main.css?v={{ theme.version }}"/>

{% if config.description %}
    <meta name="description" content="{{ config.description }}" />
{% endif %}

{% if theme.rss %}
    <link rel="alternate" href="{{ theme.rss }}"
          title="{{ config.title }}" type="application/atom+xml" />
{% endif %}

{% if theme.favicon %}
    <link rel="icon" type="image/x-icon" href="{{ theme.favicon }}" />
{% endif %}

