{% if theme.local_search.enable %}
  <script type="text/javascript">
    // Popup Window;
    var isfetched = false;
    // Search DB path;
    var search_path = "{{ config.search.path }}";
    if (search_path.length == 0) {
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
            var matchcounts = 0;
            var str='<ul class=\"search-result-list\">';
            var keywords = this.value.trim().toLowerCase().split(/[\s\-]+/);
            $resultContent.innerHTML = "";
            if (this.value.trim().length > 0) {
              // perform local searching
              datas.forEach(function(data) {
                var isMatch = false;
                var content_index = [];
                var data_title = data.title.trim().toLowerCase();
                var data_content = data.content.trim().replace(/<[^>]+>/g,"").toLowerCase();
                var data_url = decodeURIComponent(data.url);
                var indices_title = [];
                var indices_content = [];
                // only match artiles with not empty titles and contents
                if(data_title != '') {
                  keywords.forEach(function(keyword, i) {
                    function getIndicesWithWord(word, str, caseSensitive) {
                      var wordLen = word.length;
                      if (wordLen == 0) {
                        return [];
                      }
                      var startIndex = 0, index, indices = [];
                      if (!caseSensitive) {
                        str = str.toLowerCase();
                        word = word.toLowerCase();
                      }
                      while ((index = str.indexOf(word, startIndex)) > -1) {
                        indices.push([index, word]);
                        startIndex = index + wordLen;
                      }
                      return indices;
                    }

                    indices_title = indices_title.concat(getIndicesWithWord(keyword, data_title, false));
                    indices_content = indices_content.concat(getIndicesWithWord(keyword, data_content, false));
                  });
                  if( indices_title.length > 0 || indices_content.length > 0 ){
                    isMatch = true;
                  }
                }
                // show search results
                if (isMatch) {
                  matchcounts += 1;

                  function highlightKeyword(text, start, end, indices) {
                    var indexWithWord = indices[indices.length - 1];
                    var index = indexWithWord[0];
                    var word = indexWithWord[1];

                    var match_text = text.substring(start, end);
                    var match_result = [];
                    var prevEnd = 0;
                    while (index + word.length <= end && indices.length != 0) {
                      // highlight keyword
                      var wordBegin = index - start;
                      var wordEnd = index - start + word.length;
                      match_result.push(match_text.substring(prevEnd, wordBegin));
                      match_result.push("<b class=\"search-keyword\">" + match_text.substring(wordBegin, wordEnd) + "</b>");

                      // move to next keyword
                      indices.pop();
                      prevEnd = wordEnd;
                      while (indices.length != 0) {
                        indexWithWord = indices[indices.length - 1];
                        index = indexWithWord[0];
                        word = indexWithWord[1];
                        if (prevEnd > index - start) {
                          indices.pop();
                        } else {
                          break;
                        }
                      }
                    }
                    match_result.push(match_text.substring(prevEnd));
                    return match_result.join('');
                  }

                  if (indices_title.length != 0) {
                    str += "<li><a href='" + data_url + "' class='search-result-title'>" + highlightKeyword(data_title, 0, data_title.length, indices_title) + "</a>";
                  } else {
                    str += "<li><a href='" + data_url + "' class='search-result-title'>" + data_title + "</a>";
                  }
                  var content = data.content.trim().replace(/<[^>]+>/g,"");
                  indices_content.sort(function (a, b) {
                    return b[0] - a[0];
                  });
                  var resultUpperBound = parseInt({{ theme.local_search.top_n_per_title }});
                  var withoutUpperBound = false;
                  if (resultUpperBound == -1) {
                    withoutUpperBound = true;
                  }
                  var currentResultNum = 0;
                  while (indices_content.length != 0 && (withoutUpperBound || (currentResultNum < resultUpperBound))) {
                    var indexWithWord = indices_content[indices_content.length - 1];
                    var index = indexWithWord[0];
                    var word = indexWithWord[1];
                    // cut out 100 characters
                    var start = index - 20;
                    var end = index + 80;
                    if(start < 0){
                      start = 0;
                    }
                    if (end < index + word.length) {
                      end = index + word.length;
                    }
                    if(end > content.length){
                      end = content.length;
                    }
                    str += "<a href='" + data_url + "'>" +
                    "<p class=\"search-result\">" + highlightKeyword(content, start, end, indices_content) +
                    "...</p>" + "</a>";
                    currentResultNum++;
                  }
                  str += "</li>";
                }
              })};
            str += "</ul>";
            if (matchcounts == 0) { str = '<div id="no-result"><i class="fa fa-frown-o fa-5x" /></div>' }
            if (keywords == "") { str = '<div id="no-result"><i class="fa fa-search fa-5x" /></div>' }
            $resultContent.innerHTML = str;
          });
          proceedsearch();
        }
      });}

    // handle and trigger popup window;
    $('.popup-trigger').click(function(e) {
      e.stopPropagation();
      if (isfetched == false) {
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
