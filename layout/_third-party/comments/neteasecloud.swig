{% if theme.neteasecloud.enable and theme.neteasecloud.productKey %}
  <script>
    var webId = '{{theme.neteasecloud.webId}}';
    var wapId = '{{theme.neteasecloud.wapId}}';
    var cloudTieConfig = {
      url: document.location.href,
      sourceId: "",
      productKey: '{{theme.neteasecloud.productKey}}',
      target: "cloud-tie-wrapper"
    };
    if (webId || wapId) {
      var tempId = webId || wapId
      var yunManualLoad = true;
      Tie.loader(tempId, true);
    }
  </script>
  {% if page.comments %}
    <script src="https://img1.cache.netease.com/f2e/tie/yun/sdk/loader.js"></script>
  {% endif %}
{% endif %}
