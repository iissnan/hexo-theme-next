{%
  set scripts = [
    'src/affix.js'
  ]
%}

{% for script in scripts %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/{{ script }}?v={{ theme.version }}"></script>
{% endfor %}

<script type="text/javascript">
  $(document).ready(function () {
    var $sidebar = $('#sidebar');
    var headerHeight = $('.header-inner').height();
    var footerOffset = parseInt($('.main').css('padding-bottom'), 10);
    var sidebarTop = headerHeight + 10;

    $sidebar
      .css({ 'margin-top': sidebarTop })
      .show();

    $('.page-post-detail .sidebar-inner').affix({
      offset: {
        top: sidebarTop,
        bottom: footerOffset
      }
    });
  });
</script>
