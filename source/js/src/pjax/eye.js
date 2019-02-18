/*护眼模式*/
function eye() {
  var eye_width='253px'
  var eye_block = false
  $(".eye .eye2").click(function () {
    if (eye_block == false) {
      $(".eye .eye1").animate({width: eye_width,opacity:"show"},
        {duration:500, easing:"easeOutBounce",complete:function () {
          }}
      );
      eye_block = true
    }else{
      $(".eye .eye1").animate({width: "0px",opacity:"hide"},
        {duration:500, easing:"easeOutBounce",complete:function () {
          }}
      );
      eye_block=false
    }

  })

  $(".eye ul li").click(function () {
    // $(".eye .eye1").animate({width:'toggle'},500)
    // $(".eye .eye1").slideToggle();
    $(".eye .eye1").velocity('stop').velocity({width: 0}, {display: 'none'})
    eye_block=false

    $color = $(this).css("background-color")
    $(".eye .eye1").css("background", $color);
    $("#canvas").css("background", $color);
    $("article").css("background", $color);
    // $("#sidebar").css("background", $color);
    // $("#header_left").css("background", $color);
    var color= $(this).css("background-color")
    if (color.indexOf("rgb(50, 50, 50)") >= 0) {
      $("p").css({"color": "#999"});
      $("a").css({"color": "#FF99CC"});
      $("h1 a").css({"color": "#FFFF66"});
      $("h1").css({"color": "#FFFF66"})
    } else {
      $("p").css({"color": "#666"});
      $("a:not(.social-share-icon)").css({"color": "#555"});
      $("h1").css({"color": "#555"});
      $(".sidebar a ").css({"color": "#999"});
      $(".header_left a ").css({"color": "#999"});
    }
  })
}

eye()





