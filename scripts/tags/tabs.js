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
    var tabBlock = /<!--\s*tab (.*?)\s*-->\n([\w\W\s\S]*?)<!--\s*endtab\s*-->/g;

    var args = args.join(' ').split(',');
    var tabName = args[0];
    var tabActive = args[1] || '';

    var matches = [];
    var match;
    var tabId = 0;
    var tabNav = '';
    var tabContent = '';

    !tabName && hexo.log.warn('Tabs block must have unique name!');

    while (match = tabBlock.exec(content)) {
      matches.push(match[1]);
      matches.push(match[2]);
    }

    for (var i = 0; i < matches.length; i += 2) {
      var tabParameters = matches[i].split('@');
      var postContent = matches[i + 1];
      var tabCaption = tabParameters[0] || '';
      var tabIcon = tabParameters[1] || '';
      var tabHref =  '';

      postContent = hexo.render.renderSync({text: postContent, engine: 'markdown'});

      tabId += 1;
      tabHref = (tabName + ' ' + tabId).toLowerCase().split(' ').join('-');

      ((tabCaption.length === 0) && (tabIcon.length === 0)) && (tabCaption = tabName + ' ' + tabId);

      var isOnlyicon = (tabIcon.length > 0 && tabCaption.length === 0) ? 'style="text-align: center;' : '';
      tabIcon.length > 0 && (tabIcon = '<i class="fa fa-' + tabIcon.trim() + '"' + isOnlyicon + '"></i>');

      var isActive = ((tabActive.length > 0 && tabActive == tabId) || (tabActive.length === 0 && tabId == 1)) ? ' active' : '';
      tabNav += '<li class="tab' + isActive + '"><a href="#' + tabHref + '">' + tabIcon + tabCaption + '</a></li>';
      tabContent += '<div class="tab-pane' + isActive + '" id="' + tabHref + '">' + postContent + '</div>';
    }

    tabNav = '<ul class="nav-tabs">' + tabNav + '</ul>';
    tabContent = '<div class="tab-content">' + tabContent + '</div>';

    return '<div class="tabs" id="' + tabName.toLowerCase().split(' ').join('-') + '">' + tabNav + tabContent + '</div>';
  }

  hexo.extend.tag.register('tabs', postTabs, {ends: true});
