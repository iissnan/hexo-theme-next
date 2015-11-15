typeof DUOSHUO !== 'undefined' ?
  hookDUOSHUO_tp() :
  ($('#duoshuo-script')[0].onload = hookDUOSHUO_tp);


function hookDUOSHUO_tp() {
  var _D_post = DUOSHUO.templates.post;

  DUOSHUO.templates.post = function (e, t) {
    var rs = _D_post(e, t);
    var agent = e.post.agent;
    var userId = e.post.author.user_id;
    var admin = '';

    if (userId && (userId == duoshuo_user_ID)) {
      admin = '<span class="duoshuo-ua-admin">' + duoshuo_admin_nickname + '</span>';
    }

    if (agent && /^Mozilla/.test(agent)) {
      rs = rs.replace(/<\/div><p>/, admin + getAgentInfo(agent) + '</div><p>');
    }

    return rs;
  }
}

function getAgentInfo(string) {
  $.ua.set(string);

  var UNKNOWN = 'Unknown';
  var sua = $.ua;
  var seperator = isMobile() ? '<br><br>' : '<span class="duoshuo-ua-seperator"></span>';
  var osName = sua.os.name || UNKNOWN;
  var osVersion = sua.os.version  || UNKNOWN;
  var browserName = sua.browser.name || UNKNOWN;
  var browserVersion = sua.browser.version || UNKNOWN;
  var iconMapping = {
    os: {
      android : 'android',
      linux   : 'linux',
      windows : 'windows',
      ios     : 'apple',
      'mac os': 'apple',
      unknown : 'desktop'
    },
    browser: {
      chrome : 'chrome',
      'chromium': 'chrome',
      firefox: 'firefox',
      opera  : 'opera',
      safari : 'safari',
      ie     : 'internet-explorer',
      unknown: 'globe'
    }
  };
  var osIcon = iconMapping.os[osName.toLowerCase()];
  var browserIcon =  iconMapping.browser[browserName.toLowerCase()];

  return seperator +
    '<span class="duoshuo-ua-platform duoshuo-ua-platform-' + osName.toLowerCase() + '">' +
       '<i class="fa fa-' + osIcon + '"></i>' +
       osName + ' ' + osVersion +
    '</span>' + seperator +
    '<span class="duoshuo-ua-browser duoshuo-ua-browser-' + browserName.toLowerCase() + '">' +
      '<i class="fa fa-' + browserIcon + '"></i>' +
      browserName + ' ' + browserVersion +
    '</span>';

  function isMobile() {
    var userAgent = navigator.userAgent;

    var isiPad = userAgent.match(/iPad/i) !== null;
    var mobileUA = [
      'iphone', 'android', 'phone', 'mobile',
      'wap', 'netfront', 'x11', 'java', 'opera mobi',
      'opera mini', 'ucweb', 'windows ce', 'symbian',
      'symbianos', 'series', 'webos', 'sony',
      'blackberry', 'dopod', 'nokia', 'samsung',
      'palmsource', 'xda', 'pieplus', 'meizu',
      'midp' ,'cldc' , 'motorola', 'foma',
      'docomo', 'up.browser', 'up.link', 'blazer',
      'helio', 'hosin', 'huawei', 'novarra',
      'coolpad', 'webos', 'techfaith', 'palmsource',
      'alcatel', 'amoi', 'ktouch', 'nexian',
      'ericsson', 'philips', 'sagem', 'wellcom',
      'bunjalloo', 'maui', 'smartphone', 'iemobile',
      'spice', 'bird', 'zte-', 'longcos',
      'pantech', 'gionee', 'portalmmm', 'jig browser',
      'hiptop', 'benq', 'haier', '^lct',
      '320x320', '240x320', '176x220'
    ];
    var pattern = new RegExp(mobileUA.join('|'), 'i');

    return !isiPad && userAgent.match(pattern);
  }
}
