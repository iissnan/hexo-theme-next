# NexTD from [NexT](https://github.com/iissnan/hexo-theme-next/)

花了一两天时间改造了大大的Hexo主题，添加了页面封面与博文封面的设置，更大气一些哈
由于第一次使用Swig与Stylus，一边改造一边学习，可惜改动蛮多的，已与原版不兼容_(:зゝ∠)_
做了响应式处理，基本没什么大问题嘞~

**页面封面设置**（效果预览 > [熊D博客](http://blog.tail.cc/)）：
```
# /themes/nextd/_config.yml
# Page covers for follow pages, whom height is greater than 400px.
# Home cover is required, which is default cover for other pages.
cover:
  home: /images/home_bg.jpg
  tag: /images/tag_bg.jpg
  archive: /images/archive_bg.jpg
  category: /images/category_bg.jpg
  # post: 
  # about: 
  # pages: 
```
效果：
![页面封面效果](https://github.com/HiDino9/hexo-theme-nextd/blob/master/test/nextd_home_preview.jpg?raw=true)

**博文封面设置**（效果预览 > [从零开始：现在开始用ES6写代码 | 熊D博客](http://blog.tail.cc/JavaScript/从零开始：现在开始用ES6写代码/)）：
```
---
title: 从零开始：现在开始用ES6写代码
date: 2016-09-30 18:46:45
categories: JavaScript
tags: [JS,JavaScript,ES6,ECMAScript6,ES2015,Babel,Gulp,NodeJs]
cover: banner-write-in-es6.jpg
---
```
> 博文封面效果借鉴了[ Hux ](https://github.com/huxpro)大大博客的效果，谢谢~

效果：
![博文封面效果](https://github.com/HiDino9/hexo-theme-nextd/blob/master/test/nextd_post_preview.jpg?raw=true)

***

# NexT

> 精于心，简于形

<a href="http://notes.iissnan.com" target="_blank">在线预览 Preview</a> | <a href="http://theme-next.iissnan.com" target="_blank">NexT 使用文档</a> |  [English Documentation](README.en.md)

[![Join the chat at https://gitter.im/iissnan/hexo-theme-next](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/iissnan/hexo-theme-next?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![NexT Schemes](http://iissnan.com/nexus/next/next-schemes.jpg)


## 浏览器支持 Browser support

![Browser support](http://iissnan.com/nexus/next/browser-support.png)


## 贡献 Contributing

接受各种形式的贡献，包括不限于提交问题与需求，修复代码。等待您的`Pull Request`。

Any types of contribution are welcome. Thanks.

## 开发 Development

NexT 主旨在于简洁优雅且易于使用，所以首先要尽量确保 NexT 的简洁易用性。

NexT is built for easily use with elegant appearance. First things first, always keep things simple.

## [开发历史 Changelog](https://github.com/iissnan/hexo-theme-next/wiki/Changelog)

[![hexo-image]][hexo-url]
[![bower-image]][bower-url]
[![jquery-image]][jquery-url]
[![velocity-image]][velocity-url]

[hexo-image]: http://img.shields.io/badge/Hexo-2.4+-2BAF2B.svg?style=flat-square
[hexo-url]: http://hexo.io
[bower-image]: http://img.shields.io/badge/Bower-*-2BAF2B.svg?style=flat-square
[bower-url]: http://bower.io
[jquery-image]: https://img.shields.io/badge/jquery-2.1-2BAF2B.svg?style=flat-square
[jquery-url]: http://jquery.com/
[velocity-image]: https://img.shields.io/badge/Velocity-1.2-2BAF2B.svg?style=flat-square
[velocity-url]: http://julian.com/research/velocity/
