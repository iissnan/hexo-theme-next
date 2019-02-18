/*左边sidebar*/
function header_left() {
  var block = false;
  $(".header_sidebar").click(function () {

    // $(".header_left_inner").velocity('stop').velocity( {width: header_width}, {display: 'block'}).css('font-size', '100%');
    // $(".header_left_inner .site-brand-wrapper").velocity('stop').css('display', 'block');
    // $(".header_left_inner .site-nav").velocity('stop').css('display', 'block');
    // $('body').velocity('stop').velocity({marginLeft: header_width});




    var header_width = '80px';
    if (block == false) {
      $(".header_left_inner ").animate({width:'80px',opacity:"show"},
        {duration:500, easing:"easeInOutQuart",complete:function () {
            // $("body").animate({paddingLeft: "80px"},300)
          }}
        );
      $(".header_left_inner .site-nav").css("display", "block");
      $("body").animate({paddingLeft: "80px"},{duration:500, easing:"easeInOutQuart",complete:function () {
      }}
    );

      block = true
    } else {
      $(".header_left_inner").animate({width: "0px",opacity:"hide"},
        {duration:500, easing:"easeInOutQuart",complete:function () {
            // $("body").animate({paddingLeft: "0px"},300)
          }}
      );
      $("body").animate({paddingLeft: "0px"},{duration:500, easing:"easeInOutQuart",complete:function () {
        }}
      );


      block = false
    }
  });
}
header_left()
