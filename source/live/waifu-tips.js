String.prototype.render = function(context) {
	var tokenReg = /(\\)?\{([^\{\}\\]+)(\\)?\}/g,
		strFlag = true,
		result = this.replace(tokenReg, function(word, slash1, token, slash2) {
			if (slash1 || slash2) {
				return word.replace("\\", "");
			}
			var variables = token.replace(/\s/g, "").split(".");
			var currentObject = context;
			var i, length, variable;
			for (i = 0, length = variables.length; i < length; ++i) {
				variable = variables[i];
				currentObject = currentObject[variable].replace(/\s/g, "").replace(/\s+/g, "");
				if (!currentObject) {
					strFlag = false;
					return "";
				}
			}
			return currentObject;
		});
	return strFlag ? result : "";
}

function initWidget(waifuPath, apiPath) {
	if (sessionStorage.getItem("waifu-display") == "none") return;
	sessionStorage.removeItem("waifu-text");
	$("body").append('<div class="waifu">\
			<div class="waifu-tips"></div>\
			<canvas id="live2d" width="300" height="300" class="live2d"></canvas>\
			<div class="waifu-tool">\
				<span class="fa fa-lg fa-home"></span>\
				<span class="fa fa-lg fa-comment"></span>\
				<span class="fa fa-lg fa-paper-plane"></span>\
				<span class="fa fa-lg fa-address-book"></span>\
				<span class="fa fa-lg fa-street-view"></span>\
				<span class="fa fa-lg fa-camera-retro"></span>\
				<span class="fa fa-lg fa-info-circle"></span>\
				<span class="fa fa-lg fa-times"></span>\
			</div>\
		</div>');
	var re = /x/,
		OriginTitile = document.title,
		titleTime,
		title = {
			focus: "o(≧∇≦o) 啊咧，又好了……",
			blur: "(●—●) 哎呦，崩溃啦！"
		};
	console.log(re);
	re.toString = function() {
		showMessage("哈哈，你打开了控制台，是想要看看我的秘密吗？", 6000, 9);
		return "";
	};
	$(document).on("visibilitychange", function() {
		if (document.hidden) {
			document.title = title.blur;
			clearTimeout(titleTime);
		} else {
			document.title = title.focus;
			titleTime = setTimeout(function() {
				document.title = OriginTitile;
				showMessage("哇，你又回来了～", 6000, 9);
			}, 1000);
		}
	});
	$(document).on("copy", function() {
		showMessage("你都复制了些什么呀，转载要记得加上出处哦", 6000, 9);
	});
	$(".waifu-tool .fa-home").click(function() {
		location.href = "/";
	});
	$(".waifu-tool .fa-comment").click(function() {
		showHitokoto();
	});
	$(".waifu-tool .fa-paper-plane").click(function() {
		var s = document.createElement("script");
		document.body.appendChild(s);
		s.src = "https://galaxymimi.com/js/asteroids.js";
	});
	$(".waifu-tool .fa-address-book").click(function() {
		loadOtherModel();
	});
	$(".waifu-tool .fa-street-view").click(function() {
		loadRandModel();
	});
	$(".waifu-tool .fa-camera-retro").click(function() {
		showMessage("照好了嘛，是不是很可爱呢？", 6000, 9);
		window.Live2D.captureName = "photo.png";
		window.Live2D.captureFrame = true;
	});
	$(".waifu-tool .fa-info-circle").click(function() {
		window.open("https://github.com/stevenjoezhang/live2d-widget");
	});
	$(".waifu-tool .fa-times").click(function() {
		sessionStorage.setItem("waifu-display", "none");
		showMessage("愿你有一天能与重要的人重逢", 2000, 11);
		setTimeout(function() {
			$(".waifu").fadeOut(4000);
		}, 1000);
	});
	(function() {
		var text,
			SiteIndexUrl = location.port ? location.protocol + "//" + location.hostname + ":" + location.port + "/" : location.protocol + "//" + location.hostname + "/"; // 自动获取主页
		//var SiteIndexUrl = "https://www.fghrsh.net/"; // 手动指定主页
		if (location.href == SiteIndexUrl) { // 如果是主页
			var now = (new Date()).getHours();
			if (now > 23 || now <= 5) {
				text = "你是夜猫子呀？这么晚还不睡觉，明天起的来嘛";
			} else if (now > 5 && now <= 7) {
				text = "早上好！一日之计在于晨，美好的一天就要开始了";
			} else if (now > 7 && now <= 11) {
				text = "上午好！工作顺利嘛，不要久坐，多起来走动走动哦！";
			} else if (now > 11 && now <= 14) {
				text = "中午了，工作了一个上午，现在是午餐时间！";
			} else if (now > 14 && now <= 17) {
				text = "午后很容易犯困呢，今天的运动目标完成了吗？";
			} else if (now > 17 && now <= 19) {
				text = "傍晚了！窗外夕阳的景色很美丽呢，最美不过夕阳红～";
			} else if (now > 19 && now <= 21) {
				text = "晚上好，今天过得怎么样？";
			} else if (now > 21 && now <= 23) {
				text = ["已经这么晚了呀，早点休息吧，晚安～", "深夜时要爱护眼睛呀"];
			} else {
				text = "好久不见，日子过得好快呢";
			}
		} else {
			if (document.referrer !== "") {
				var referrer = document.createElement("a");
				referrer.href = document.referrer;
				var domain = referrer.hostname.split(".")[1];
				if (location.hostname == referrer.hostname) {
					text = '欢迎阅读<span style="color:#0099cc;">『' + document.title.split(' - ')[0] + '』</span>';
				} else if (domain == 'baidu') {
					text = 'Hello! 来自 百度搜索 的朋友<br>你是搜索 <span style="color:#0099cc;">' + referrer.search.split('&wd=')[1].split('&')[0] + '</span> 找到的我吗？';
				} else if (domain == 'so') {
					text = 'Hello! 来自 360搜索 的朋友<br>你是搜索 <span style="color:#0099cc;">' + referrer.search.split('&q=')[1].split('&')[0] + '</span> 找到的我吗？';
				} else if (domain == 'google') {
					text = 'Hello! 来自 谷歌搜索 的朋友<br>欢迎阅读<span style="color:#0099cc;">『' + document.title.split(' - ')[0] + '』</span>';
				} else {
					text = 'Hello! 来自 <span style="color:#0099cc;">' + referrer.hostname + '</span> 的朋友';
				}
			} else {
				text = '欢迎阅读<span style="color:#0099cc;">『' + document.title.split(' - ')[0] + '』</span>';
			}
		}
		showMessage(text, 7000, 8);
	})();
	/* 检测用户活动状态，并在空闲时 定时显示一言 */
	var getActed = false,
		hitokotoTimer = null,
		messageTimer = null,
		messageArray = ["已经过了这么久了呀，日子过得好快呢", "使用Chrome可以获得最佳浏览体验哦", "嗨～快来逗我玩吧！", "拿小拳拳锤你胸口", "她性格之奇特，绝非偶然"],
		apiURL = "";
	if ($(".fa-share-alt").is(":hidden")) messageArray.push("记得把小家加入Adblock白名单哦");
	$(document).mousemove(function() {
		getActed = true;
	}).keydown(function() {
		getActed = true;
	});
	//hitokotoTimer = setInterval(showHitokoto, 30000);
	setInterval(function() {
		if (!getActed) {
			if (!hitokotoTimer) {
				hitokotoTimer = setInterval(showHitokoto, 25000);
			}
		} else {
			getActed = false;
			clearInterval(hitokotoTimer);
			hitokotoTimer = null;
		}
	}, 1000);

	function showHitokoto() {
		/* 增加 hitokoto.cn API */
		if (Math.random() < 0.6 && messageArray.length > 0) {
			showMessage(messageArray[Math.floor(Math.random() * messageArray.length)], 6000, 9);
		} else $.getJSON("https://v1.hitokoto.cn", function(result) {
			var text = '这句一言来自 <span style="color:#0099cc;">『{source}』</span>，是 <span style="color:#0099cc;">{creator}</span> 在 hitokoto.cn 投稿的。';
			text = text.render({
				source: result.from,
				creator: result.creator
			});
			showMessage(result.hitokoto, 6000, 9);
			setTimeout(function() {
				showMessage(text, 4000, 9);
			}, 6000);
		});
	}

	function showMessage(text, timeout, priority) {
		//console.log(text, timeout, priority);
		if (!text) return;
		if (!sessionStorage.getItem("waifu-text") || sessionStorage.getItem("waifu-text") <= priority) {
			if (messageTimer) {
				clearTimeout(messageTimer);
				messageTimer = null;
			}
			if (Array.isArray(text)) text = text[Math.floor(Math.random() * text.length)];
			//console.log(text);
			sessionStorage.setItem("waifu-text", priority);
			$(".waifu-tips").stop().html(text).fadeTo(200, 1);
			messageTimer = setTimeout(function() {
				sessionStorage.removeItem("waifu-text");
				$(".waifu-tips").fadeTo(1000, 0);
			}, timeout);
		}
	}

	function initModel() {
		if (waifuPath === undefined) waifuPath = "";
		if (apiPath === undefined) apiPath = "";
		apiURL = apiPath;
		var modelId = localStorage.getItem("modelId"),
			modelTexturesId = localStorage.getItem("modelTexturesId");
		if (modelId == null) {
			/* 首次访问加载 指定模型 的 指定材质 */
			var modelId = 1; // 模型 ID
			var modelTexturesId = 53 // 材质 ID
		}
		loadModel(modelId, modelTexturesId);
		$.ajax({
			cache: true,
			url: waifuPath + "waifu-tips.json",
			dataType: "json",
			success: function(result) {
				$.each(result.mouseover, function(index, tips) {
					$(document).on("mouseover", tips.selector, function() {
						var text = tips.text;
						if (Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length)];
						text = text.render({
							text: $(this).text()
						});
						showMessage(text, 4000, 8);
					});
				});
				$.each(result.click, function(index, tips) {
					$(document).on("click", tips.selector, function() {
						var text = tips.text;
						if (Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length)];
						text = text.render({
							text: $(this).text()
						});
						showMessage(text, 4000, 8);
					});
				});
				$.each(result.seasons, function(index, tips) {
					var now = new Date(),
						after = tips.date.split("-")[0],
						before = tips.date.split("-")[1] || after;
					if ((after.split("/")[0] <= now.getMonth() + 1 && now.getMonth() + 1 <= before.split("/")[0]) && (after.split("/")[1] <= now.getDate() && now.getDate() <= before.split("/")[1])) {
						var text = tips.text;
						//if (Array.isArray(tips.text)) text = tips.text[Math.floor(Math.random() * tips.text.length)];
						text = text.render({
							year: now.getFullYear()
						});
						//showMessage(text, 7000, true);
						messageArray.push(text);
					}
				});
			}
		});
	}

	function loadModel(modelId, modelTexturesId) {
		localStorage.setItem("modelId", modelId);
		if (modelTexturesId === undefined) modelTexturesId = 0;
		localStorage.setItem("modelTexturesId", modelTexturesId);
		loadlive2d("live2d", apiURL + "/get/?id=" + modelId + "-" + modelTexturesId, console.log("live2d", "模型 " + modelId + "-" + modelTexturesId + " 加载完成"));
	}

	function loadRandModel() {
		var modelId = localStorage.getItem("modelId"),
			modelTexturesId = localStorage.getItem("modelTexturesId");
			// 可选 "rand"(随机), "switch"(顺序)
		$.ajax({
			cache: false,
			url: apiURL + "/rand_textures/?id=" + modelId + "-" + modelTexturesId,
			dataType: "json",
			success: function(result) {
				if (result.textures["id"] == 1 && (modelTexturesId == 1 || modelTexturesId == 0)) {
					showMessage("我还没有其他衣服呢", 4000, 10);
				} else {
					showMessage("我的新衣服好看嘛", 4000, 10);
				}
				loadModel(modelId, result.textures["id"]);
			}
		});
	}

	function loadOtherModel() {
		var modelId = localStorage.getItem("modelId");
		$.ajax({
			cache: false,
			url: apiURL + "/switch/?id=" + modelId,
			dataType: "json",
			success: function(result) {
				loadModel(result.model["id"]);
				showMessage(result.model["message"], 4000, 10);
			}
		});
	}
	initModel();
}
