/**
 * Created by zproo on 2017/4/8.
 */
!function () {
  document.addEventListener('touchmove', function (e) {
      e.preventDefault()
  });

  function getAttr(script, attr, default_val) {
      return Number(script.getAttribute(attr)) || default_val;
  }

  // 获取自定义配置
  var ribbon = document.getElementById('ribbon');  // 当前加载的script
  config = {
      zIndex: getAttr(ribbon, "zIndex", -1), // z-index
      alpha: getAttr(ribbon, "alpha", 0.6), // alpha
      ribbon_width: getAttr(ribbon, "size", 90), // size
  };

  var canvas = document.createElement("canvas");
  canvas.style.cssText = "position:fixed;top:0;left:0;z-index:"+config.zIndex;
  document.getElementsByTagName("body")[0].appendChild(canvas);

  var canvasRibbon = canvas,
      ctx = canvasRibbon.getContext('2d'),    // 获取canvas 2d上下文
      dpr = window.devicePixelRatio || 1, // the size of one CSS pixel to the size of one physical pixel.
      width = window.innerWidth,     // 返回窗口的文档显示区的宽高
      height = window.innerHeight,
      RIBBON_WIDTH = config.ribbon_width,
      path,
      math = Math,
      r = 0,
      PI_2 = math.PI * 2,    // 圆周率*2
      cos = math.cos,   // cos函数返回一个数值的余弦值（-1~1）
      random = math.random;   // 返回0-1随机数

  canvasRibbon.width = width * dpr;     // 返回实际宽高
  canvasRibbon.height = height * dpr;
  ctx.scale(dpr, dpr);    // 水平、竖直方向缩放
  ctx.globalAlpha = config.alpha;  // 图形透明度

  function init() {
      ctx.clearRect(0, 0, width, height);     // 擦除之前绘制内容
      path = [{x: 0, y: height * 0.7 + RIBBON_WIDTH}, {x: 0, y: height * 0.7 - RIBBON_WIDTH}];
      // 路径没有填满屏幕宽度时，绘制路径
      while (path[1].x < width + RIBBON_WIDTH) {
          draw(path[0], path[1])
      }
  }

  function draw(start, end) {
      ctx.beginPath();    // 创建一个新的路径
      ctx.moveTo(start.x, start.y);   // path起点
      ctx.lineTo(end.x, end.y);   // path终点
      var nextX = end.x + (random() * 2 - 0.25) * RIBBON_WIDTH,
          nextY = geneY(end.y);
      ctx.lineTo(nextX, nextY);
      ctx.closePath();

      r -= PI_2 / -50;
      // 随机生成并设置canvas路径16进制颜色
      ctx.fillStyle = '#' + (cos(r) * 127 + 128 << 16 | cos(r + PI_2 / 3) * 127 + 128 << 8 | cos(r + PI_2 / 3 * 2) * 127 + 128).toString(16);
      ctx.fill();     // 根据当前样式填充路径
      path[0] = path[1];    // 起点更新为当前终点
      path[1] = {x: nextX, y: nextY}     // 更新终点
  }

  function geneY(y) {
      var temp = y + (random() * 2 - 1.1) * RIBBON_WIDTH;
      return (temp > height || temp < 0) ? geneY(y) : temp;
  }

  document.onclick = init;
  document.ontouchstart = init;
  init();
}();
