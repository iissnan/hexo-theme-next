{# Custom Script #}
{% if page.js_blast %}
  <script type="text/javascript" src="{{ url_for(theme.vendors) }}/blast-text/jquery.blast.min.js"></script>
  <script type="text/javascript">
    var $my = $("#motto").blast({
        delimiter: "character"
    });
    $my
        .css({"opacity": 0,"visibility": "visible"})
        .velocity("transition.fadeIn", {
            duration: 2250,
            stagger: 150,
            delay: 400,
        });
    hl(0);
    hl(8);
  
    function hl(num) {
        $my.eq(num).velocity({
            colorRed: 255
        }, 700).velocity("reverse", {
            delay: 5000
        });
    };
    $my.eq(21).velocity({
        colorRed: 255
    }, 700).velocity("reverse", {
        delay: 4000,
        complete: function() {
            $("#motto").blast(false);
            $("#motto").css("visibility", "visible");
        }
    });
  </script>
{% endif %}