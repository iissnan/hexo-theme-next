{% if theme.donate %}
  <div align="center">{{ theme.donate_message }}</div>
  <div width="100%" align="center" align="center">
  <a href="http://www.dashangcloud.com/sh/878fe4" title="打赏小编">
    <button style="width:110px; height:44px; border:#FFFFFF 1px solid; background:#EA6F5A; color:#FFFFFF;font-size: 16px;border-radius: 6px">打赏作者</button>
  </a>

  <div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;display:none">
  //   <div>{{ theme.reward_comment }}</div>
  //   <button id="rewardButton" disable="enable" onclick="var qr = document.getElementById('QR'); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
  //     <span>赏</span>
  //   </button>
  //   <div id="QR" style="display: none;">
  //     {% if theme.wechatpay %}
  //       <div id="wechat" style="display: inline-block">
  //         <img id="wechat_qr" src="{{ theme.wechatpay }}" alt="{{ theme.author }} WeChat Pay"/>
  //         <p>微信打赏</p>
  //       </div>
  //     {% endif %}
  //     {% if theme.alipay %}
  //       <div id="alipay" style="display: inline-block">
  //         <img id="alipay_qr" src="{{ theme.alipay }}" alt="{{ theme.author }} Alipay"/>
  //         <p>支付宝打赏</p>
  //       </div>
  //     {% endif %}
  //   </div>
  </div>
{% endif %}
