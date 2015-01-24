# NexT

> NexT is high quality elegant [Hexo](http://hexo.io) theme. It is crafted from scratch, with love.

[![hexo-image]][hexo-url]
[![bower-image]][bower-url]
[![jquery-image]][jquery-url]

[中文文档](README-zh.md)

[Live Preview](http://notes.iissnan.com)



## Installation

1. Get it from GitHub

        $ git clone https://github.com/iissnan/hexo-theme-next themes/next

2. Add it to `_config.yml`

        theme: next


## Update

```
cd theme/next
git pull
```

## Configuration

NexT comes with few configurations.

```

# Menu configuration.
menu:
  home: /
  archives: /archives

# Favicon
favicon: /favicon.ico

# Code highlight theme
# available: normal | night | night eighties | night blue | night bright
highlight_theme: normal

# Fancybox for image gallery
fancybox: true

# Specify the date when the site was setup
since: 2013

# Theme version
version: 0.0.5
```


## TODO

- [x] Using Swig instead of jade.
- [x] Using SCSS instead of stylus (depends?).
- [x] Rewrite link post related stuffs (Breaking changes).
- [x] Redesign pagination for mobile devices.
- [x] Support category.(Won't support).
- [x] Support gallery posts.
- [x] Make PAJAX and NProgress as optional. (Removed, conflicts with fancybox)
- [x] Refactor.
- [x] i18n.
- [x] How to use this theme.
- [ ] Publish as a bower package.
- [ ] Home page.


[hexo-image]: http://img.shields.io/badge/Hexo-2.4+-2BAF2B.svg?style=flat-square
[hexo-url]: http://hexo.io
[bower-image]: http://img.shields.io/badge/Bower-Powered-2BAF2B.svg?style=flat-square
[bower-url]: http://bower.io
[jquery-image]: https://img.shields.io/badge/jquery-1.9-blue.svg?style=flat-square
[jquery-url]: http://jquery.com/