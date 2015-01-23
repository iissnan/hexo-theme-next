<!doctype html>
<html lang="zh">
<head>
  {% include './partials/head.swig' %}
</head>

<body>
  <div class="container">

    <div id="header" class="header">
      <div class="header-inner">
        {% include './partials/header.swig' %}
      </div>
    </div>

    <div id="main" class="main">
      <div class="main-inner">
        {% include './partials/content.swig' %}
      </div>
    </div>

    <div id="footer" class="footer">
      <div class="footer-inner">
        {% include './partials/footer.swig' %}
      </div>
    </div>

  </div>

  {% include './partials/scripts.swig' %}
</body>
</html>