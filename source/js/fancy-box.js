$(document).ready(function() {
  $('.content img').each(function () {
    var $image = $(this);

    // Disable fancybox for elements of class 'no-fancy'
    try {
      if ($image.attr('class').indexOf('no-fancy') !== -1) { return; }
    } catch (error) {
    };

    var $imageWrapLink = $image.parent('a');

    if ($imageWrapLink.size() < 1) {
      $imageWrapLink = $image.wrap('<a href="' + this.getAttribute('src') + '"></a>').parent('a');
    }
    $imageWrapLink.addClass('fancybox');
    if(this.title){
      $imageWrapLink.attr("title",this.title); //make sure img title tag will show correctly in fancybox
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
