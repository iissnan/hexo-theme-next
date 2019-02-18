//主函数
require.config({
  waitSeconds: 0,
  paths: {
    "music": "/dist/music",
    //目前会消耗较多的性能，以后可能会去掉。
    "aplayer": "/js/src/aplayer",
    "backgroudLine": "/js/src/backgroudLine",
    "category": "/js/src/category",
    "jquery.share.min":"/js/src/pjax/share/jquery.share.min",
    /*不显示图标的话替换fonts*/
    "share":"/js/src/pjax/share",
    "css":"/js/src/pjax/css",
    "comments":"/js/src/pjax/comments_git",
    // "love":"/js/src/love",
    "eye":"/js/src/pjax/eye",
    "header_left":"/js/src/pjax/header_left",
    "article_top":"/js/src/pjax/article_top",
    "easing":"/js/src/pjax/easing/jquery.easing.1.3",
    "scrollReveal":"/js/src/pjax/scrollReveal/scrollReveal",
    "my_scrollReveal":"/js/src/pjax/scrollReveal/my_scrollReveal",
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
    'header_left': {
      deps: [
        'easing'
      ]
    },
    'my_scrollReveal':{
      deps:[
        'scrollReveal'
      ]
    }
  }
});
require(['backgroudLine','music','aplayer','category','jquery.share.min','share','css','comments','eye',
'header_left','article_top','easing','scrollReveal','my_scrollReveal'], function (){
});
