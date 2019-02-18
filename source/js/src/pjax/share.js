/*分享*/
define(['jquery.share.min'],function () {
  var $config = {
    sites : ['weibo','qq', 'wechat','qzone','douban', 'facebook',  'google','twitter'],
    disabled: [ 'linkedin', 'diandian'],
    wechatQrcodeTitle: "微信扫一扫",
    wechatQrcodeHelper: '<p>微信扫一扫，右上角分享</p>',
    source: 'Leesin Dong'
  };


  $('.post-spread').share($config);

  function pjaxshare() {
    $('.post-spread').share($config);
  }
})

