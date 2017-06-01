/* global hexo */
// Class: default, primary, success, info, warning, danger
// Usage (no need to write this in 1 line if u want see any bugs):
// {% note class %}
// Content
// {% endnote %}

function bscallOut (args, content) {
  return '<div class="note ' + args.join(' ') + '">' +
            hexo.render.renderSync({text: content, engine: 'markdown'}) +
          '</div>';
}

hexo.extend.tag.register('note', bscallOut, {ends: true});
