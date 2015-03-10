# NexT

> 精于心，简于形

[在线预览](http://notes.iissnan.com) |  [English Documentation](README.en.md)

![Desktop Preview](http://iissnan.com/nexus/next/desktop-preview.png)

## 安装

1. 从 GitHub 下载

        $ cd your-hexo-site
        $ git clone https://github.com/iissnan/hexo-theme-next themes/next

2. 更改**站点** `_config.yml` 中的`theme`字段设置为`next`

        theme: next

## 更新

```
cd themes/next
git pull
```

因为主题在不断的更新，所以你可能会遇到冲突，需要手动解决。目前主题尽量把设置转移到**站点**的配置里。


## 特性

特性概览：

- [支持自定义 LOGO 以及主题图标](https://github.com/iissnan/hexo-theme-next/wiki/%E8%87%AA%E5%AE%9A%E4%B9%89LOGO%E4%BB%A5%E5%8F%8A%E4%B8%BB%E9%A2%98%E5%9B%BE%E6%A0%87)
- [支持 英语 / 简体 中文双语](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E7%BD%AE%E8%AF%AD%E8%A8%80)
- [支持 多说 / DISQUS 评论系统](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E7%BD%AE%E5%A4%9A%E8%AF%B4-DISQUS%E8%AF%84%E8%AE%BA%E7%B3%BB%E7%BB%9F)
- [支持标签云页面](https://github.com/iissnan/hexo-theme-next/wiki/%E5%88%9B%E5%BB%BA%E6%A0%87%E7%AD%BE%E4%BA%91%E9%A1%B5%E9%9D%A2)
- [支持 RSS 链接](https://github.com/iissnan/hexo-theme-next/wiki/%E6%98%BE%E7%A4%BA-feed-%E9%93%BE%E6%8E%A5)
- [支持about页面](https://github.com/iissnan/hexo-theme-next/wiki/%E5%88%9B%E5%BB%BA-%22%E5%85%B3%E4%BA%8E%E6%88%91%22-%E9%A1%B5%E9%9D%A2)
- [支持5款代码高亮主题](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E5%AE%9A%E4%BB%A3%E7%A0%81%E9%AB%98%E4%BA%AE%E4%B8%BB%E9%A2%98)
- [支持 Google / 百度统计](https://github.com/iissnan/hexo-theme-next/wiki/%E6%B7%BB%E5%8A%A0-Google---%E7%99%BE%E5%BA%A6-%E7%BB%9F%E8%AE%A1)
- [支持 Google Webmaster tools](https://github.com/iissnan/hexo-theme-next/wiki/%E6%B7%BB%E5%8A%A0-Google-Webmaster-tools-%E9%AA%8C%E8%AF%81)
- [支持 Creative Commons](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E7%BD%AE-Creative-Commons-%E5%8D%8F%E8%AE%AE)
- [支持指定站点建立时间](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E5%AE%9A%E7%AB%99%E7%82%B9%E5%BB%BA%E7%AB%8B%E6%97%B6%E9%97%B4)
- [支持数学公式显示（借助 MathJax）](https://github.com/iissnan/hexo-theme-next/wiki/%E5%BC%80%E5%90%AF%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F%E6%98%BE%E7%A4%BA)
- [设置侧边栏头像](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E7%BD%AE%E4%BE%A7%E8%BE%B9%E6%A0%8F%E5%A4%B4%E5%83%8F)
- [设置侧边栏社交链接](https://github.com/iissnan/hexo-theme-next/wiki/%E8%AE%BE%E7%BD%AE%E4%BE%A7%E8%BE%B9%E6%A0%8F%E7%A4%BE%E4%BA%A4%E9%93%BE%E6%8E%A5)


## 配置

> NexT 坚持将复杂的细节隐藏，提供尽量少并且简便的设置，保持最大限度的易用性。

为了尽量避免更新主题的时候，避免发生冲突，建议将配置写在**站点**的 `_config.yml`中。例如：

```
# NexT 主题相关配置 ==========================

avatar: http://your-avatar-url
since: 2015

# EndNexT 主题相关配置 ==========================
```

### 主题配置

```
# 菜单配置
menu:
  home: /
  archives: /archives
  tags: /tags
  #about: /about

# Favicon
# 从`Next 0.2`起，favicon将不再放置于主题之内。
# 请将你的favicon放置在`hexo-site/source/`目录下。
favicon: /favicon.ico

# 设置为`false`不显示`rss`链接
# 留空，并且通过`hexo-site-feed`插件配置使用默认的feed
# 设置成特定的`url`，适用于通过第三方服务定制feed的情况。
rss: false


# 图标字体
# NexT内建四种图标: default | linecons | fifty-shades | feather
icon_font: default
#icon_font: fifty-shades
#icon_font: feather
#icon_font: linecons


# 代码高亮主题
# available: normal | night | night eighties | night blue | night bright
highlight_theme: normal

# MathJax support
# 开启数学公式渲染支持，默认关闭。设置为 `true` 开启。
mathjax:

# `阅读全文` 按钮跳转之后是否自动滚动页面到设置 `<!-- more -->` 的地方。
scroll_to_more: true
```

## 主题内建样式

`.blockquote-center`

> 带上下分割线的引用，引用内文本将自动居中。适用于单行引用文本的场景。

### 示例

![Blockquote Center](http://iissnan.com/nexus/next/blockquote-center.png)

### 使用方式：

```
<blockquote class="blockquote-center">blah blah blah</blockquote>
```

`.full-image`

> 图片将自动扩展 26%，突破文章宽度。

### 示例

![Full Image](http://iissnan.com/nexus/next/full-image.png)

### 使用方式：

```
<img src="/image-url" class="full-image" />
```


## 浏览器支持

![Browser support](http://iissnan.com/nexus/next/browser-support.png)


## 贡献

接受各种形式的贡献，包括不限于提交问题与需求，修复代码。等待您的`PR`。


## 开发

> NexT is built for easily use with elegant appearance.

First things first, always keep things simple.

## [Changelog](https://github.com/iissnan/hexo-theme-next/wiki/Changelog)

[![views](https://sourcegraph.com/api/repos/github.com/iissnan/hexo-theme-next/.counters/views.svg)](https://sourcegraph.com/github.com/iissnan/hexo-theme-next)
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
