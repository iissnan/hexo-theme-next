/* global NexT: true */

$(document).ready(function () {
  var $sidebar = $('#sidebar');
  var headerHeight = $('.header-inner').height();
  var sidebarTop = headerHeight + 10;

  $sidebar.css({ 'margin-top': sidebarTop }).show();
});
