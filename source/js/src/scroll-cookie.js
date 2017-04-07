$(document).ready(function() {

  // Set relative link path (without domain): https://stackoverflow.com/questions/3955959/whats-an-easy-way-to-get-the-url-in-the-current-window-minus-the-domain-name
  var rpath = window.location.href.replace(window.location.origin, "");

  // Write position in cookie
  var timeout;
  $(window).on("scroll", function() {
    clearTimeout(timeout);
    timeout = setTimeout(function () {
      Cookies.set('scroll-cookie', ($(window).scrollTop() + '|' + rpath), { path: '' });
    }, 250);
  });

  // Read position from cookie
  if (Cookies.get("scroll-cookie") !== undefined) {
    var cvalues = Cookies.get('scroll-cookie').split('|');
      if (cvalues[1] == rpath) {
        $(window).scrollTop(cvalues[0]);
      }
  }

});
