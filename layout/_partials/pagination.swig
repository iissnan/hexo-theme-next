{% if page.prev or page.next %}
  <div class="pagination">
    {{ paginator({prev_text: '&laquo;', next_text: '&raquo;', mid_size: 1}) }}
  </div>
{% endif %}