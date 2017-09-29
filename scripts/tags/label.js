/**
 * label.js | global hexo script.
 *
 * Usage:
 *
 * {% label [class]@Text %}
 *
 * [class] : default | primary | success | info | warning | danger.
 *           If not defined, default class will be selected.
 */

function postLabel (args) {
  args = args.join(' ').split('@');
  var classes = args[0] || 'default';
  var text = args[1] || '';

  classes = classes.trim();
  !text && hexo.log.warn('Label text must be defined!');

  return '<span class="label ' + classes + '">' + text + '</span>';
}

hexo.extend.tag.register('label', postLabel, { ends: false });
