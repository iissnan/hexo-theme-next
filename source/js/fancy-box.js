$(document).ready(function() {

  $('.content img').each(function () {
    var $image = $(this);
    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
    }
    $imageWrapLink.addClass('fancybox');
    if ($image.attr("alt")) {
      $imageWrapLink.append('<div class="pic-title"><span>' + $image.attr("alt") + '</span></div>');
      $imageWrapLink.attr("title",$image.attr("alt")); //make sure img title tag will show correctly in fancybox
    };
  });
});
$('.fancybox').fancybox({
  helpers: {
    overlay: {
      locked: false
    }
  }
});


