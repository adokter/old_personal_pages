---
layout: default
permalink: /
title: "Latest Posts"
image:
 feature: 
---
 <div class="page-lead" style="background-image:url://adokter.github.io/images/Brent-RONK-small.jpg">
      <div class="wrap page-lead-content">
        <h1>Skinny Bones</h1>
        <h2>Jump start your Jekyll site with something thin and light.</h2>
        <a href="//mmistakes.github.io/skinny-bones-jekyll/getting-started/" class="btn-inverse">Start Using Skinny Bones</a> &nbsp; or &nbsp; <a href="https://github.com/mmistakes/skinny-bones-jekyll" class="btn-inverse">View on GitHub</a>
      </div><!-- /.page-lead-content -->
</div><!-- /.page-lead -->

   
<div class="tiles">
{% for post in site.posts %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->

