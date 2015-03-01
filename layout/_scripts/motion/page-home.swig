{% if is_home() %}
  <script type="text/javascript" id="motion.page.home">
    $(document).ready(function () {
      $.Velocity.RunSequence([
        { e: $('.brand'), p: { opacity: 1 }, o: { duration: 100 } },
        { e: $('.logo'), p: { opacity: 1, top: 0 }, o: { duration: 50} },
        { e: $('.site-title'), p: { opacity: 1, top: 0 }, o: { duration: 200, sequenceQueue: false } }
      ]);
      $('.menu-item').velocity('transition.slideDownIn', {display: null});
    });
  </script>
{% endif %}
