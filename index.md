---
layout: landing
permalink: /
---

### Recent Projects

<div class="wrap">
<div class="tiles">
{% for post in site.tags.startpage limit 4 %}
        {% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
</div>
