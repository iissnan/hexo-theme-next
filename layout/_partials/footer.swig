<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
<!--
  <span class="with-love">
    <i class="fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
-->
  <span class="with-love">by</span>
  <span class="author" itemprop="copyrightHolder"><a class="theme-link" href="mailto:me@isudox.com">{{ config.author }}</a></span>
  <span class="with-love">
      <a class="theme-link" href='javascript:(
        function go() {
        var songs = [
            "http://7xs161.com1.z0.glb.clouddn.com/music-final-countdown.mp3",
            "http://7xs161.com1.z0.glb.clouddn.com/music-zombie.mp3",
            "http://7xs161.com1.z0.glb.clouddn.com/music-fade.mp3",
            "http://7xs161.com1.z0.glb.clouddn.com/music-antik.mp3"
        ];
        function c() {
            var e = document.createElement("link");
            e.setAttribute("type", "text/css");
            e.setAttribute("rel", "stylesheet");
            e.setAttribute("href", f);
            e.setAttribute("class", l);
            document.body.appendChild(e)
        }
        function h() {
            var e = document.getElementsByClassName(l);
            for (var t = 0; t < e.length; t++) {
                document.body.removeChild(e[t])
            }
        }
        function p() {
            var e = document.createElement("div");
            e.setAttribute("class", a);
            document.body.appendChild(e);
            setTimeout(function() {
                document.body.removeChild(e)
            }, 100)
        }
        function d(e) {
            return {
                height : e.offsetHeight,
                width : e.offsetWidth
            }
        }
        function v(i) {
            var s = d(i);
            return s.height > e && s.height < n && s.width > t && s.width < r
        }
        function m(e) {
            var t = e;
            var n = 0;
            while (!!t) {
                n += t.offsetTop;
                t = t.offsetParent
            }
            return n
        }
        function g() {
            var e = document.documentElement;
            if (!!window.innerWidth) {
                return window.innerHeight
            } else if (e && !isNaN(e.clientHeight)) {
                return e.clientHeight
            }
            return 0
        }
        function y() {
            if (window.pageYOffset) {
                return window.pageYOffset
            }
            return Math.max(document.documentElement.scrollTop, document.body.scrollTop)
        }
        function E(e) {
            var t = m(e);
            return t >= w && t <= b + w
        }
        function S() {
            var e = document.getElementById("audio_element_id");
            if(e != null){
                var index = parseInt(e.getAttribute("curSongIndex"));
                if(index > songs.length - 2) {
                    index = 0;
                } else {
                    index++;
                }
                e.setAttribute("curSongIndex", index);
                N();
            }
            e.src = i;
            e.play()
        }
        function x(e) {
            e.className += " " + s + " " + o
        }
        function T(e) {
            e.className += " " + s + " " + u[Math.floor(Math.random() * u.length)]
        }
        function N() {
            var e = document.getElementsByClassName(s);
            var t = new RegExp("\\b" + s + "\\b");
            for (var n = 0; n < e.length; ) {
                e[n].className = e[n].className.replace(t, "")
            }
        }
        function initAudioEle() {
            var e = document.getElementById("audio_element_id");
            if(e === null){
                e = document.createElement("audio");
                e.setAttribute("class", l);
                e.setAttribute("curSongIndex", 0);
                e.id = "audio_element_id";
                e.loop = false;
                e.bgcolor = 0;
                e.addEventListener("canplay", function() {
                setTimeout(function() {
                    x(k)
                }, 500);
                setTimeout(function() {
                    N();
                    p();
                    for (var e = 0; e < O.length; e++) {
                        T(O[e])
                    }
                }, 15500)
            }, true);
            e.addEventListener("ended", function() {
                N();
                h();
                go();
            }, true);
            e.innerHTML = " <p>If you are reading this, it is because your browser does not support the audio element. We recommend that you get a new browser.</p> <p>";
            document.body.appendChild(e);
            }
        }
        initAudioEle();
        var e = 30;
        var t = 30;
        var n = 350;
        var r = 350;

        var curSongIndex = parseInt(document.getElementById("audio_element_id").getAttribute("curSongIndex"));
        var i = songs[curSongIndex];

        var s = "mw-harlem_shake_me";
        var o = "im_first";
        var u = ["im_drunk", "im_baked", "im_trippin", "im_blown"];
        var a = "mw-strobe_light";

        /* harlem-shake-style.css，替换成你的位置，也可以直接使用：//s3.amazonaws.com/moovweb-marketing/playground/harlem-shake-style.css */
        var f = "//s3.amazonaws.com/moovweb-marketing/playground/harlem-shake-style.css";

        var l = "mw_added_css";
        var b = g();
        var w = y();
        var C = document.getElementsByTagName("*");
        var k = null;
        for (var L = 0; L < C.length; L++) {
            var A = C[L];
            if (v(A)) {
                if (E(A)) {
                    k = A;
                    break
                }
            }
        }
        if (A === null) {
            console.warn("Could not find a node of the right size. Please try a different page.");
            return
        }
        c();
        S();
        var O = [];
        for (var L = 0; L < C.length; L++) {
            var A = C[L];
            if (v(A)) {
                O.push(A)
            }
        }
        })()'>
        &nbsp;Hello World!
      </a>
   </span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
</div>

<!--
<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT.{{ theme.scheme }}
  </a>
</div>
-->

<div class="theme-info">Statistics&nbsp;
    <span id="busuanzi_container_site_pv" style='display:none'><span id="busuanzi_value_site_pv"><i class="fa fa-spinner fa-spin"></i></span>&nbsp;-</span>
    <span id="busuanzi_container_site_uv" style='display:none'><span id="busuanzi_value_site_uv"><i class="fa fa-spinner fa-spin"></i></span>&nbsp;-</span>
    <span id="busuanzi_container_page_pv" style='display:none'><span id="busuanzi_value_page_pv"><i class="fa fa-spinner fa-spin"></i></span></span>
</div>

<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

{% block footer %}{% endblock %}
