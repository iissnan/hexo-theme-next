<div class="welcome">欢迎来到我的读书空间！欢迎留言！</div>
<div class="head">
  <p id="error">阅<span>读</span></p>
  <p id="code">R<span>E</span>A<span>D</span>IN<span>G</span></p>
</div>
<ul id="tab-head">
  <li class="tab-block">已读</li>
  <li class="tab-block">正读</li>
  <li class="tab-block">想读</li>
  <li class="slider"></li>
</ul>
<div class="tab-content">
  <div id="tab-content-1">
    {% for card in theme.study.readed %}
      <div  class="card f" style="background: url({{ card.url }}) no-repeat"></div>
    {% endfor %}
  </div>
  <div id="tab-content-2">
    {% for card in theme.study.reading %}
      <div  class="card f" style="background: url({{ card.url }})  no-repeat"></div>
    {% endfor %}
  </div>
  <div id="tab-content-3">
    {% for card in theme.study.want %}
      <div  class="card f" style="background: url({{ card.url }})  no-repeat"></div>
    {% endfor %}
  </div>
</div>

