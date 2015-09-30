$(document).ready(function() {
  $('.content img').not('.group-picture img').each(function () {
    var $image = $(this);
    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
    }

    $imageWrapLink.addClass('fancybox');

    //make sure img title tag will show correctly in fancybox
    if (this.title) {
      $imageWrapLink.attr("title", this.title);
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
