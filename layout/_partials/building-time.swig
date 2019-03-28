<section>                        
{% if config.language == "zh-Hans" %}  {{ "建站时间 : " }} 
{% else %} {{ "Building Time : " }} 
{% endif %}
    <span id="t_d">00</span>
    {% if config.language == "zh-Hans" %}  {{ " 天 " }} 
  {% else %} {{ " d " }} 
  {% endif %}
    <span id="t_h">00</span>
    {% if config.language == "zh-Hans" %}  {{ " 时 " }} 
  {% else %} {{ " h " }} 
  {% endif %}
    <span id="t_m">00</span>
    {% if config.language == "zh-Hans" %}  {{ " 分 " }} 
  {% else %} {{ " m " }} 
  {% endif %}
    <span id="t_s">00</span>
    {% if config.language == "zh-Hans" %}  {{ " 秒 " }} 
  {% else %} {{ " s " }} 
  {% endif %}

    <script type="text/javascript">
        function getRTime() {
            var EndTime= new Date('{{ theme.footer.Building_time }}'); 
            var NowTime = new Date();
            var t = NowTime.getTime() - EndTime.getTime();
            var d=Math.floor(t/1000/60/60/24);
            var h=Math.floor(t/1000/60/60%24);
            var m=Math.floor(t/1000/60%60);
            var s=Math.floor(t/1000%60);
            document.getElementById("t_d").innerHTML = d ;
            document.getElementById("t_h").innerHTML = h ;
            document.getElementById("t_m").innerHTML = m ;
            document.getElementById("t_s").innerHTML = s ;
        }
        setInterval(getRTime,1000);
    </script>                    
</section>
