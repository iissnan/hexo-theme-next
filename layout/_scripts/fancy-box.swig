{% if theme.fancybox %}
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/fancybox/source/jquery.fancybox.pack.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('.content img').each(function () {
        var $image = $(this);
        var $imageWrapLink = $image.parent('a').addClass('fancybox');

        if ($imageWrapLink.size() < 1) {
          $image.wrap('<a href="' + this.getAttribute('src') + '"></a>');
        }
        $imageWrapLink.addClass('fancybox');
      });
    });
    $('.fancybox').fancybox({
      helpers: {
        overlay: {
          locked: false
        }
      }
    });
  </script>
{% endif %}