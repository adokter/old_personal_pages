---
layout: landing
permalink: /
---

<img class="page-lead-introimg" src="/images/AdriaanBrent201505.jpg">

#### Research Interests
I’m an ecologist with a background in physics, with an interest in animal movement and foraging ecology. 
My research bridges the disciplines of physics, meteorology, computer science and ecology, addressing questions on the effects of global change on the distribution and seasonal migration of birds.

At [Cornell Lab of ornithology](http://www.birds.cornell.edu) I'm currently studying the migration corridors of small songbirds at the scale of a full continent, a perspective that is still largely missing, but that has come into reach through the use of meteorological weather radar networks in animal migration studies.

At the [Netherlands Institute of Ecology](http://nioo.knaw.nl) I recently studied the migration and habitat requirements of Brent Geese, a small goose species that breeds in the high arctic, which in winter is highly dependent on natural eelgrass habitats, one of the most endangered ecosystems in Western Europe. 

In the [European Network for Radar surveillance of Animal Movement (ENRAM)](http://www.enram.eu) I lead the algorithm development working group, in close collaboration with the [computational geo-ecology group](http://ibed.uva.nl/research/research-groups/content/computational-geo-ecology/research/research.html) at the University of Amsterdam. 

#### Recent Projects

<div class="wrap">
<div class="tiles">
{% for post in site.tags.startpage limit 4 %}
        {% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
</div>
