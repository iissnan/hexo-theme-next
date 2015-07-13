{% if page.prev or page.next %}
  <nav class="pagination">
    {{ paginator({prev_text: '&laquo;', next_text: '&raquo;', mid_size: 1}) }}
  </nav>
{% endif %}