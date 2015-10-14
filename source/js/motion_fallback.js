$(document).ready(function () {
  var isSidebarVisible, isNavbarVisible;
  var DURATION = 300;
  var SIDEBAR_WIDTH = 320;
  var NAVBAR_HEIGHT = 200;

  navbar();
  sidebar();
  backToTop();

  function sidebar() {
    $('.sidebar-toggle').on('click', function () {
      var sidebarWidth = isSidebarVisible ? 0 : SIDEBAR_WIDTH;
      $('.sidebar').animate({
        width: sidebarWidth
      }, DURATION);
      isSidebarVisible = !isSidebarVisible;
    });
  }

  function backToTop() {
    $('.back-to-top').on('click', function () {
      $('html, body').animate({
        scrollTop: 0
      }, DURATION);
    });
  }

  function navbar(){
    $('.site-nav-toggle').on('click', function () {
      var navbarHeight = isNavbarVisible ? 0 : NAVBAR_HEIGHT;
      $('.site-nav').animate({
        height: navbarHeight
      }, DURATION);
      isNavbarVisible = !isNavbarVisible;
    });

  }

});
