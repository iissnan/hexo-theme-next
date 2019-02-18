<header class="post-header">

	<{% if theme.seo %}h2{% else %}h1{% endif %} class="post-title" itemprop="name headline">{{ page.title }}</{% if theme.seo %}h2{% else %}h1{% endif %}>

{% if page.description %}
	<div class="post-meta">
		<div class="post-description">{{ page.description }}</div>
	</div>
{% endif %}

</header>
