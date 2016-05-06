{% if theme.algolia_search.enable %}

  {% set algolia_instant_css = url_for(theme.vendors._internal + '/algolia-instant-search/instantsearch.min.css') %}
  {% if theme.vendors.algolia_instant_css %}
    {% set algolia_instant_css = theme.vendors.algolia_instant_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ theme.vendors.algolia_instant_css }}">

  {% raw %}
  <script type="text/html" id="algolia-hit-template">
    <div class="hit">
      <div class="hit-content">
        <h3 class="hit-title">
          <a href="/{{ path }}">{{{ _highlightResult.title.value }}}</a>
        </h3>
      </div>
    </div>
  </script>
  <script type="text/html" id="algolia-no-results-template">
    <div id="no-results-message">
      <p>We didn't find any results for the search <em>"{{query}}"</em>.</p>
      <a href="." class='clear-all'>Clear search</a>
    </div>
  </script>
  {% endraw %}

  {% set algolia_instant_js = url_for(theme.vendors._internal + '/algolia-instant-search/instantsearch.min.js') %}
  {% if theme.vendors.algolia_instant_js %}
    {% set algolia_instant_js = theme.vendors.algolia_instant_js %}
  {% endif %}
  <script src="{{ algolia_instant_js }}"></script>

  <script>
    $(document).ready(function () {
      var search = instantsearch({
        appId: '{{ theme.algolia.applicationID }}',
        apiKey: '{{ theme.algolia.apiKey }}',
        indexName: '{{ theme.algolia.indexName }}',
        searchFunction: function (helper) {
          if ( $('#algolia-search-input').find('input').val() !== '' ) {
            helper.search();
          }
        }
      });

      // Registering Widgets
      [
        instantsearch.widgets.searchBox({
          container: '#algolia-search-input',
          placeholder: '{{ theme.algolia_search.input.placeholder }}'
        }),

        instantsearch.widgets.hits({
          container: '#algolia-hits',
          hitsPerPage: 10,
          templates: {
            item: getTemplate('hit'),
            empty: getTemplate('no-results')
          }
        }),

        instantsearch.widgets.stats({
          container: '#algolia-stats'
        }),

        instantsearch.widgets.pagination({
          container: '#algolia-pagination',
          scrollTo: false,
          showFirstLast: false,
          labels: {
            first: '<i class="fa fa-angle-double-left"></i>',
            last: '<i class="fa fa-angle-double-right"></i>',
            previous: '<i class="fa fa-angle-left"></i>',
            next: '<i class="fa fa-angle-right"></i>'
          },
          cssClasses: {
            root: 'pagination',
            item: 'pagination-item',
            link: 'page-number',
            active: 'current',
            disabled: 'disabled-item'
          }
        })
      ].forEach(search.addWidget, search);

      search.start();

      function getTemplate(name) {
        return document.querySelector('#algolia-' + name + '-template').innerHTML;
      }

      $('.popup-trigger').on('click', function(e) {
        e.stopPropagation();
        $("body").append('<div class="popoverlay">').css('overflow', 'hidden');
        $('.popup').toggle();
      });

      $('.popup-btn-close').click(function(){
        $('.popup').hide();
        $(".popoverlay").remove();
        $('body').css('overflow', '');
      });

    });
  </script>
{% endif %}
