/*点击文章后滚动到顶部*/
function article_top() {
    function top(){
      var pathname = window.location.pathname
      var height = $(".header").css("height");
      if (pathname.indexOf("html")>0) {

        $("html,article").animate({scrollTop:height},300)
      }
    }
    setTimeout(top,800);

  }
  article_top();
