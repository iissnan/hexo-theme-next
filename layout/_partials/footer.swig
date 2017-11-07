<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.footer.icon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

  {% if theme.post_wordcount.totalcount %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.post_wordcount.item_text %}
      <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>
    {% endif %}
    <span title="{{ __('post.totalcount') }}">{#
    #}{{ totalcount(site, '0,0.0a') }}{#
  #}</span>
  {% endif %}
</div>


<section>                        
{% if config.language == "zh-Hans" %}  {{ "建立时间 : " }} 
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


{% if theme.footer.powered %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}{#
#}</div>
{% endif %}

{% if theme.footer.powered and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} &mdash; {#
  #}<a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">{#
    #}NexT.{{ theme.scheme }}{#
  #}</a>{% if theme.footer.theme.version %} v{{ theme.version }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}
