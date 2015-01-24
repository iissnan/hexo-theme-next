fancyBox - Changelog
=========

### Version 2.1.5 - June 14, 2013
* Fixed #493 - Broken slideshow
* Fixed #556 - Parent option
* Retina graphics (#564) and retina display support (#420)
* Improved "lock" feature

### Version 2.1.4 - January 10, 2013
* Update to be compatible with jQuery v1.9
* Small changes that should fix usability issues for certain users

### Version 2.1.3 - October 23, 2012

* Fixed #426 - Broken IE7
* Fixed #423 - Background flickering on iOS
* Fixed #418 - Automatically Grow/Shrink and Center
* Updated the script to work with jQuery 1.6
* Media helper supports YouTube video series

### Version 2.1.2 - October 15, 2012

* Fixed #414 - Don't allow nextClick if there is only one item
* Fixed #397 - Button helper 'Menu' not visible in IE7
* Overlay can be opened/closed manually:
*     $.fancybox.helpers.overlay.open();
*     $.fancybox.helpers.overlay.open({closeClick : false});
*     $.fancybox.helpers.overlay.close();
* Optimized for Internet Explorer 10 (Windows 8)

### Version 2.1.1 - October 01, 2012

* Fixed #357 - Converting values like 'auto' in getScalar()
* Fixed #358 - Updated overlay background image
* New "fancybox-href" and "fancybox-title" HTML5 data-attributes (#317)
* Improved helpers:
*     - now they can have a property 'defaults' that contains default settings
*     - updated vimeo and youtube parsers for media helper
* Content locking now can be turned off

### Version 2.1.0 - August 20, 2012

* Fixed #103 - DOM element re-injection after closing
* Fixed #188 - navigation keys inside editable content
* New animation directions (see https://github.com/fancyapps/fancyBox/issues/233#issuecomment-5512453)
* New option "iframe" - it is now possible to separate scrolling for iframe and wrapping element; choose to preload
* New option "swf" - brings back functionality from fancyBox v1
* Improved media helper - better support for vimeo and youtube; links are now configurable
* Rewritten overlay helper:
*     - new option "showEarly" - toggles if should be open before of after content is loaded
*     - Facebook-style (https://github.com/fancyapps/fancyBox/issues/24) and therefore uses image for background
* Option "padding" accepts array (e.g., padding: [15, 50, 10, 5])
* One of dimensions (width or height) can now be set to "auto" (option "autoSize" needs to be "false")
* Updated callbacks:
*     - "beforeClose" is now called only once
*     - "afterLoad" receives current and previous object as arguments
* Method "$.fancybox.update();" recalculates content width/height
* Updated to work with jQuery v1.8

### Version 2.0.6 - April 16, 2012

* Fixed #188 - keystrokes in contenteditable
* Fixed #171 - non-images should not be preloaded
* Fixed #158 - 'closeClick: true' breaks gallery navigation
* New "media" helper - detects and displays various media types
* New option "groupAttr" - name of group selector attribute, default is "data-fancybox-group"
* New feature - selector expressions in URLs, see #170
* Improved 'overlay' helper to use "position: fixed"
* Improved autoSize, fixed wrong height in some cases
* Improved centering and iframe scrolling for iOS
* Updated markup, new element '.fancybox-skin' is now used for styling

### Version 2.0.5 - February 21, 2012

* Fixed #155 - easing for prev/next animations
* Fixed #153 - overriding "keys" options
* Fixed #147 - IE7 problem with #hash links
* Fixed #130 - changing dynamically data-fancybox-group
* Fixed #126 - obey minWidth/minHeight
* Fixed #118 - placement of loading icon and navigation arrows
* Fixed #101 - "index" option not working
* Fixed #94 - "orig" option not working
* Fixed #80 - does not work on IE6
* Fixed #72 - can't set overlay opacity to 0
* Fixed #63 - properly set gallery index
* New option "autoCenter" - toggles centering on window resize or scroll, disabled for mobile devices by default
* New option "autoResize" - toggles responsivity, disabled for mobile devices by default
* New option "preload" - number of images to preload
* New feature to target mobile/desktop browsers using CSS, see #108
* Changed ajax option defaults to "{ dataType: 'html', headers: { 'X-fancyBox': true } }", see #150 and #128
* Updated loading icon for IE7, IE8
* Calculates height of the iframe if 'autoSize' is set to 'true' and the iframe is on the same domain as the main page

### Version 2.0.4 - December 12, 2011

* Fixed #47 - fix overriding properties
* New option "position" to thumbnail and button helpers


### Version 2.0.3 - November 29, 2011

* Fixed #29 - broken elastic transitions


### Version 2.0.2 - November 28, 2011

* Fixed slideshow
* Fixed scrollbars issue when displayed a very tall image
* New option "nextClick" - navigate to next gallery item when user clicks the content
* New option "modal" - to disable navigation and closing
* Add 'metadata' plugin support
* Add ability to create groups using 'data-fancybox-group' attribute
* Updated manual usage to match earlier releases


### Version 2.0.1 - November 23, 2011

* Fixed keyboard events inside form elements
* Fixed manual usage


### Version 2.0.0 - November 21, 2011

First release - completely rewritten, many new features and updated graphics.