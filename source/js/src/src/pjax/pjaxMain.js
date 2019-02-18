/*pjax主函数*/
$(document).pjax('a[target!=_blank]', '#pjax-container', {
  fragment: '#pjax-container',
  timeout: 5000,
});
//用户通过浏览器的前进后退按钮，需要加载的js
$(window).on('popstate.pjax', function () {
  /*必须加*/
  // $(document).on('pjax:complete',
  //   function () {
      pjax();
    // })
})
$(document).on('pjax:start',
  function () {
    $(document).unbind('keyup')
  })
$(document).on('pjax:complete',
  function () {
    require.config({
      waitSeconds: 0,
      paths: {
        //这个是单独的
        "jquery.share.min":"/js/src/pjax/share/jquery.share.min",
        "share":"/js/src/pjax/share",
        //这个也是单独的
        "css":"/js/src/pjax/css",
        "pjax_function_public":"/js/src/pjax/pjax_function_public",
        "comments":"/js/src/pjax/comments_git",
        // "love":"/js/src/love"
      },
      shim: {
        'share': {
          deps: [
            'css!/js/src/pjax/share/share.min','jquery.share.min'
          ]
        },
        'comments': {
          deps: [
            'css!/js/src/pjax/comments/gitalk'
          ]
        },
      }
    });

    require(['jquery.share.min','share','css','pjax_function_public','comments'
    ], function () {
      pjax();

    });
  })

function pjax() {

 /*来必力评论*/
 //    comments_js();
/*gitalk评论*/
  gitalk();
  //护眼
  eye_js()
    //如果是文章，实现滚动效果
  article_top_js();
//不蒜子
  busuanzi_js();

  //自己写的分享
  // pjaxshare();

// 分类的js
  category_js();
// 局部刷新后文章内容不显示bug的js
  opacity_js()
//点击有目录的文章sidebar不显示的bug解决
  motion_js()
  scrollspy_js()
  //utils_js()
  postdetails_js()
//lean数量统计的js，原来的js是在themes/next/layout/_third-party/analytics/lean-analytics.swig文件中
  lean_analytics();
  //百度推送js
  baidutuisong();
//     //右边sidebar滚轮效果消失了。
  initSidebarDimension()
  //懒加载
  lazyLoad();
  //捐赠的函数
  donate();
  //随鼠标的滚动文章动态出现的动画
  my_scrollReveal_js();
}

