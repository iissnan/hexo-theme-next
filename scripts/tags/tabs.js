/**
 * tabs.js | global hexo script.
 *
 * Usage:
 *
 * {% tabs [Unique name], [index] %}
 * <!-- tab [Tab caption]@[icon] -->
 * Any content (support inline tags too).
 *  <!-- endtab -->
 * {% endtabs %}
 *
 * [Unique name]      : Unique name of tabs block tag without comma.
 *                      Will be used in #id's as prefix for each tab with their index numbers.
 *                      If there are whitespaces in name, for generate #id all whitespaces will replaced by dashes.
 *                      Only for current url of post/page must be unique!
 * [index]            : Index number of active tab.
 *                      If not defined, first tab (1) will be selected.
 *                      If index is -1, no tab will be selected. It's will be something like spoiler.
 *                      May be not defined.
 * [Tab caption]      : Caption of current tab.
 *                      If not caption specified, unique name with tab index suffix will be used as caption of tab.
 *                      If not caption specified, but specified icon, caption will empty.
 *                      May be not defined.
 * [icon]             : Font awesome icon.
 *                      May be not defined.
 */

'use strict';

  function postTabs (args, content) {
    var tab_block = /<!--\s*tab (.*?)\s*-->\n([\w\W\s\S]*?)<!--\s*endtab\s*-->/g;

    var args = args.join(' ').split(',');
    /*jshint camelcase: false */
    var tab_name = args[0];
    var tab_active = args[1] || '';
    /*jshint camelcase: true */

    var matches = [];
    var match;
    /*jshint camelcase: false */
    var tab_id = 0;
    var tab_nav = '';
    var tab_content = '';
    /*jshint camelcase: true */

    !tab_name && hexo.log.warn('Tabs block must have unique name!');

    while (match = tab_block.exec(content)) {
      matches.push(match[1]);
      matches.push(match[2]);
    }

    for (var i = 0; i < matches.length; i += 2) {
      var tab_parameters = matches[i].split('@');
      var post_content = matches[i + 1];
      var tab_caption = tab_parameters[0] || '';
      var tab_icon = tab_parameters[1] || '';
      var tab_href =  '';

      post_content = hexo.render.renderSync({text: post_content, engine: 'markdown'});

      tab_id += 1;
      tab_href = (tab_name + ' ' + tab_id).toLowerCase().split(' ').join('-');

      ((tab_caption.length == 0) && (tab_icon.length == 0)) && (tab_caption = tab_name + ' ' + tab_id);

      var is_onlyicon = (tab_icon.length > 0 && tab_caption.length == 0) ? 'style="text-align: center;' : '';
      tab_icon.length > 0 && (tab_icon = '<i class="fa fa-' + tab_icon.trim() + '"' + is_onlyicon + '"></i>');

      var is_active = ((tab_active.length > 0 && tab_active == tab_id) || (tab_active.length == 0 && tab_id == 1)) ? ' active' : '';
      tab_nav += '<li class="tab' + is_active + '"><a href="#' + tab_href + '">' + tab_icon + tab_caption + '</a></li>';
      tab_content += '<div class="tab-pane' + is_active + '" id="' + tab_href + '">' + post_content + '</div>';
    }

    tab_nav = '<ul class="nav-tabs">' + tab_nav + '</ul>';
    tab_content = '<div class="tab-content">' + tab_content + '</div>';

    return '<div class="tabs" id="' + tab_name.toLowerCase().split(' ').join('-') + '">' + tab_nav + tab_content + '</div>';
  }

  hexo.extend.tag.register('tabs', postTabs, {ends: true});
