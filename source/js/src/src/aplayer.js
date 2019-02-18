/*音乐播放器*/
define(function () {
  function aplayer() {
  var flag_music=false;
    // $(".aplayer-icon:last").on("click",function () {
    //     if (flag_music==false) {
    //       $(".aplayer-body").css({"left": "0px"})
    //       flag_music=true;
    //     }else {
    //       $(".aplayer-body").css({"left": "-66px"})
    //       flag_music=false;
    //     }
    //   })
      $(document.body).delegate('.final','click',function(){
        if (flag_music==false&&$(".aplayer-body").css("left")=="-66px"&&$(".aplayer-info").css("display")=="block") {
          $(".aplayer-body").css({"left": "0px"})
          flag_music=true;
        }else if(flag_music==true&&$(".aplayer-body").css("left")=="0px"){
          $(".aplayer-body").css({"left": "-66px"})
          flag_music=false;
        }  });
    }
  $(function(){
    aplayer()
  })
})
