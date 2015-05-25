function hasMobileUA () {
  var nav = window.navigator;
  var ua = nav.userAgent;
  var pa = /iPad|iPhone|Android|Opera Mini|BlackBerry|webOS|UCWEB|Blazer|PSP|IEMobile|Symbian/g;

  return pa.test(ua);
}

function isDesktop () {
  return screen.width > 991 && !hasMobileUA();
}

function isTablet () {
  return screen.width < 992 && screen.width > 767 && hasMobileUA();
}

function isMobile () {
  return screen.width < 767 && hasMobileUA();
}

function escapeSelector (selector) {
  return selector.replace(/[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\$&")
}

function displaySidebar () {
  setTimeout(function () {
    $('.sidebar-toggle').trigger('click');
  }, 800);
}

function isMist () {
  return CONFIG.scheme === 'Mist';
}