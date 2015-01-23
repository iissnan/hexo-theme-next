<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<link rel="stylesheet" type="text/css" href="/vendors/nprogress/nprogress.css"/>
<link rel="stylesheet" type="text/css" href="/css/main.css"/>

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

<title>{% block title %}{% endblock %}</title>