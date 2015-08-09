/* global hexo */
// Usage: {% grouppictures group-layout %}{% endgrouppicutres %}

function groupPictures(args, content) {
  args = args[0].split('-');
  var expectedGroup = parseInt(args[0]);
  var layout = parseInt(args[1]);
  content = hexo.render.renderSync({text: content, engine: 'markdown'});
  var pictures = content.match(/<img[\s\S]*?>/g);
  var group = pictures.length;
  var contents = '';

  switch (group) {
    case 1:
      contents = '<div class="group-pictures-item">' + pictures[0] + '</div>';
      break;
    case 2:
      switch (layout) {
        case 1:
          contents = pictures.reduce(function (previous, current) {
            return previous + current;
          }, '<div class="group-pictures-item">') + '</div>';
          break;
        case 2:
          pictures.forEach(function (picture) {
            contents += '<div class="group-pictures-item">' + picture + '</div>';
          });
          break;
      }
      break;
    case 3:
      break;
    case 4:
      break;
    default:
  }

  return '<div class="group-pictures">' +
            '<div class="group-pictures-container">' +
              contents +
            '</div>' +
         '</div>';
}

hexo.extend.tag.register('grouppictures', groupPictures, {ends: true});
