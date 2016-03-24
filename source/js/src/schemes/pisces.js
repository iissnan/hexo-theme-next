/* global NexT: true */
$(document).ready(function () {
  var $sidebar = $('#sidebar');
  var headerHeight = $('.header-inner').height();
  var footerOffset = parseInt($('.main').css('padding-bottom'), 10);
  var sidebarTop = headerHeight + 10;

  $(document)
    .on('affixed.bs.affix', updateTOCWrapperHeight.bind(null, document.body.clientHeight - 100))
    .on('affixed-top.bs.affix', updateTOCWrapperHeight);

  $(window).on('resize', function () {
    setTimeout(function () {
      var tocWrapperHeight = $('.sidebar-inner').hasClass('affix') ?
                  document.body.clientHeight - 100 :
                  'auto';
      updateTOCWrapperHeight(tocWrapperHeight);
    }, 0);
  });

  $sidebar.css({ 'margin-top': sidebarTop }).show();

  NexT.utils.isDesktop() && $('.page-post-detail .sidebar-inner').affix({
    offset: {
      top: sidebarTop,
      bottom: footerOffset
    }
  });

  /**
   * Update max-height of Table of Contents's wrapper.
   * To ensure the height of sidebar does not exceed the view port.
   *
   * @param [height="auto"] - Height
   */
  function updateTOCWrapperHeight (height) {
    height = height || 'auto';
    $('.post-toc').css('max-height', height);
  }
});
