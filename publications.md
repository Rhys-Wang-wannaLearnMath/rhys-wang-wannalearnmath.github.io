---
layout: archive
title: "Publications 📚"
permalink: /publications/
author_profile: true
---

{% include base_path %}

{% assign sorted_publications = site.publications | sort: 'date' | reverse %}
{% assign conferences = sorted_publications | where: 'category', 'conferences' %}
{% assign journals = sorted_publications | where: 'category', 'manuscripts' %}

{% if conferences.size > 0 and journals.size > 0 %}
<div class="section-divider"></div>
{% endif %}
---
{% if conferences.size > 0 %}
## Conference(*Equal contribution, †Corresponding author)

{% assign conferences_by_year = conferences | group_by_exp: 'post', 'post.date | date: "%Y"' %}
{% for year_group in conferences_by_year %}
<div class="year-title">{{ year_group.name }}</div>

{% for pub in year_group.items %}
<div class="paper-title">{{ pub.title }}</div>
<div class="paper-info">
<ul>
  <li>{{ pub.venue }}</li>
  <li><strong>Authors:</strong> {{ pub.citation }}</li>
  {% if pub.paperurl %}
  <li><a href="{{ pub.paperurl }}">Access to our work.</a></li>
  {% endif %}
</ul>
</div>


{% endfor %}
{% endfor %}
{% endif %}

{% if conferences.size > 0 and journals.size > 0 %}
<div class="section-divider"></div>
{% endif %}

{% if journals.size > 0 %}
## Journal(*Equal contribution, †Corresponding author)

{% assign journals_by_year = journals | group_by_exp: 'post', 'post.date | date: "%Y"' %}
{% for year_group in journals_by_year %}
<div class="year-title">{{ year_group.name }}</div>

{% for pub in year_group.items %}
<div class="paper-title">{{ pub.title }}</div>
<div class="paper-info">
<ul>
  <li>{{ pub.venue }}</li>
  <li><strong>Authors:</strong> {{ pub.citation }}</li>
  {% if pub.paperurl %}
  <li><a href="{{ pub.paperurl }}">Access to our work.</a></li>
  {% endif %}
</ul>
</div>


{% endfor %}
{% endfor %}
{% endif %}

<style>
/* 年份标题样式 - 使用 Arial 字体 */
.year-title {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 1.2em;
  font-weight: bold;
  color: #2c3e50;
  margin-top: 1.2em;
  margin-bottom: 0.2em;
}

/* 文章标题样式 - 使用 Georgia 字体 */
.paper-title {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 1.1em;
  font-weight: 750;
  color: #34495e;
}

/* 论文信息样式 */
.paper-info {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  margin-bottom: 0.8em;
  line-height: 1.4;
}

/* 减少段落间距 */
p {
  margin-bottom: 0.5em;
}

/* Conference和Journal之间的分界线 */
.section-divider {
  border-top: 1px solid #e8e8e8;
}

/* Conference和Journal主标题样式 */
h2 {
  font-family: 'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif !important;
  font-size: 1.4em !important;
  font-weight: bold !important;
  color: #2c3e50 !important;
  margin-top: 0.4em;
  margin-bottom: 0.1em;
}
</style>
