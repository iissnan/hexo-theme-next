/*pjax之前版本用来做记录*/
// define(['jquery','jquery_pjax_min_js'],function () {
$(document).pjax('a[target!=_blank]', '#pjax-container', {
  fragment: '#pjax-container',
  timeout: 5000,
});

//用户通过浏览器的前进后退按钮，需要加载的js
$(window).on('popstate.pjax', function () {
  pjax();
})

$(document).on('pjax:start',
  function() {

  })
$(document).on('pjax:complete',
  function () {
    pjax();
  })

function pjax() {

  pjaxshare();

  /*因为下面的postdetails_js中的有个判断空指针的，如果加上就不能左移，如果去掉会报错，所以把这个放在首行来执行。*/
  /*现在已经解决,可以放在任意的位置*/
  /*
      之前一直是好的突然有次就不好了，后来解决了右边sidebar滚轮效果消失的效果之后，突然又好了。
      原因是因为，之前放在detail js的下面，而detail的下面undfind的判断时报错的，所以不会往下走。
  */
  /*判断#lv-container是否为空，目前这是我找到最好的办法，因为不判断，进入首页或其他的页面会空指针异常。*/
  if ($("#lv-container").length > 0) {
    $(".comments").css({opacity: 1});
    $.getScript("https://cdn-city.livere.com/js/embed.dist.js");
  }
  //不蒜子js
  $.getScript("https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js");

  //自己写的分享
  pjaxshare();

// 分类的js
  category_js();
// 局部刷新后文章内容不显示bug的js
  opacity_js()
//     // 点击有目录的文章sidebar不显示的bug解决
  motionz_js()
  // velocity_js()
  // velocityui_js()
  scrollspy_js()
  // utils_js()
  postdetails_js()
//lean数量统计的js，原来的js是在themes/next/layout/_third-party/analytics/lean-analytics.swig文件中
  lean_analytics();
  //百度推送js
  baidutuisong();
//     //右边sidebar滚轮效果消失了。
  initSidebarDimension()

  /*懒加载*/
  $('img').lazyload({
    placeholder: '/images/loading.gif',
    effect: 'fadeIn',
    threshold : 100,
    failure_limit : 20,
    skip_invisible : false
  });
}

// })
