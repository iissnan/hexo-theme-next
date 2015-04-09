$(document).ready(function () {
  var isSidebarVisible;
  var DURATION = 300;
  var SIDEBAR_WIDTH = 320;

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

});
