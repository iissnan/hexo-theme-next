$(document).ready(function() {
  $('.content img').each(function () {
    var $image = $(this);
    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
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
