 if (typeof DUOSHUO !== 'undefined')hookDUOSHUO_tp();
    else $('[src="http://static.duoshuo.com/embed.js"]')[0].onload=hookDUOSHUO_tp;
    var hookDUOSHUO_bl=false;
    function hookDUOSHUO_tp(){
        if(hookDUOSHUO_bl)return;
        else hookDUOSHUO_bl=true;
        var _D_post=DUOSHUO.templates.post;
        DUOSHUO.templates.post=function (e,t){
            var rs=_D_post(e,t);
        var agent=e.post.agent;
            if(agent&&/^Mozilla/.test(agent))rs=rs.replace(/<\/div><p>/,show_ua(agent)+'</div><p>');
            return rs;
        }
    }
    function show_ua(string){
        //console.log(string)
        $.ua.set(string);
        var sua=$.ua;
        if(sua.os.version=='x86_64')sua.os.version='x64';
        return '<span class="this_ua platform '+sua.os.name+'">'+sua.os.name+' '+sua.os.version+'</span><span class="this_ua browser '+sua.browser.name+'">'+sua.browser.name+'|'+sua.browser.version+'</span>';
    }