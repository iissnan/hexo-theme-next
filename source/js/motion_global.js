$(document).ready(function () {
  var body = $('body');
  var isSidebarVisible = false;
  var sidebarToggle = $('.sidebar-toggle');
  var sidebarToggleLine1st = $('.sidebar-toggle-line-first');
  var sidebarToggleLine2nd = $('.sidebar-toggle-line-middle');
  var sidebarToggleLine3rd = $('.sidebar-toggle-line-last');
  var sidebar = $('.sidebar');

  var SIDEBAR_WIDTH = '320px';
  var SIDEBAR_DISPLAY_DURATION = 300;

  var sidebarToggleLineStatusInit = {width: '100%', opacity: 1, left: 0, rotateZ: 0, top: 0};

  var sidebarToggleLine1stStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine1stStatusArrow = {width: '50%', rotateZ: '-45deg', top: '2px'};
  var sidebarToggleLine1stStatusClose = {width: '100%', rotateZ: '-45deg', top: '5px'};

  var sidebarToggleLine2ndStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine2ndStatusArrow = {width: '90%'};
  var sidebarToggleLine2ndStatusClose = {opacity: 0};

  var sidebarToggleLine3rdStatusInit = sidebarToggleLineStatusInit;
  var sidebarToggleLine3rdStatusArrow = {width: '50%', rotateZ: '45deg', top: '-2px'};
  var sidebarToggleLine3rdStatusClose = {width: '100%', rotateZ: '45deg', top: '-5px'};

  LogoAndMenuMotion();
  sidebarToggleMotion();
  postsListMotion();
  backToTopMotion();
  searchMotion();

  //add motion effect to toc
  $('.sidebar-nav-toc') && $('.post-toc-wrap').addClass('motion-element');


  //当前选择的是目录列表时添加 class 'motion-element'
  sidebar.bind('click', function(e){ 
    if(!!$('.sidebar-nav-toc') && e.target == $('.sidebar-nav-toc')[0]){
      $('.post-toc-wrap').addClass('motion-element');
    }});

  //防止 humberger 被选择导致 sidebar 上方出现高亮
  document.onselectstart = function(e) {
    if((e.target == sidebarToggle[0]) || (e.target == $('.sidebar-toggle-line-wrap')[0]) || (e.target == sidebarToggleLine1st[0]) || (e.target == sidebarToggleLine2nd[0]) || (e.target == sidebarToggleLine3rd[0])){
      e.preventDefault();
    }
  };

  $(document)
    .on('sidebar.isShowing', function () {
      //添加 “.velocity('stop')” 用以中止动画
      isDesktop() && body.velocity('stop').velocity(
        {paddingRight: SIDEBAR_WIDTH},
        SIDEBAR_DISPLAY_DURATION
      );
      // sidebar 内容的效果应该在sidebarsidebarShowMotion内触发
      // sidebarContentMotion(); 
    })
    .on('sidebar.isHiding', function () {});

  function LogoAndMenuMotion() {
    var sequence = [
      { e: $('.brand'), p: { opacity: 1 }, o: { duration: 100 } },
      { e: $('.logo'), p: { opacity: 1, top: 0 }, o: { duration: 50} }
    ];

    isMist() && sequence.push(
        { e: $('.logo-line-before i'), p: { translateX: "100%" }, o: { duration: 500, sequenceQueue: false } },
        { e: $('.logo-line-after i'), p: { translateX: "-100%" }, o: { duration: 500, sequenceQueue: false } }
    );

    sequence.push({ e: $('.site-title'), p: { opacity: 1, top: 0 }, o: { duration: 200 } });

    $.Velocity.RunSequence(sequence);
    $('.menu-item').velocity('transition.slideDownIn', {display: null});
  }


  function backToTopMotion () {
    var b2top = $('.back-to-top');
    b2top.on('click', function () {
      body.velocity('scroll');
    });
  }

  function sidebarShowMotion () {

    sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusClose);
    sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusClose);
    sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusClose);

    //添加 “.velocity('stop')” 用以中止动画
    sidebar.velocity('stop').velocity({width: SIDEBAR_WIDTH}, {
      display: 'block',
      duration: SIDEBAR_DISPLAY_DURATION,
      //将 sidebar 内容动画效果函数移动到这里
      begin: function(e) {
        sidebarContentMotion();
      },
      complete: function () {
        sidebar.addClass('sidebar-active');
        sidebar.trigger('sidebar.didShow');
      }
    });
    sidebar.trigger('sidebar.isShowing');
  }

  function sidebarHideMotion () {
    //添加 “.velocity('stop')” 用以中止动画
    isDesktop() && body.velocity('stop').velocity({paddingRight: 0});
    // sidebar 内容动画中止和隐藏
    $('.sidebar .motion-element').velocity('stop').css('display','none');;
    // sidebar 动画中止和隐藏
    sidebar.velocity('stop').velocity({width: 0}, {display: 'none'});

    sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusInit);
    sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusInit);
    sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusInit);

    sidebar.removeClass('sidebar-active');
    sidebar.trigger('sidebar.isHiding');

    //在 post 页面下按下隐藏 sidebar 时如果当前选中的是“站点概览”，将 toc 去除 motion 效果
    //防止再次打开时会出现在“站点概览”下的 bug
    if(!!$('.post-toc-wrap')){
      if($('.site-overview').css('display') == 'block'){
        $('.post-toc-wrap').removeClass('motion-element');
      }
      // else {
      //   $('.post-toc-wrap').addClass('motion-element');
      // }
    }
  }

  function sidebarContentMotion () {
    $('.sidebar .motion-element').velocity(
      'transition.slideRightIn',
      {stagger: 50, drag: true}
    );
  }

  function postsListMotion () {
    var postMotionOptions = window.postMotionOptions || {stagger: 300, drag: true};
    $('.post').velocity('transition.slideDownIn', postMotionOptions);
  }

  function sidebarToggleMotion () {
    sidebarToggle.on('click', function () {
      isSidebarVisible ? sidebarHideMotion() : sidebarShowMotion();
      isSidebarVisible = !isSidebarVisible;
    });

    sidebarToggle.hover(function () {
      if (isSidebarVisible) {return}
      sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusArrow);
      sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusArrow);
      sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusArrow);
    }, function () {
      if (isSidebarVisible) {return}
      sidebarToggleLine1st.velocity('stop').velocity(sidebarToggleLine1stStatusInit);
      sidebarToggleLine2nd.velocity('stop').velocity(sidebarToggleLine2ndStatusInit);
      sidebarToggleLine3rd.velocity('stop').velocity(sidebarToggleLine3rdStatusInit);
    });
  }

  function searchMotion () {
    var $searchForm = $('.site-search form');
    var $searchToggle = $('.site-search-toggle');

    if (isDesktop()) {
      $searchToggle.on('click', function () {
        $searchForm.velocity('stop').velocity({ top: 0 });
      });

      $(document).on('click', function (event) {
        !$(event.target).closest('.site-search').length && $searchForm.velocity('stop').velocity({ top: -50 });
      });
    }
  }
});
