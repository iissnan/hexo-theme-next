/* global hexo */

hexo.on('generateBefore', function () {
  var posts = this.locals.get('posts');

  this.locals.set('posts', function () {
    posts.forEach(function (post) {
      post.sticky = post.sticky ? Number(post.sticky) : 0;
    });
    return posts;
  });
});

hexo.extend.filter.register('template_locals', function (locals) {
  if (locals.posts) {
    locals.posts = locals.posts.sort('-sticky');
  }
});
