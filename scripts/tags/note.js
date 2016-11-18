/* global hexo */
// Class: default, primary, success, info, warning, danger
// Usage: {% note class %} Content {% endnote %}

function bscallOut (args, content) {
  return '<div class="note ' + args.join(' ') + '">' +
            hexo.render.renderSync({text: content, engine: 'markdown'}) +
          '</div>';
}

hexo.extend.tag.register('note', bscallOut, {ends: true});
