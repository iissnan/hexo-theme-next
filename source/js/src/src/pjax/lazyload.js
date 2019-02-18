/*懒加载*/
function lazy(){
    $("img").lazyload({
      threshold : 0,
      placeholder : "images/my_blog_0.png",

      /*默认情况下，图像完全加载并调用show()。你可以使用任何你想要的效果。下面的代码使用fadeIn （淡入效果）*/

      effect : "fadeIn",
    })
}
lazy()



