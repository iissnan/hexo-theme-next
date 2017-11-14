# <div align="center"><a href="https://github.com/iissnan/hexo-theme-next"><img align="center" width="56" height="56" src="../../blob/master/source/images/logo.svg"></a> e x T</div>

<p align="center">NexT 是一个高质量并且优雅的<a href="http://hexo.io">Hexo</a> 主题。这是一份带着热爱，而做出来的 hexo 主题。</p>

![NexT Schemes](http://iissnan.com/nexus/next/next-schemes.jpg)

[![Join the chat at https://gitter.im/iissnan/hexo-theme-next](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/iissnan/hexo-theme-next?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![mnt-image]][commits-url]
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]](LICENSE)

* <a href="http://theme-next.iissnan.com" target="_blank">NexT 使用文档</a> |  [English Documentation](README.md)

## 实时预览


* :heart_decoration: Muse 方案: [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me) | [Hui Wang](http://hui-wang.info)
* :six_pointed_star: Mist 方案: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces 方案: [Vi](http://notes.iissnan.com) | [Acris](https://blog.mrx.one) | [Rainy](https://rainylog.com)
* :gemini: Gemini 方案: [Ivan.Nginx](https://almostover.ru) | [Alynx](http://sh.alynx.xyz) | [Raincal](https://raincal.top)


更多 NexT 例子点击 [这里](https://github.com/iissnan/hexo-theme-next/issues/119).

## 安装

**1.** 在终端切换到**hexo 根**目录. 在hexo目录下一定有 `node_modules`, `source`, `themes` 和其他文件夹:
   ```sh
   $ cd hexo
   $ ls
   _config.yml  node_modules  package.json  public  scaffolds  source  themes
   ```

**2.** 从 github 上获取主题 。这里有几种方式来获取主题:

### 下载 [最新发布的版本][releases-latest-url].
   在大多数情况下 **稳定**。 推荐用户下载这个。

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

### 下载[最新的 master 分支][download-latest-url].
  可能会 **不稳定**, 但是包含最新的特色，推荐开发者下载.

   [![curl-tar-image]][curl-tar-url]

   ```sh
   $ mkdir themes/next
   $ curl -L https://api.github.com/repos/iissnan/hexo-theme-next/tarball | tar -zxv -C themes/next --strip-components=1
   ```

   [![git-image]][git-url]

   ```sh
   $ git clone https://github.com/iissnan/hexo-theme-next themes/next
   ```

  使用克隆命令，你将得到**整个存储库**。而且在任何时候你都可以切换到任何标签发布版本。
  获取标签列表：

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

   例如, 你想要切换到`v5.1.0` [标签发布版本][tags-url]. 输入以下命令:

   ```sh
   $ git checkout tags/v5.1.0
   Note: checking out 'tags/v5.1.0'.
   …
   HEAD now on 1f72f68... CSS: Remove global list-style setting of ul
   ```

   如果你想切换回 [master 分支][commits-url]的话, 输入这个命令:

   ```sh
   $ git checkout master
   ```

**3.** 在 **hexo 根目录下** 的配置文件`_config.yml`里设置主题:

    theme: next
    
### Bugs
对于那些遇到 **Error: Cannot find module 'hexo-util'** [问题](https://github.com/iissnan/hexo-theme-next/issues/1490)的人, 请检查你的NPM 版本. 

- `版本 > 3`: 如果仍然不行的话，请移除 `node_modules` 文件 然后重新安装，使用 `npm install`命令。
- `版本 < 3`: 请通过`npm install --save-dev hexo-util`命令添加`hexo-util`到你的主题包依赖里

## 更新

```sh
$ cd themes/next
$ git pull
```

### Bugs

> Commit your changes or stash them before you can merge

You must Commit, Stash or Discard local changes. See [here](https://stackoverflow.com/a/15745424/5861495) how to do it.

### Theme configurations using Hexo data files ([#328](https://github.com/iissnan/hexo-theme-next/issues/328))

Currently, it is not smooth to update NexT theme from pulling or downloading new releases. It is quite often running into conflict status when updating NexT theme via `git pull`, or need to merge configurations manually when upgrading to new releases.

 At present, NexT encourages users to store some options in site's `_config.yml` and other options in theme's `_config.yml`. This approach is applicable, but has some drawbacks:
1. Configurations are splited into two pieces
2. Users maybe confuse which place should be for options

为了解决这个问题, NexT 将利用 Hexo [数据文件](https://hexo.io/docs/data-files.html). 因为数据文件引进了Hexo 3, 因此你需要升级到 Hexo 3.0 以上版本（包含3.0），来使用这个特性。

如果你更喜欢Hexo 2.x, 你仍然可以使用旧方法进行配置。 NexT 仍然兼容 Hexo 2.x。

#### Benefits

With this feature, now you can put all your configurations into one place (`source/_data/next.yml`), you don't need to touch `next/_config.yml`. If there are any new options in new releases, you just need to copy those options from `next/_config.yml`, paste into `_data/next.yml` and set their values to whatever you want.

#### 如何使用这个特色

1. 请确保您使用的是Hexo 3以上版本（包含3）
2. 在主题文件里找到 `source/_data` 目录，创建一个文件名为 `next.yml`  (如果`_data`目录不存在那么就创建`_data` 目录)
3. 复制 NexT主题配置文件`_config.yml`里面的代码，然后粘贴到`next.yml`里
4. 使用 `--config source/_data/next.yml` 参数启动服务器, 生成或者部署。\
   例如: `hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml`。

## 特色

### 支持多国语言, 包括:
:cn: 简体中文 & 繁体中文.<br>
:us: 英语<br>
:ru: 俄语<br>
:fr: 法语<br>
:de: 德语<br>
:jp: 日语<br>
:indonesia: 印度尼西亚语<br>
:portugal: 葡萄牙语 (巴西)<br>
:kr: 朝鲜语<br>
:it: 意大利语<br>
:netherlands: 荷兰语

默认语言是英语。

```yml
language: en
# language: zh-Hans
# language: zh-hk
# language: zh-tw
# language: ru
# language: fr-FR
# language: de
# language: ja
# language: id
# language: pt
# language: pt-BR
# language: ko
# language: it
# language: nl-NL
```

Set `language` field as following in site `_config.yml` to change to Chinese.

```yml
language: zh-Hans
```

### 评论支持.

NexT 已经原生支持 `多说` and `Disqus` 评论系统。

添加以下代码到你的主题配置文件 `_config.yml`:

```yml
duoshuo:
  enable: true
  shortname: your-duoshuo-shortname
```

或者

```yml
disqus_shortname: your-disqus-shortname
```

### 标签页.

> 添加一个标签页面，里面包含您网站中的所有标签。

- 创建一个名为 `tags` 页面

        hexo new page "tags"

- 编辑标签页, 设置页面类型为`tags`.

        title: All tags
        date: 2014-12-22 12:39:04
        type: "tags"

- 添加 `tags` 到主题配置文件 `_config.yml` 里:

        menu:
          home: /
          archives: /archives
          tags: /tags

### 分类页.

> 添加一个分类页面，里面包含您网站中的所有分类。

- 创建一个名为 `categories` 页面

        hexo new page "categories"

- 编辑分类页, 设置页面类型为 `categories`.

        title: All categories
        date: 2014-12-22 12:39:04
        type: "categories"

- 添加 `categories` 到主题配置文件 `_config.yml` 里:

        menu:
          home: /
          archives: /archives
          categories: /categories

### 社交媒体

NexT 可以自动添加链接到您的社交媒体帐户里:

```yml
social:
  GitHub: your-github-url
  Twitter: your-twitter-url
  Weibo: your-weibo-url
  DouBan: your-douban-url
  ZhiHu: your-zhihu-url
```

### Feed link.

> Show a feed link.

Set `rss` field in theme's `_config.yml`, as the following value:

1. `rss: false` will totally disable feed link.
2. `rss:  ` use sites' feed link. This is the default option.

    Follow the installation instruction in the plugin's README. After the configuration is done for this plugin, the feed link is ready too.

3. `rss: http://your-feed-url` set specific feed link.

### Up to 5 code highlight themes built-in.

NexT uses [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme) with 5 themes for you to choose from.
Next use `normal` by default. Have a preview about `normal` and `night`:

![Tomorrow Normal Preview](http://iissnan.com/nexus/next/tomorrow-normal.png)
![Tomorrow Night Preview](http://iissnan.com/nexus/next/tomorrow-night.png)

Head over to [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme) for more details.

## Configuration

NexT comes with few configurations.

```yml

# Menu configuration.
menu:
  home: /
  archives: /archives

# Favicon
favicon: /favicon.ico

# Avatar (put the image into next/source/images/)
# can be any image format supported by web browsers (JPEG,PNG,GIF,SVG,..)
avatar: /default_avatar.png

# Code highlight theme
# available: normal | night | night eighties | night blue | night bright
highlight_theme: normal

# Fancybox for image gallery
fancybox: true

# Specify the date when the site was setup
since: 2013

```


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
