<script type="text/javascript">
  function isDesktop () {
    return screen.width > 991;
  }

  function isTablet () {
    return screen.width < 992 && screen.width > 767;
  }

  function isMobile () {
    return screen.width < 767;
  }

  function escapeSelector (selector) {
    return selector.replace(/[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\$&")
  }
</script>
