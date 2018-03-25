<p align="right"><a title="New «NexT» 6.0.0 version [Reloaded]" href="https://github.com/theme-next/hexo-theme-next">NexT v6.0.0 here :triangular_flag_on_post:</a></p>

<h1 align="center">NexT</h1>

<p align="center">NexT is a high quality elegant <a href="http://hexo.io">Hexo</a> theme. It is crafted from scratch, with love.</p>

[![gitter-image]][gitter-url]
[![mnt-image]](https://github.com/theme-next/hexo-theme-next)
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]](LICENSE)

* [Chinese Documentation](README.cn.md)

## Live Preview

* :heart_decoration: Muse scheme: [LEAFERx](https://leaferx.online) | [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me)
* :six_pointed_star: Mist scheme: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces scheme: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Rainy](https://rainylog.com)
* :gemini: Gemini scheme: [Ivan.Nginx](https://almostover.ru) | [Raincal](https://raincal.com) | [Dandy](https://dandyxu.me)

More NexT examples [here](https://github.com/iissnan/hexo-theme-next/issues/119).

## Installation

**1.** Change dir to **hexo root** directory. There must be `node_modules`, `source`, `themes` and other directories:
   ```sh
   $ cd hexo
   $ ls
   _config.yml  node_modules  package.json  public  scaffolds  source  themes
   ```

**2.** Get theme from GitHub. There are several variants to do it:

### Download [latest release version][releases-latest-url].
   At most cases **stable**. Recommended for most users.

   [![curl-tar-wget-image]][curl-tar-wget-url]

   ```sh
   $ mkdir themes/next
   $ curl -s https://api.github.com/repos/iissnan/hexo-theme-next/releases/latest | grep tarball_url | cut -d '"' -f 4 | wget -i - -O- | tar -zx -C themes/next --strip-components=1
   ```

### Download [tagged release version][releases-url].
   You must define version. Replace `v5.1.2` with any version from [tags list][tags-url].

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

### Bugs
For those who also encounter **Error: Cannot find module 'hexo-util'** [issue](https://github.com/iissnan/hexo-theme-next/issues/1490), please check your NPM version.

- `> 3`: Still not work. Please remove `node_modules` directory and reinstall using `npm install`.
- `< 3`: Please add `hexo-util` explicitly via `npm install --save-dev hexo-util` to you site package deps.

## Update

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

In order to resolve this issue, NexT will take advantage of Hexo [Data files](https://hexo.io/docs/data-files.html). Because Data files is introduced in Hexo 3, so you need upgrade Hexo to 3.0 (or above) to use this feature.

If you prefer Hexo 2.x, you can still use the old approach for configurations. NexT is still compatible with Hexo 2.x.

#### Benefits

With this feature, now you can put all your configurations into one place (`source/_data/next.yml`), you don't need to touch `next/_config.yml`. If there are any new options in new releases, you just need to copy those options from `next/_config.yml`, paste into `_data/next.yml` and set their values to whatever you want.

#### How to use this feature

1. Please ensure you are using Hexo 3 (or above)
2. Create an file named `next.yml` in site's `source/_data` directory (create `_data` directory if it did not exist)
3. Copy NexT theme options both in site's `_config.yml` and theme's `_config.yml` into `next.yml`.
4. Use `--config source/_data/next.yml` parameter to start server, generate or deploy.\
   For example: `hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml`.

## Features

### Multiple languages support, including:
:cn: Simplified Chinese & Traditional Chinese.<br>
:us: English<br>
:ru: Russian<br>
:fr: French<br>
:de: German<br>
:jp: Japanese<br>
:indonesia: Indonesian<br>
:portugal: Portuguese (Brazil)<br>
:kr: Korean<br>
:it: Italian<br>
:netherlands: Dutch<br>
:vietnam: Vietnamese

Default language is English.

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
# language: vi
```

Set `language` field as following in site `_config.yml` to change to Chinese.

```yml
language: zh-Hans
```

### Comment support.

NexT has native support for `DuoShuo` and `Disqus` comment systems.

Add the following snippets to your `_config.yml`:

```yml
duoshuo:
  enable: true
  shortname: your-duoshuo-shortname
```

OR

```yml
disqus_shortname: your-disqus-shortname
```

### Tags page.

> Add a tags page contains all tags in your site.

- Create a page named `tags`

        hexo new page "tags"

- Edit tags page, set page type to `tags`.

        title: All tags
        date: 2014-12-22 12:39:04
        type: "tags"

- Add `tags` to theme `_config.yml`:

        menu:
          home: /
          archives: /archives
          tags: /tags

### Categories page.

> Add a categories page contains all categories in your site.

- Create a page named `categories`

        hexo new page "categories"

- Edit categories page, set page type to `categories`.

        title: All categories
        date: 2014-12-22 12:39:04
        type: "categories"

- Add `categories` to theme `_config.yml`:

        menu:
          home: /
          archives: /archives
          categories: /categories

### Social Media

NexT can automatically add links to your Social Media accounts:

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

## Browser support

![browser-image]

[![Browser Stack](.github/browserstack_logo.png)](https://www.browserstack.com/)
>**BrowserStack** is a cloud-based cross-browser testing tool that enables developers to test their websites across various browsers on different operating systems and mobile devices, without requiring users to install virtual machines, devices or emulators.

## Contributing

Contribution is welcome, feel free to open an issue and fork. Waiting for your pull request.
<!--
[![hexo-image]][hexo-url]
[![bower-image]][bower-url]
[![jquery-image]][jquery-url]

[hexo-image]: http://img.shields.io/badge/Hexo-2.4+-2BAF2B.svg?style=flat-square
[hexo-url]: http://hexo.io
[bower-image]: http://img.shields.io/badge/Bower-*-2BAF2B.svg?style=flat-square
[bower-url]: http://bower.io
[jquery-image]: https://img.shields.io/badge/jquery-1.9-blue.svg?style=flat-square
[jquery-url]: http://jquery.com/
-->

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
