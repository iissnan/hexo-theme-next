/**
 * note.js | global hexo script.
 *
 * ATTENTION! No need to write this tag in 1 line if u don't want see probally bugs.
 *
 * Usage:
 *
 * {% note [class] %}
 * Any content (support inline tags too).
 * {% endnote %}
 *
 * [class] : default | primary | success | info | warning | danger.
 *           May be not defined.
 */

function bscallOut (args, content) {
  return '<div class="note ' + args.join(' ') + '">' + hexo.render.renderSync({text: content, engine: 'markdown'}).trim() + '</div>';
}

hexo.extend.tag.register('note', bscallOut, {ends: true});
