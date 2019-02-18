/*分类*/
$(document).ready(function(){
    category_js();
    function category_js () {
      //在a标签前面加个>
      // if ($(".jiantou").length == 0) {
      //   $("<div class='jiantou' style='float: left'> &nbsp>&nbsp </div>").prependTo(".category-list-item");
      // }

      //改变a标签的样式，"display":"inline-block"同时拥有块元素和行元素的两种特性。
      //放到了css中
      // $(".category-list-link").css({"width":"1000px","display":"inline-block"});

      //加入过滤器功能，因为if貌似不支持this功能，a标签如果有同级元素ul的话会使跳转功能失效，没有同级元素ul的话继续跳转
      $(".category-list-link").filter(function () {
        return $(this).siblings(".category-list-child").length > 0
      }).attr("href", "javascript:void(0)")
      //点击出现隐藏功能，a标签如果有同级元素ul的话会使跳转功能失效，没有同级元素ul的话继续跳转，上面已经做了处理。
      $(".category-list-link").click(function () {
        $(this).siblings(".category-list-child").slideToggle();
      })


      var width = ($(window).width())/1.2;
      // console.log(width)
      $(".category-list-link").animate({width: width},300)



    }

  });


