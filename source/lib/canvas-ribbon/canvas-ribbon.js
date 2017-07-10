/**
 * Created by zproo on 2017/4/3.
 */
! function() {
  document.addEventListener("touchstart", (e) => {
    targetA = true;
  });
  document.addEventListener("touchmove", (e) => {
    targetA = false
  })
  document.addEventListener("click", (e) => {
    targetA = true
  })
  function e() {
    if (targetA) {
      for (a.clearRect(0, 0, d, r), i = [{
        x: 0,
        y: .7 * r + u
      }, {
        x: 0,
        y: .7 * r - u
      }]; i[1].x < d + u;) t(i[0], i[1])
      targetA = false
    }
  }

  function t(e, t) {
    a.beginPath(), a.moveTo(e.x, e.y), a.lineTo(t.x, t.y);
    var o = t.x + (2 * x() - .25) * u,
      c = n(t.y);
    a.lineTo(o, c), a.closePath(), h -= m / -50, a.fillStyle = "#" + (127 * s(h) + 128 << 16 | 127 * s(h + m / 3) + 128 << 8 | 127 * s(h + m / 3 * 2) + 128).toString(16), a.fill(), i[0] = i[1], i[1] = {
      x: o,
      y: c
    }
  }

  function n(e) {
    var t = e + (2 * x() - 1.1) * u;
    return t > r || 0 > t ? n(e) : t
  }

  var o = document.createElement("canvas");
  o.style.cssText = "position:fixed;top:0;left:0;z-index:-1", document.getElementsByTagName("body")[0].appendChild(o);
  var i, c = o,
    a = c.getContext("2d"),
    l = window.devicePixelRatio || 1,
    d = window.innerWidth,
    r = window.innerHeight,
    u = 90,
    f = Math,
    h = 0,
    m = 2 * f.PI,
    s = f.cos,
    x = f.random,
    targetA = false;
  c.width = d * l, c.height = r * l, a.scale(l, l), a.globalAlpha = .6, document.onclick = e, document.ontouchend = e, setTimeout(function() {
    targetA = true;
    e();
  }, 100);
}();
