$(document).ready(function () {

  isMobile() && FastClick.attach(document.body);

  $("#posts").find('img').lazyload({
    placeholder: "/images/loading.gif",
    effect: "fadeIn"
  });

  $('.back-to-top').on('click', function () {
    $('body').velocity('scroll');
  });

  $('.site-nav-toggle button').on('click', function () {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', function () {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });


  CONFIG.fancybox && addFancyBox();

  addActiveClassToMenuItem();

  function addFancyBox () {
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

    $('.fancybox').fancybox({
      helpers: {
        overlay: {
          locked: false
        }
      }
    });
  }

  function addActiveClassToMenuItem () {
    var path = location.pathname;
    path = path === '/' ? path : path.substring(0, path.length - 1);
    $('.menu-item a[href="' + path + '"]').parent().addClass('menu-item-active');
  }

  // TODO: Isolate Scheme-oriented scripts.
  if (isPisces()) {
    var $sidebar = $('#sidebar');
    var headerHeight = $('.header-inner').height();
    $sidebar
      .css({ 'margin-top': headerHeight + 10 })
      .show();
  }

  // Define Motion Sequence.
  motionIntegrator
    .add(motionMiddleWares.logo)
    .add(motionMiddleWares.menu)
    .add(motionMiddleWares.postList)
    .add(motionMiddleWares.sidebar);

  // Bootstrap Motion.
  CONFIG.motion && motionIntegrator.bootstrap();
});
