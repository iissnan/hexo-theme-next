/*gitalk评论*/
if($('#gitalk-container').length>0){
  var gitalk = new Gitalk({

    // gitalk的主要参数
    clientID: 'a9ce619db1631dda096d',
    clientSecret: '7e8f7305d2493c153d210082610329f07f1aa093',
    repo: 'dataiyangu.github.io',
    owner: 'dataiyangu',
    admin: ['dataiyangu'],
    id: location.pathname

  });
  gitalk.render('gitalk-container');

}

