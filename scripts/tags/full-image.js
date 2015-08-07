/* global hexo */
// Usage: {% fullimage /path/to/image, alt, title %}

function fullImage(args) {
  args = args.join('').split(',');
  var src = args[0];
  var alt = args[1];
  var title = args[2];

  var image = ['<img src="' + src + '" class="full-image"'];
  alt && image.push('alt="' + alt + '"');
  title && image.push('title="' + title + '"');
  image.push('/>');

  return image.join(' ');
}

hexo.extend.tag.register('fullimage', fullImage);
