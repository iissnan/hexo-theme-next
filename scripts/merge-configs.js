/* global hexo */

/**
 * Merge configs in _data/next.yml into hexo.theme.config.
 * Note: configs in _data/next.yml will override configs in hexo.theme.config.
 */
hexo.on('generateBefore', function () {
  var data = hexo.locals.get('data');
  data && data.next && assign(hexo.theme.config, data.next);
});


// https://github.com/sindresorhus/object-assign
function assign(target, source) {
  var from;
  var keys;
  var to = toObject(target);

  for (var s = 1; s < arguments.length; s++) {
    from = arguments[s];
    keys = ownEnumerableKeys(Object(from));

    for (var i = 0; i < keys.length; i++) {
      to[keys[i]] = from[keys[i]];
    }
  }

  return to;
}

function toObject(val) {
  if (val == null) {
    throw new TypeError('Object.assign cannot be called with null or undefined');
  }

  return Object(val);
}

function ownEnumerableKeys(obj) {
  var keys = Object.getOwnPropertyNames(obj);

  if (Object.getOwnPropertySymbols) {
    keys = keys.concat(Object.getOwnPropertySymbols(obj));
  }

  return keys.filter(function (key) {
    return Object.prototype.propertyIsEnumerable.call(obj, key);
  });
}
