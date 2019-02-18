

<script>

var div = $('.post-body');
var toc=$('.post-toc-wrap')

function password() {

  if('{{ page.password }}'){
    div.remove();
    toc.remove();
    $('.post-header').after('<textarea class="description" value="Please enter your password and press enter to build" style="border: none;display: block;' +
      'width: 60%;margin: 0 auto;text-align: center;outline: none;margin-bottom: 50px;resize:none ">
      Please enter your password and press enter to build</textarea>' +
      '<div class="qiang" style="height: 100px;width: 60%;margin:0 auto">' +
      '<input class="password"  type="text" value="" style="border: none;display: block;border-bottom: 1px solid #ccc;' +
      'margin: 0 auto;outline: none;width:95%"/>' +
      '</div>')

    document.onclick = function (event) {
      var e = event || window.event;
      var elem = e.srcElement || e.target;

      while (elem) {
        if (elem != document) {
          if (elem.className == "password") {
            $(".password").animate({paddingTop:"30px",width:"100%",borderWidth:"2px"},300)
            return;
          }
          elem = elem.parentNode;
        } else {
          $(".password").animate({paddingTop:"0px",width:"95%",borderWidth:"1px"},300)
          return;
        }
      }
    }



    $(document).keyup(function(event){
      console.log($('.password').length)
      if(event.keyCode ==13 && $('.password').length>0){
        console.log($('.password').val())
        console.log('{{ page.password }}')
        if ($('.password').val() == '{{ page.password }}') {
          (div).appendTo($(".post-header"))
          toc.appendTo($(".sidebar-inner"))
          $(".description").remove();
          $(".qiang").remove();
          $(".password").remove();
          //处理pjax事件
          $('img').lazyload({
             placeholder: '/images/loading.gif',
             effect: 'fadeIn',
             threshold : 100,
             failure_limit : 20,
             skip_invisible : false
           });
            $(".post-block").css({opacity:1});
             $(".post-header").css({opacity:1});
             $(".post-body").css({opacity:1});
             $(".pagination").css({opacity:1});
        }else {
          alert("Sorry, the password is wrong.")
        }

      }


    });
  }
}
password();









</script>
