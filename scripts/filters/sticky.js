/* global hexo */

var PRIORITY_AFTER_BUILTIN_FILTER = 11;

hexo.extend.filter.register('before_generate', function () {

  this.model('Post').toArray().map(function (post) {
    var sticky = Number(post.sticky);
    post.sticky = isNaN(sticky) ? 0 : sticky;
    post.save();
  });

}, PRIORITY_AFTER_BUILTIN_FILTER);
