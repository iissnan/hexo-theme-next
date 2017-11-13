# <div align="center"><a href="https://github.com/iissnan/hexo-theme-next"><img align="center" width="56" height="56" src="../../blob/master/source/images/logo.svg"></a> e x T</div>

<p align="center">NexT 是一个高质量并且优雅的<a href="http://hexo.io">Hexo</a> 主题。这是带着热爱，从零开始一步一步做出来的。</p>

![NexT Schemes](http://iissnan.com/nexus/next/next-schemes.jpg)

[![Join the chat at https://gitter.im/iissnan/hexo-theme-next](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/iissnan/hexo-theme-next?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![mnt-image]][commits-url]
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]](LICENSE)

* <a href="http://theme-next.iissnan.com" target="_blank">NexT 使用文档</a> |  [English Documentation](README.md)

## Live Preview


* :heart_decoration: Muse scheme: [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me) | [Hui Wang](http://hui-wang.info)
* :six_pointed_star: Mist scheme: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces scheme: [Vi](http://notes.iissnan.com) | [Acris](https://blog.mrx.one) | [Rainy](https://rainylog.com)
* :gemini: Gemini scheme: [Ivan.Nginx](https://almostover.ru) | [Alynx](http://sh.alynx.xyz) | [Raincal](https://raincal.top)


更多 NexT 例子点击 [这里](https://github.com/iissnan/hexo-theme-next/issues/119).

## 安装

**1.** 在终端切换到 **hexo 根** 目录. 在hexo目录下一定有 `node_modules`, `source`, `themes` 和其他文件夹:
   ```sh
   $ cd hexo
   $ ls
   _config.yml  node_modules  package.json  public  scaffolds  source  themes
   ```

**2.** 从 github 上获取主题 。这里有几种方式来获取主题:

### 下载 [最新发布的版本][releases-latest-url].
   在大多数情况下 **稳定**。 推荐下载这个。

   [![curl-tar-wget-image]][curl-tar-wget-url]

   ```sh
   $ mkdir themes/next
   $ curl -s https://api.github.com/repos/iissnan/hexo-theme-next/releases/latest | grep tarball_url | cut -d '"' -f 4 | wget -i - -O- | tar -zx -C themes/next --strip-components=1
   ```

### 下载 [标签发布版本][releases-url].
   您必须定义版本。从[标签列表][tags-url]里选择版本替换`v5.1.2`。

   [![curl-tar-image]][curl-tar-url]

   ```sh
   $ mkdir themes/next
   $ curl -L https://api.github.com/repos/iissnan/hexo-theme-next/tarball/v5.1.2 | tar -zxv -C themes/next --strip-components=1
   ```

   [![git-image]][git-url]

   ```sh
   $ git clone --branch v5.1.2 https://github.com/iissnan/hexo-theme-next themes/next
   ```

### Download [latest master branch][download-latest-url].
   May be **unstable**, but includes latest features. Recommended for developers.

   [![curl-tar-image]][curl-tar-url]

   ```sh
   $ mkdir themes/next
   $ curl -L https://api.github.com/repos/iissnan/hexo-theme-next/tarball | tar -zxv -C themes/next --strip-components=1
   ```

   [![git-image]][git-url]

   ```sh
   $ git clone https://github.com/iissnan/hexo-theme-next themes/next
   ```

   Clone command will give you the **whole repository**. And in any time you can switch to any tagged release.\
   Get tags list:

   ```sh
   $ cd themes/next
   $ git tag -l
   …
   v5.0.0
   v5.0.1
   v5.1.0
   v5.1.1
   v5.1.2
   ```

   For example, you want to switch on `v5.1.0` [tagged release version][tags-url]. Input the following command:

   ```sh
   $ git checkout tags/v5.1.0
   Note: checking out 'tags/v5.1.0'.
   …
   HEAD now on 1f72f68... CSS: Remove global list-style setting of ul
   ```

   And if you want to switch back on [master branch][commits-url], input this command:

   ```sh
   $ git checkout master
   ```

**3.** Set theme in main **hexo root config** `_config.yml` file:

    theme: next

## 浏览器支持 Browser support

![Browser support](http://iissnan.com/nexus/next/browser-support.png)

[![Browser Stack](.github/browserstack_logo.png)](https://www.browserstack.com/)
>**BrowserStack** is a cloud-based cross-browser testing tool that enables developers to test their websites across various browsers on different operating systems and mobile devices, without requiring users to install virtual machines, devices or emulators.

## 贡献 Contributing

接受各种形式的贡献，包括不限于提交问题与需求，修复代码。等待您的`Pull Request`。

Any types of contribution are welcome. Thanks.

**ATTENTION! Contributors on Chinese docs needed!**\
Need to translate from [English docs](README.md) to Chinese docs.\
Any help wanted!\
Thank's a lot!

## 开发 Development

NexT 主旨在于简洁优雅且易于使用，所以首先要尽量确保 NexT 的简洁易用性。

NexT is built for easily use with elegant appearance. First things first, always keep things simple.

## [开发历史 Changelog](https://github.com/iissnan/hexo-theme-next/wiki/Changelog)



[browser-image]: https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari%20%7C%20ie%20%3E%3D%209-lightgrey.svg
[browser-url]: https://www.browserstack.com

[gitter-image]: https://badges.gitter.im/Join%20Chat.svg
[gitter-url]: https://gitter.im/iissnan/hexo-theme-next?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[travis-image]: https://travis-ci.org/iissnan/hexo-theme-next.svg?branch=master
[travis-url]: https://travis-ci.org/iissnan/hexo-theme-next?branch=master "Travis CI"

[hexo-image]: https://img.shields.io/badge/hexo-%3E%3D%203.0-blue.svg
[hexo-url]: http://hexo.io

[mnt-image]: https://img.shields.io/maintenance/yes/2017.svg
[rel-image]: https://img.shields.io/github/release/iissnan/hexo-theme-next.svg
<!--[lic-image]: https://img.shields.io/npm/l/hexo-theme-next.svg-->
[lic-image]: https://img.shields.io/dub/l/vibe-d.svg

[git-image]: https://img.shields.io/badge/install%20with%20-git-blue.svg
[curl-tar-image]: https://img.shields.io/badge/install%20with%20-curl%20%7C%20tar-blue.svg
[curl-tar-wget-image]: https://img.shields.io/badge/install%20with%20-curl%20%7C%20tar%20%7C%20wget-blue.svg
[git-url]: http://lmgtfy.com/?q=linux+git+install
[curl-tar-url]: http://lmgtfy.com/?q=linux+curl+tar+install
[curl-tar-wget-url]: http://lmgtfy.com/?q=linux+curl+tar+wget+install

[download-latest-url]: https://github.com/iissnan/hexo-theme-next/archive/master.zip
[releases-latest-url]: https://github.com/iissnan/hexo-theme-next/releases/latest
[releases-url]: https://github.com/iissnan/hexo-theme-next/releases
[tags-url]: https://github.com/iissnan/hexo-theme-next/tags
[commits-url]: https://github.com/iissnan/hexo-theme-next/commits/master
