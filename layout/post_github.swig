{% extends '_layout_github.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %} {{ page.title }} | {{ config.title }} {% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    {% set real_content =  "<p><a href='https://github.com/623637646/hexo-blog/blob/master/source/_posts/" + page.title + ".md' target='_blank' rel='external'>在Github上修改这篇文章</a></p>";%}
    {% for data_item in page.data_github %}
      {# 分类 #}
      {% set real_content +=  "<h2 id='" + data_item.keywords + "' style='text-align: center;'>" + data_item.keywords + "</h2>";%}
      {% set is_first_in_data_github = loop.first;%}
      {% for project in data_item.projects %}
        {# 标题 #}
        {% set real_content +=  "<h3 id='" + project.user + '/' + project.repo + "'>";%}
        {% set real_content +=  "<a href='//github.com/" + project.user + "/" + project.repo + "' target='_blank'>" + project.repo + "</a>";%}
        {% set real_content +=  "<iframe data-src='https://ghbtns.com/github-btn.html?user=" + project.user + "&repo=" + project.repo + "&type=star&count=true' frameborder='0' scrolling='0' width='120px' height='20px' class='lazyload'></iframe>";%}
        {% set real_content +=  "</h3>";%}
        {# 描述 #}
        {% set real_content +=  "<p>" + project.description + "</p>";%}
        {# 教程 #}
        {% set real_content +=  "<ul>";%}
        {% for wiki in project.wiki %}
          {% set real_content +=  "<li><p><a href='" + wiki.link + "' target='_blank' rel='external'>" + wiki.title + "</a></p></li>";%}
        {% endfor %}
        {% set real_content +=  "</ul>";%}
        {# 图片 #}
        {% set real_content +=  "<div>";%}
        {% for img in project.imgs %}
          {% set real_content +=  "<div style='height:150px;width:100%'>";%}
          {% set real_content +=  "<img data-src='" + img  +"' class='lazyload' style='height:100%'/>";%}
          {% set real_content +=  "</div>";%}
        {% endfor %}
        {% set real_content +=  "</div>";%}
        {# more #}
        {% if loop.first && is_first_in_data_github%}
          {% set real_content +=  "<!-- more -->";%}
        {% endif %}
        {# 底部分割线 #}
        {% set real_content +=  "<div class='post-eof'></div>";%}
      {% endfor %}
    {% endfor %}
    {% set page.content = real_content%}
    
    {{ post_template.render(page) }}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}


{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
