/* global hexo */

var merge = require('./merge');

/**
 * Merge configs in _data/next.yml into hexo.theme.config.
 * Note: configs in _data/next.yml will override configs in hexo.theme.config.
 */
hexo.on('generateBefore', function () {
  if (hexo.locals.get) {
    var data = hexo.locals.get('data');
    if ( data && data.next ) {
      if ( data.next.override ) {
        hexo.theme.config = data.next;
      } else {
        merge(hexo.theme.config, data.next);
      }
    }
  }
});
