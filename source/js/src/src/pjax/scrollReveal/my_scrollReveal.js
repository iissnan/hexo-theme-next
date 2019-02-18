//如果刷新的页面不是首页，即点进去的文章的话，就不进行scrollReveal的操作
//因为在点进去的文章还是article标签包着的。
var pathname = window.location.pathname
if (pathname.indexOf("html") < 0) {
  var config = {
    enter: 'right',
    move: '40px',
    over: '3s',
    after: '5',
    reset: true,
    init: true,

  };
  window.scrollReveal = new scrollReveal(config);
  scrollReveal.init();
}
