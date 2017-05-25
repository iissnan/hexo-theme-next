/* global hexo */
// Class: success, info, warning, danger
// If class not used ,class is info
// Usage: {% alert [tip] [class] %} Content {% endalert %}

function alertOut(args, content) {
	var style, icon, tip;
	if (args.length > 0) {
		tip = args[0] || '';
		style = args[1] || '';
	}
	else {
		style = 'info';
	}

	switch (style) {
		case 'success':
			tip = tip.length == 0 ? tip : "Success Message";
			icon = 'fa-lightbulb-o';
			break;
		case 'info':
			tip = tip.length == 0 ? tip : "Info Message";
			icon = 'fa-info';
			break;
		case 'warning':
			tip = tip.length == 0 ? tip : "Warning Message";
			icon = 'fa-bell';
			break;
		case 'danger':
			tip = tip.length == 0 ? tip : "Danger Message";
			icon = 'fa-bug';
			break;
		default:
			tip = tip.length == 0 ? tip : "Success Message";
			icon = 'fa-lightbulb-o';
			break;
	}

	content = hexo.render.renderSync({ text: content, engine: 'markdown' });
	var text = '<div class="alert alert-' + style + '"><i class="fa ' + icon + ' fa-lg">&nbsp;&nbsp;<strong>' + tip + '</strong></i> ' + content + '</div>';

	return text;
};

hexo.extend.tag.register('alert', alertOut, { ends: true });