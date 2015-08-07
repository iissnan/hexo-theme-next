/* global hexo */
// Usage: {% centerquote %} Something {% endcenterquote %}

function centerQuote (args, content) {
  return '<blockquote class="blockquote-center">' +
            hexo.render.renderSync({text: content, engine: 'markdown'}) +
          '</blockquote>';
}

hexo.extend.tag.register('centerquote', centerQuote, {ends: true});
