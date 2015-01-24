# NexT

> NexT是一款高质量简洁的 [Hexo](http://hexo.io)主题，她经过精心雕琢而来。


[在线预览](http://notes.iissnan.com)


## 预览

[Desktop Preview](screenshots/desktop.png) | [Mobile Preview](screenshots/mobile.png)

<img src="screenshots/mobile.png" />


## 安装

1. 从`Github`下载

        $ git clone https://github.com/iissnan/hexo-theme-next themes/next

2. 将`_config.yml`中的`theme`字段设置为`next`

        theme: next

## 更新

```
cd theme/next
git pull
```


## 特性

1. 英语/简体中文双语支持

    > 默认语言是英文
    > 编辑站点的`_config.yml`，将`language`字段更改为`zh-Hans`来启用中文

        languages: zh-Hans

2. 多说评论支持

    > 编辑站点的`_config.yml`，添加`duoshuo`字段，设置如下

        duoshuo:
          enable: true
          shortname: 多说shortname

3. 标签云页面

    > 添加一个标签云页面，并在菜单中显示标签云链接。

    - 新建一个页面，命名为`tags`。命令如下：

                hexo new page "tags"

    - 编辑刚新建的页面，将页面的类型设置为`tags`，主题将自动为这个页面显示标签云。

                title: All tags
                date: 2014-12-22 12:39:04
                type: "tags"

    - 在菜单中添加链接。编辑主题的`_config.yml`，添加`tags`到`menu`中，如下:

                menu:
                  home: /
                  archives: /archives
                  tags: /tags


## 主题配置

NexT 拥有少许的配置

```
# 菜单配置
menu:
  home: /
  archives: /archives

# Favicon
favicon: /favicon.ico

# 代码高亮主题
# available: normal | night | night eighties | night blue | night bright
highlight_theme: normal

# Fancybox - 用于显示照片组
fancybox: true

# 指定站点建立时间
since: 2013
```

[![hexo-image]][hexo-url]
[![bower-image]][bower-url]
[![jquery-image]][jquery-url]

[hexo-image]: http://img.shields.io/badge/Hexo-2.4+-2BAF2B.svg?style=flat-square
[hexo-url]: http://hexo.io
[bower-image]: http://img.shields.io/badge/Bower-Powered-2BAF2B.svg?style=flat-square
[bower-url]: http://bower.io
[jquery-image]: https://img.shields.io/badge/jquery-1.9-blue.svg?style=flat-square
[jquery-url]: http://jquery.com/