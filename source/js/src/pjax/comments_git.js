/*gitalk评论*/
if($('#gitalk-container').length>0){
  var gitalk = new Gitalk({

    // gitalk的主要参数
    clientID: '',
    clientSecret: '',
    repo: 'dataiyangu.github.io',
    owner: 'dataiyangu',
    admin: ['dataiyangu'],
    id: location.pathname

  });
  gitalk.render('gitalk-container');

}

