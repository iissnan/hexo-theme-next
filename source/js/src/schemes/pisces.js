$(document).ready(function () {

  initAffix();

  function initAffix () {
    var headerHeight = $('.header-inner').height(),
        headerOffset = (headerHeight + CONFIG.sidebar.offset)

        footerInner = $('.footer-inner'),
        footerMargin = footerInner.outerHeight(true) - footerInner.outerHeight(),
        footerOffset = footerInner.outerHeight(true) + footerMargin;

    $('.sidebar-inner').affix({
      offset: {
        top: headerOffset - CONFIG.sidebar.offset,
        bottom: footerOffset
      }
    });

    $('#sidebar').css({ 'margin-top': headerOffset + 'px' }).show();
  }
});
