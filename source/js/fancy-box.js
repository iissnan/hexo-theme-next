$(document).ready(function() {
  $('.content img').not('.group-picture img').each(function () {

    var $image = $(this);
    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
    }

    $imageWrapLink.addClass('fancybox');

    if ($image.attr("title")) {
      $imageWrapLink.append('<div class="pic-title"><span>' + $image.attr("title") + '</span></div>');

      //make sure img title tag will show correctly in fancybox
      $imageWrapLink.attr("title", $image.attr("title"));
    }
  });
});

$('.fancybox').fancybox({
  helpers: {
    overlay: {
      locked: false
    }
  }
});


