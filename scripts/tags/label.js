/* global hexo */
// Class: default, primary, success, info, warning, danger
// Usage: {% label class %} Content {% endlabel %}

function labelOut(args, content) {
    //var values = args[0];
    var style;
    if (args.length > 0) {
        style = args[0];
    } else {
        style = 'default';
    }
    return '&nbsp;<span class="label label-' + style + '">' + content + '</span>&nbsp;';
};

hexo.extend.tag.register('label', labelOut, { ends: true });