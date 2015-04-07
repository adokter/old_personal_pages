---
layout: archive
permalink: /research/
title: "Research"
date: 2015-03-04T10:26:25+02:00
modified: 2015-03-04T10:26:25+02:00
tags: [posttag1,posttag2]
image:
  feature:
  teaser:
  thumb:
---

### Projects archive

<div class="wrap">
<div class="tiles">
{% for post in site.categories.projects %}
        {% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
</div>
