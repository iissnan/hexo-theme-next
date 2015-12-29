if (typeof DUOSHUO !== 'undefined') {
	hook_duoshuo_templates();
} else {
	$('[src="http://static.duoshuo.com/embed.js"]')[0].onload = hook_duoshuo_templates;
}
var is_hook_duoshuo = false;

function hook_duoshuo_templates() {
	if (is_hook_duoshuo) {
		return;
	} else {
		is_hook_duoshuo = true;
	}
	var _D_post = DUOSHUO.templates.post;
	DUOSHUO.templates.post = function(e, t) {
		var rs = _D_post(e, t);
		var is_admin;
		if (typeof duoshuo_user_ID !== 'undefined') {
			if (e.post.author.user_id && (e.post.author.user_id == duoshuo_user_ID)) {
				is_admin = '<span class="this_ua admin">博主</span>'
			} else {
				is_admin = '';
			}
		} else {
			is_admin = '';
		}
		var agent = e.post.agent;
		if (agent && /^Mozilla/.test(agent)) {
			rs = rs.replace(/<\/div><p>/, is_admin + show_ua(agent) + '</div><p>')
		};
		return rs;
	}
}

function show_ua(string) {
	$.ua.set(string);
	var sua = $.ua;
	if (sua.os.version == 'x86_64') {
		sua.os.version = 'x64';
	}
	return '<span class="this_ua platform ' + sua.os.name + '">' + sua.os.name + ' ' + sua.os.version + '</span><span class="this_ua browser ' + sua.browser.name + '">' + sua.browser.name + ' | ' + sua.browser.version + '</span>';
}