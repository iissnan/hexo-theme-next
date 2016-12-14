{% if not (theme.duoshuo and theme.duoshuo.shortname) and not theme.duoshuo_shortname and not theme.disqus_shortname %}

	{% if theme.hypercomments_id %}

		<script type="text/javascript">
		_hcwp = window._hcwp || [];

		_hcwp.push({widget:"Bloggerstream", widget_id: {{ theme.hypercomments_id }}, selector:".hc-comment-count", label: "{\%COUNT%\}" });

		{% if page.comments %}
		_hcwp.push({widget:"Stream", widget_id: {{ theme.hypercomments_id }}, xid: "{{ page.path }}"});
		{% endif %}

		(function() {
		if("HC_LOAD_INIT" in window)return;
		HC_LOAD_INIT = true;
		var lang = (navigator.language || navigator.systemLanguage || navigator.userLanguage || "en").substr(0, 2).toLowerCase();
		var hcc = document.createElement("script"); hcc.type = "text/javascript"; hcc.async = true;
		hcc.src = ("https:" == document.location.protocol ? "https" : "http")+"://w.hypercomments.com/widget/hc/{{ theme.hypercomments_id }}/"+lang+"/widget.js";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hcc, s.nextSibling);
		})();
		</script>

	{% endif %}

{% endif %}
