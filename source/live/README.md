# live2d-widget

## 功能
在网页中添加 Live2D 看板娘

## Demo
https://zhangshuqiao.org  
左下角可查看效果

## 依赖
需要jQuery和font-awesome  
请确保它们已在页面中加载

## 使用
请修改autoload.js中的参数（具体参考该文件内的注释），这样，通过
```
<script src="/path/to/autolload.js"></script>
```
就可以加载了

waifu-tips.json中包含了触发条件（selector，选择器）和触发时显示的文字（text）。源文件是对Hexo的NexT主题有效的，为了适用于你自己的网页，也需要自行修改，或增加新内容。

## 鸣谢
代码自这篇博文魔改而来：  
https://www.fghrsh.net/post/123.html  
其中增加了一些功能，优化了提示展现机制

更多内容可以参考：  
https://imjad.cn/archives/lab/add-dynamic-poster-girl-with-live2d-to-your-blog-02  
https://zhangshuqiao.org/2018-07/在网页中添加Live2D看板娘

可以自行在后端api中增加模型：  
https://github.com/xiazeyu/live2d-widget-models
