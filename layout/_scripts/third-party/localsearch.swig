{% if config.search.path %}
  <script type="text/javascript">
    // Popup Window;
    var scrollTop = '';
    var newHeight = '100';

    // Search DB path;
    var search_path = "{{ config.search.path }}";
    if (search_path.length == 0) {
       search_path = "search.xml";
    }
    var path = "{{ config.root }}" + search_path;

    // monitor main search box;
    $('#search-input').on('input', function() {
    if ($(this).val().length <= 0) {
      $('#search-result').hide();
      return;
    }
    $('i.search-keyword').text($(this).val());
    $('a.search-result[href!="#"]').each(function(){
      this.href = this.href.replace(/\=(.*?)(?=%20site)/,'='+$('#search-input').val())
    });
    $('#search-result').show();
    });

    // search function;
    var searchFunc = function(path, search_id, content_id) {
    'use strict';
    searchFunc = function(){};
    $.ajax({
        url: path,
        dataType: "xml",
        async: false,
        success: function( xmlResponse ) {
            // get the contents from search data
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
                var str='<ul class=\"search-result-list\">';                
                var keywords = this.value.trim().toLowerCase().split(/[\s\-]+/);
                $resultContent.innerHTML = "";
                if (this.value.trim().length <= 0) {
                    return;
                }
                // perform local searching
                datas.forEach(function(data) {
                    var isMatch = true;
                    var content_index = [];
                    var data_title = data.title.trim().toLowerCase();
                    var data_content = data.content.trim().replace(/<[^>]+>/g,"").toLowerCase();
                    var data_url = data.url;
                    var index_title = -1;
                    var index_content = -1;
                    var first_occur = -1;
                    // only match artiles with not empty titles and contents
                    if(data_title != '' && data_content != '') {
                        keywords.forEach(function(keyword, i) {
                            index_title = data_title.indexOf(keyword);
                            index_content = data_content.indexOf(keyword);
                            if( index_title < 0 && index_content < 0 ){
                                isMatch = false;
                            } else {
                                if (index_content < 0) {
                                    index_content = 0;
                                }
                                if (i == 0) {
                                    first_occur = index_content;
                                }
                            }
                        });
                    }
                    // show search results
                    if (isMatch) {
                        str += "<li><a href='"+ data_url +"' class='search-result-title'>"+ data_title +"</a>";
                        var content = data.content.trim().replace(/<[^>]+>/g,"");
                        if (first_occur >= 0) {
                            // cut out 100 characters
                            var start = first_occur - 20;
                            var end = first_occur + 80;
                            if(start < 0){
                                start = 0;
                            }
                            if(start == 0){
                                end = 100;
                            }
                            if(end > content.length){
                                end = content.length;
                            }
                            var match_content = content.substr(start, end); 
                            // highlight all keywords
                            keywords.forEach(function(keyword){
                                var regS = new RegExp(keyword, "gi");
                                match_content = match_content.replace(regS, "<b class=\"search-keyword\">"+keyword+"</b>");
                            });
                            
                            str += "<p class=\"search-result\">" + match_content +"...</p>"
                        }
                        str += "</li>";
                    }
                });
                str += "</ul>";
                $resultContent.innerHTML = str;
            });
        }
    });}

    // handle and trigger popup window;
    $(window).bind('scroll', function() {
      scrollTop = $( window ).scrollTop();
      newHeight = scrollTop + 100;
    });
    $('#search-result a').mousedown(function(e) {
        window.location.href = this.href;
      });
    $('.popup-trigger').mousedown(function(e) {
      searchFunc(path, 'local-search-input', 'local-search-result');
      $('#local-search-input').val($('#search-input').val());
      document.getElementById('local-search-input').dispatchEvent(new Event('input'));
      e.stopPropagation();
      if(jQuery(window).width() < 750) {
        $('.site-search-form').after( $( ".popup" ) );
        $('.popup').show().addClass('popup-mobile').css('top', 0);
        $('html, body').animate({
          scrollTop: $('.popup').offset().top
        }, 500);
      } else {
        $('.popup').removeClass('popup-mobile').css('top', newHeight).toggle();
      };
    });

    $('#search-input').focus(function() {
    if ($(this).val().length > 0) {
      $('#search-result').show();
      }
    });
    $('#search-input').blur(function() {
      $('#search-result').hide();
    });

    $('html').click(function() {
      $('.popup').hide();
    });
    $('.popup-btn-close').click(function(e){
      $('.popup').hide();
    });
    $('.popup').click(function(e){
      e.stopPropagation();
    });
  </script>
{% endif %}