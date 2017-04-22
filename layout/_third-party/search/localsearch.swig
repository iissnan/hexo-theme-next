{% if theme.local_search.enable %}
  <script type="text/javascript">
    // Popup Window;
    var isfetched = false;
    // Search DB path;
    var search_path = "{{ config.search.path }}";
    if (search_path.length === 0) {
      search_path = "search.xml";
    }
    var path = "{{ config.root }}" + search_path;
    // monitor main search box;

    var onPopupClose = function (e) {
      $('.popup').hide();
      $('#local-search-input').val('');
      $('.search-result-list').remove();
      $(".local-search-pop-overlay").remove();
      $('body').css('overflow', '');
    }

    function proceedsearch() {
      $("body")
        .append('<div class="search-popup-overlay local-search-pop-overlay"></div>')
        .css('overflow', 'hidden');
      $('.search-popup-overlay').click(onPopupClose);
      $('.popup').toggle();
      $('#local-search-input').focus();
    }

    // search function;
    var searchFunc = function(path, search_id, content_id) {
      'use strict';
      $.ajax({
        url: path,
        dataType: "xml",
        async: true,
        success: function( xmlResponse ) {
          // get the contents from search data
          isfetched = true;
          $('.popup').detach().appendTo('.header-inner');
          var datas = $( "entry", xmlResponse ).map(function() {
            return {
              title: $( "title", this ).text(),
              content: $("content",this).text(),
              url: $( "url" , this).text()
            };
          }).get();
          var $input = document.getElementById(search_id);
          var $resultContent = document.getElementById(content_id);
          $input.addEventListener('input', function(){
            var keywords = this.value.trim().toLowerCase().split(/[\s\-]+/);
            var resultItems = [];
            if (this.value.trim().length > 0) {
              // perform local searching
              datas.forEach(function(data) {
                var isMatch = false;
                var hitCountInArticle = 0;
                var title = data.title.trim();
                var titleInLowerCase = title.toLowerCase();
                var content = data.content.trim().replace(/<[^>]+>/g,"");
                var contentInLowerCase = content.toLowerCase();
                var articleUrl = decodeURIComponent(data.url);
                var indexOfTitle = [];
                var indexOfContent = [];
                // only match articles with not empty titles
                if(title != '') {
                  keywords.forEach(function(keyword, i) {
                    function getIndexByWord(word, text, caseSensitive) {
                      var wordLen = word.length;
                      if (wordLen === 0) {
                        return [];
                      }
                      var startPosition = 0, position = [], index = [];
                      if (!caseSensitive) {
                        text = text.toLowerCase();
                        word = word.toLowerCase();
                      }
                      while ((position = text.indexOf(word, startPosition)) > -1) {
                        index.push({position: position, word: word});
                        startPosition = position + wordLen;
                      }
                      return index;
                    }

                    indexOfTitle = indexOfTitle.concat(getIndexByWord(keyword, titleInLowerCase, false));
                    indexOfContent = indexOfContent.concat(getIndexByWord(keyword, contentInLowerCase, false));
                  });
                  if (indexOfTitle.length > 0 || indexOfContent.length > 0) {
                    isMatch = true;
                    hitCountInArticle = indexOfTitle.length + indexOfContent.length;
                  }
                }

                // show search results

                if (isMatch) {
                  var resultItem = '';

                  function highlightKeyword(text, start, end, index) {
                    var item = index[index.length - 1];
                    var position = item.position;
                    var word = item.word;

                    var matchText = text.substring(start, end);
                    var matchResult = [];
                    var prevEnd = 0;
                    while (position + word.length <= end && index.length != 0) {

                      // highlight keyword

                      var wordBegin = position - start;
                      var wordEnd = position - start + word.length;
                      matchResult.push(matchText.substring(prevEnd, wordBegin));
                      matchResult.push("<b class=\"search-keyword\">" + matchText.substring(wordBegin, wordEnd) + "</b>");

                      // move to next position of hit

                      index.pop();
                      prevEnd = wordEnd;
                      while (index.length != 0) {
                        item = index[index.length - 1];
                        position = item.position;
                        word = item.word;
                        if (prevEnd > position - start) {
                          index.pop();
                        } else {
                          break;
                        }
                      }
                    }
                    matchResult.push(matchText.substring(prevEnd));
                    return matchResult.join('');
                  }

                  // sort index by position of keyword

                  indexOfTitle.sort(function (itemLeft, itemRight) {
                    return itemRight.position - itemLeft.position;
                  });

                  indexOfContent.sort(function (itemLeft, itemRight) {
                    return itemRight.position - itemLeft.position;
                  });

                  // highlight title

                  if (indexOfTitle.length != 0) {
                    resultItem += "<li><a href='" + articleUrl + "' class='search-result-title'>" + highlightKeyword(title, 0, title.length, indexOfTitle) + "</a>";
                  } else {
                    resultItem += "<li><a href='" + articleUrl + "' class='search-result-title'>" + title + "</a>";
                  }

                  // highlight content

                  var resultUpperBound = parseInt({{ theme.local_search.top_n_per_article }});
                  var withoutUpperBound = false;
                  if (resultUpperBound === -1) {
                    withoutUpperBound = true;
                  }
                  var currentResultNum = 0;
                  while (indexOfContent.length != 0 && (withoutUpperBound || (currentResultNum < resultUpperBound))) {
                    var item = indexOfContent[indexOfContent.length - 1];
                    var position = item.position;
                    var word = item.word;
                    // cut out 100 characters
                    var start = position - 20;
                    var end = position + 80;
                    if(start < 0){
                      start = 0;
                    }
                    if (end < position + word.length) {
                      end = position + word.length;
                    }
                    if(end > content.length){
                      end = content.length;
                    }
                    resultItem += "<a href='" + articleUrl + "'>" +
                    "<p class=\"search-result\">" + highlightKeyword(content, start, end, indexOfContent) +
                    "...</p>" + "</a>";
                    currentResultNum++;
                  }
                  resultItem += "</li>";
                  resultItems.push({item: resultItem, hitCount: hitCountInArticle, id: resultItems.length});
                }
              })
            };
            if (keywords.length === 1 && keywords[0] === "") {
              $resultContent.innerHTML = '<div id="no-result"><i class="fa fa-search fa-5x" /></div>'
            } else if (resultItems.length === 0) {
              $resultContent.innerHTML = '<div id="no-result"><i class="fa fa-frown-o fa-5x" /></div>'
            } else {
              resultItems.sort(function (resultLeft, resultRight) {
                if (resultLeft.hitCount != resultRight.hitCount) {
                  return resultRight.hitCount - resultLeft.hitCount;
                } else {
                  return resultLeft.id - resultRight.id;
                }
              });
              var searchResultList = '<ul class=\"search-result-list\">';
              resultItems.forEach(function (result, i) {
                searchResultList += result.item;
              })
              searchResultList += "</ul>";
              $resultContent.innerHTML = searchResultList;
            }
          });
          proceedsearch();
        }
      });}

    // handle and trigger popup window;
    $('.popup-trigger').click(function(e) {
      e.stopPropagation();
      if (isfetched === false) {
        searchFunc(path, 'local-search-input', 'local-search-result');
      } else {
        proceedsearch();
      };
    });

    $('.popup-btn-close').click(onPopupClose);
    $('.popup').click(function(e){
      e.stopPropagation();
    });
  </script>
{% endif %}
