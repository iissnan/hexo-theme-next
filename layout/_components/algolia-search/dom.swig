{% if theme.algolia_search.enable %}
  <div class="popup">
    <div class="algolia-search">
      <div id="algolia-search-input"></div>
      <div id="algolia-search-input-icon"></div>
    </div>

    <div class="algolia-results">
      <div id="algolia-stats"></div>
      <div id="algolia-hits"></div>
      <div id="algolia-pagination"></div>
    </div>

    <span class="popup-btn-close">
      <i class="fa fa-times"></i>
    </span>
  </div>
{% endif %}
