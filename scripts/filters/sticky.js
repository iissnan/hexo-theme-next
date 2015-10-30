/* global hexo */

hexo.extend.filter.register('before_generate', function () {
  if (this.locals.invalidate && this.locals.get) {
    this.locals.invalidate();

    var posts = this.locals.get('posts');
    posts.forEach(function (post) {
      var sticky = Number(post.sticky);
      post.sticky = isNaN(sticky) ? 0 : sticky;
    });
    this.locals.set('posts', posts);
  }
});
