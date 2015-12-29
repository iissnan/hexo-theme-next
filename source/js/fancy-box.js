$(document).ready(function() {
  $('.content img').not('.group-picture img').each(function () {

    var $image = $(this);
    var imageTitle = $image.attr('title');
    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
    }

    $imageWrapLink.addClass('fancybox');
    $imageWrapLink.attr('rel', 'group');

    if (imageTitle) {
      $imageWrapLink.append('<p class="image-caption">' + imageTitle + '</p>');
      $imageWrapLink.attr("title", imageTitle); //make sure img title tag will show correctly in fancybox
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