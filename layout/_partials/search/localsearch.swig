<form class="site-search-form" >
  <span class="fa fa-search"></span>
  <input type="text" id="search-input">
  <div id="search-result"><ul class="search-result-list"><li><a href="//www.baidu.com/s?wd=XXX%20site%3A{{config.url}}" class="search-result">百度搜索 <i class="search-keyword">XXX</i></a></li><li><a href="//www.google.com/search?q=XXX%20site%3A{{config.url}}" class="search-result">谷歌搜索 <i class="search-keyword">XXX</i></a></li><li><a href="#" class="popup-trigger search-result">本地搜索</a></li></ul>
  </div>
</form>
 <div class="popup">
  <span class="fa fa-search"></span>
  <input type="text" id="local-search-input">
  <div id="local-search-result"></div>
  <span class="popup-btn-close">close</span>
 </div>