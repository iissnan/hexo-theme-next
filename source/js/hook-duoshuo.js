if (typeof DUOSHUO !== 'undefined') hookDUOSHUO_tp();
else $('#duoshuo-script')[0].onload = hookDUOSHUO_tp;

function hookDUOSHUO_tp() {
    var _D_post = DUOSHUO.templates.post
    DUOSHUO.templates.post = function (e, t) {
        var rs = _D_post(e, t);
        var agent = e.post.agent;
        var isAdmin;
        if (typeof duoshuo_user_ID !== 'undefined') {
            if (e.post.author.user_id && (e.post.author.user_id == duoshuo_user_ID)) {
                if (duoshuo_admin_nickname) {
                    isAdmin = '<span class="fa">' + duoshuo_admin_nickname + '</span>';
                } else {
                    isAdmin = '<span class="fa">博主</span>';
                }
            } else {
                isAdmin = '';
            }
        } else {
            isAdmin = '';
        }
        if (agent && /^Mozilla/.test(agent)) rs = rs.replace(/<\/div><p>/, isAdmin + showUa(agent) + '</div><p>');
        return rs;
    }
}
//移动客户端判断
function checkMobile() {
    var isiPad = navigator.userAgent.match(/iPad/i) !== null;
    if (isiPad) {
        return false;
    }
    var isMobile = navigator.userAgent.match(/iphone|android|phone|mobile|wap|netfront|x11|java|opera mobi|opera mini|ucweb|windows ce|symbian|symbianos|series|webos|sony|blackberry|dopod|nokia|samsung|palmsource|xda|pieplus|meizu|midp|cldc|motorola|foma|docomo|up.browser|up.link|blazer|helio|hosin|huawei|novarra|coolpad|webos|techfaith|palmsource|alcatel|amoi|ktouch|nexian|ericsson|philips|sagem|wellcom|bunjalloo|maui|smartphone|iemobile|spice|bird|zte-|longcos|pantech|gionee|portalmmm|jig browser|hiptop|benq|haier|^lct|320x320|240x320|176x220/i) != null;
    if (isMobile) {
        return true;
    }
    return false;
}

function showUa(string) {
    $.ua.set(string);
    var sua = $.ua;
    var br = '&nbsp;&nbsp;';
    var osIco = '<i class="fa fa-desktop"></i>&nbsp;';
    var browserIco = '<i class="fa fa-globe"></i>&nbsp;'
    var osName = sua.os.name;
    var browserName = sua.browser.name;
    if (checkMobile()) br = '<br><br>';

    if (osName.match(/Android/i)) osIco = '<i class="fa fa-android"></i>&nbsp;';
    if (osName.match(/linux/i)) osIco = '<i class="fa fa-linux"></i>&nbsp;';
    if (osName.match(/mac os|ios/i)) osIco = '<i class="fa fa-apple"></i>&nbsp;';
    if (sua.os.version == 'x86_64') sua.os.version = 'x64';

    if (browserName.match(/chrome|chromium/i)) browserIco = '<i class="fa fa-chrome"></i>&nbsp;';
    if (browserName.match(/firefox/i)) browserIco = '<i class="fa fa-firefox"></i>&nbsp;';
    if (browserName.match(/opera/i)) browserIco = '<i class="fa fa-opera"></i>&nbsp;';
    if (browserName.match(/safari/i)) browserIco = '<i class="fa fa-safari"></i>&nbsp;';
    if (browserName.match(/ie/i)) browserIco = '<i class="fa fa-internet-explorer"></i>&nbsp;';
    if (browserName.match(/WeChat/i)) browserIco = '<i class="fa fa-wechat"></i>&nbsp;';
    if (browserName.match(/QQBrowser/i)) browserIco = '<i class="fa fa-qq"></i>&nbsp;';

    return br + '<span class="platform ' + sua.os.name + '">' + osIco +
        sua.os.name + ' ' + sua.os.version + '</span>' + br +
        '<span class="browser ' + sua.browser.name + '">' + browserIco +
        sua.browser.name + '|' + sua.browser.version + '</span>';
}
