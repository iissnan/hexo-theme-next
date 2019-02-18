define(function () {
  const ap = new APlayer({
    container: document.getElementById('aplayer'),
    fixed: true,
      theme: '#3C3F41',
    // listFolded: true,//列表默认折叠
    // listMaxHeight: 90,//列表最大高度
    // autoplay: false,
    // lrcType: 3,//歌词，直接删掉
    // mini:false,
    //theme:'＃cccccc',

    audio: [

      {
        name: '第三人称',
        artist: '买辣椒也用券',
        url: 'http://other.web.nc01.sycdn.kuwo.cn/resource/n2/59/48/1124497297.mp3',
        cover: '/images/music.png',
      },
      {
        name: '年少有为',
        artist: '你的叽叽',
        url: 'http://sf.sycdn.kuwo.cn/resource/n1/14/23/1767547595.mp3',
        cover: '/images/music.png',
      },
      {
        name: '晴天',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2016/1/02m/21/195211043310.m4a?#.mp3',
        cover: '/images/music.png',
      }, {
        name: '可爱女人',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/03m/14/96141856254.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      }, {
        name: '简单爱',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/01m/17/94171726411.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      },{
        name: '半岛铁盒',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/04m/02/97021354331.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        lrc: '/dist/lyrics/半岛铁盒.lrc',
        cover: '/images/music.png',
      },{
        name: '公主病',
        artist: '刘瑞琦',
        url: 'http://fdfs.xmcdn.com/group6/M01/D6/9D/wKgDg1UYJFKABXQJABnFBWCjXYU879.mp3',
        cover: '/images/music.png',
      },{
        name: '乌克丽丽',
        artist: '刘瑞琦',
        url: 'http://fdfs.xmcdn.com/group6/M06/D2/83/wKgDhFUYJIDyPwABABheDq41De4322.mp3',
        lrc: '/dist/lyrics/乌克丽丽.lrc',
        cover: '/images/music.png',
      },{
        name: '听爸爸的话',
        artist: '刘瑞琦',
        url: 'http://fdfs.xmcdn.com/group6/M01/D2/83/wKgDhFUYJG_xP6T-AB2JGeKO9S0934.mp3',
        cover: '/images/music.png',
      },{
        name: '最长的电影',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/01m/29/94291214455.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      },{
        name: '七里香',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/02m/17/95171347423.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      },{
        name: '黑色毛衣',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/06m/21/99210953298.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      },{
        name: '说了再见',
        artist: '刘瑞琦',
        url: 'http://sc1.111ttt.cn:8282/2015/1/02m/03/95032105412.m4a?tflag=1519095601&pin=6cd414115fdb9a950d827487b16b5f97#.mp3',
        cover: '/images/music.png',
      },
    ]
  });

})
