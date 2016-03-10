{% if config.search.path %}
  <script type="text/javascript">
    // Popup Window;
    var scrollTop = '';
    var newHeight = '100';
    var isfetched = false;
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

    function proceedsearch() {
      $('#local-search-input').val($('#search-input').val());
      document.getElementById('local-search-input').dispatchEvent(new Event('input'));
      $("body").append('<div class="popoverlay">').css('overflow', 'hidden');
      $('.popup').toggle();

    }
    // search function;
    var searchFunc = function(path, search_id, content_id) {
    'use strict';
    $.ajax({
        url: path,
        dataType: "xml",
        async: true,
        beforeSend: function (){
            $('.site-search-form>span').toggleClass('fa-spin');
            $('#search-input').prop('disabled', function(i, v) { return !v; });
        },
        complete: function (){
            $('.site-search-form>span').toggleClass('fa-spin');
            $('#search-input').prop('disabled', function(i, v) { return !v; });
        },
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
                if (this.value.trim().length > 1) {
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
                        matchcounts += 1;
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
                                end = 50;
                            }
                            if(end > content.length){
                                end = content.length;
                            }
                            var match_content = content.substring(start, end);
                            // highlight all keywords
                            keywords.forEach(function(keyword){
                                var regS = new RegExp(keyword, "gi");
                                match_content = match_content.replace(regS, "<b class=\"search-keyword\">"+keyword+"</b>");
                            });
                            
                            str += "<p class=\"search-result\">" + match_content +"...</p>"
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
    $(window).bind('scroll', function() {
      scrollTop = $( window ).scrollTop();
      newHeight = scrollTop + 100;
    });
    $('#search-result a').mousedown(function(e) {
        window.location.href = this.href;
      });
    $('.popup-trigger').mousedown(function(e) {
      e.stopPropagation();
      if (isfetched == false) {
        searchFunc(path, 'local-search-input', 'local-search-result');
      } else {
        proceedsearch();
      };

    });

    $('#search-input').focus(function() {
      if(jQuery(window).width() < 750) {
        $('body').animate({
          scrollTop: $('.site-search').offset().top
        }, 500);
      };
      if ($(this).val().length > 0) {
        $('#search-result').show();
      }
    });
    $('#search-input').blur(function() {
      $('#search-result').hide();
    });

    $('.popup-btn-close').click(function(e){
      $('.popup').hide();
      $(".popoverlay").remove();
      $('body').css('overflow', '');
    });
    $('.popup').click(function(e){
      e.stopPropagation();
    });
  </script>
{% endif %}