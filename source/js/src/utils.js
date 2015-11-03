/* global NexT: true */

NexT.utils = NexT.$u = {
  /**
   * Wrap images with fancybox support.
   */
  wrapImageWithFancyBox: function () {
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
  },

  /**
   * Transform embedded video to support responsive layout.
   * @see http://toddmotto.com/fluid-and-responsive-youtube-and-vimeo-videos-with-fluidvids-js/
   */
  embeddedVideoTransformer: function () {
    var $iframes = $('iframe');

    /*
     * Supported Players. Extend this if you need more players.
     */
    var SUPPORTED_PLAYERS = [
      'www.youtube.com',
      'player.vimeo.com',
      'player.youku.com',
      'music.163.com',
      'www.tudou.com'
    ];
    var pattern = new RegExp(SUPPORTED_PLAYERS.join('|'));

    $iframes.each(function () {
      var iframe = this;
      var $iframe = $(this);

      if (this.src.search(pattern) > 0) {
        /*
         * Calculate the video ratio based on the iframe's w/h dimensions
         */
        var videoRatio = ( $iframe.height() / $iframe.width() ) * 100;

        // Add height for 163 music.
        (this.src.search('music.163.com') > 0) && (videoRatio += 10);

        /*
         * Replace the iframe's dimensions and position
         * the iframe absolute, this is the trick to emulate
         * the video ratio
         */
        $iframe
          .width('100%')
          .height('100%')
          .css({
            position: 'absolute',
            top: '0',
            left: '0'
          });

        /*
         * Wrap the iframe in a new <div> which uses a
         * dynamically fetched padding-top property based
         * on the video's w/h dimensions
         */
        var wrap = document.createElement('div');
        wrap.className = 'fluid-vids';
        wrap.style.width = '100%';
        wrap.style.position = 'relative';
        wrap.style.paddingTop = videoRatio + '%';

        /*
         * Add the iframe inside our newly created <div>
         */
        var iframeParent = iframe.parentNode;
        iframeParent.insertBefore(wrap, iframe);
        wrap.appendChild(iframe);
      }
    });
  },

  /**
   * Add `menu-item-active` class name to menu item
   * via comparing location.path with menu item's href.
   */
  addActiveClassToMenuItem: function () {
    var path = location.pathname;
    path = path === '/' ? path : path.substring(0, path.length - 1);
    $('.menu-item a[href="' + path + '"]').parent().addClass('menu-item-active');
  }
};

function hasMobileUA () {
  var nav = window.navigator;
  var ua = nav.userAgent;
  var pa = /iPad|iPhone|Android|Opera Mini|BlackBerry|webOS|UCWEB|Blazer|PSP|IEMobile|Symbian/g;

  return pa.test(ua);
}


function isTablet () {
  return screen.width < 992 && screen.width > 767 && hasMobileUA();
}

function isMobile () {
  return screen.width < 767 && hasMobileUA();
}

function isDesktop () {
  return !isTablet() && !isMobile();
}

function escapeSelector (selector) {
  return selector.replace(/[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\$&")
}

function displaySidebar () {
  if (!isDesktop()) {
    return;
  }
  $('.sidebar-toggle').trigger('click');
}

function isMist () {
  return CONFIG.scheme === 'Mist';
}

function isPisces () {
  return CONFIG.scheme === 'Pisces';
}
