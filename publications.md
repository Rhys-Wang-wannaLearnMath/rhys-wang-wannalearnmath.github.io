---
layout: archive
title: "Publications 📚"
permalink: /publications/
author_profile: true
---

{% include base_path %}

{% assign sorted_publications = site.publications | sort: 'date' | reverse %}
{% assign all_years = sorted_publications | group_by_exp: 'post', 'post.date | date: "%Y"' %}

<div class="pub-container">

<div class="pub-main">

{% for year_group in all_years %}
<div class="pub-year-section" id="year-{{ year_group.name }}">
<h2 class="pub-year-heading">{{ year_group.name }}</h2>

{% for pub in year_group.items %}
<div class="pub-card">
  <div class="pub-card-title">{{ pub.title }}</div>
  <div class="pub-card-authors">{{ pub.citation }}</div>
  <div class="pub-card-venue">
    <div class="pub-venue-line">
      {% if pub.category == 'conferences' %}
      <span class="pub-tag pub-tag-conf">{{ pub.venue_short }}</span><span class="pub-venue-text"> {{ pub.venue }}</span>
      {% elsif pub.category == 'manuscripts' %}
      <span class="pub-tag pub-tag-jour">{{ pub.venue_short }}</span><span class="pub-venue-text"> {{ pub.venue }}</span>
      {% else %}
      <span class="pub-venue-text">{{ pub.venue }}</span>
      {% endif %}
    </div>
    {% if pub.venue1 and pub.venue1 != "" %}
    <div class="pub-venue-line">
      {% if pub.category1 == 'conferences' %}
      <span class="pub-tag pub-tag-conf">{{ pub.venue_short1 }}</span><span class="pub-venue-text"> {{ pub.venue1 }}</span>
      {% elsif pub.category1 == 'manuscripts' %}
      <span class="pub-tag pub-tag-jour">{{ pub.venue_short1 }}</span><span class="pub-venue-text"> {{ pub.venue1 }}</span>
      {% else %}
      <span class="pub-venue-text">{{ pub.venue1 }}</span>
      {% endif %}
    </div>
    {% endif %}
  </div>
  {% if pub.excerpt and pub.excerpt != "" %}
  <div class="pub-card-abstract">{{ pub.excerpt }}</div>
  {% else %}
  <div class="pub-card-abstract pub-abstract-placeholder"></div>
  {% endif %}
  <div class="pub-card-links">
    {% if pub.paperurl and pub.paperurl != "" %}
    <a href="{{ pub.paperurl }}" class="pub-link-btn" target="_blank">📄 Paper</a>
    {% else %}
    <span class="pub-link-btn pub-link-disabled">📄 Paper</span>
    {% endif %}
    {% if pub.arxivurl and pub.arxivurl != "" %}
    <a href="{{ pub.arxivurl }}" class="pub-link-btn" target="_blank">
      <img src="{{ base_path }}/icons/arxiv.svg" class="pub-link-icon" alt="" aria-hidden="true">Preprint
    </a>
    {% else %}
    <span class="pub-link-btn pub-link-disabled">
      <img src="{{ base_path }}/icons/arxiv.svg" class="pub-link-icon" alt="" aria-hidden="true">Preprint
    </span>
    {% endif %}
    {% if pub.projecturl and pub.projecturl != "" %}
    <a href="{{ pub.projecturl }}" class="pub-link-btn" target="_blank">
      <img src="{{ base_path }}/icons/github.svg" class="pub-link-icon" alt="" aria-hidden="true">Project
    </a>
    {% else %}
    <span class="pub-link-btn pub-link-disabled">
      <img src="{{ base_path }}/icons/github.svg" class="pub-link-icon" alt="" aria-hidden="true">Project
    </span>
    {% endif %}
    {% if pub.doiurl and pub.doiurl != "" %}
    <a href="{{ pub.doiurl }}" class="pub-link-btn" target="_blank">
      <img src="{{ base_path }}/icons/doi.svg" class="pub-link-icon" alt="" aria-hidden="true">DOI
    </a>
    {% else %}
    <span class="pub-link-btn pub-link-disabled">
      <img src="{{ base_path }}/icons/doi.svg" class="pub-link-icon" alt="" aria-hidden="true">DOI
    </span>
    {% endif %}
    {% if pub.bibtexurl and pub.bibtexurl != "" %}
    <a href="{{ pub.bibtexurl }}" class="pub-link-btn" target="_blank">
      <img src="{{ base_path }}/icons/bibtex.svg" class="pub-link-icon" alt="" aria-hidden="true">BibTeX
    </a>
    {% else %}
    <span class="pub-link-btn pub-link-disabled">
      <img src="{{ base_path }}/icons/bibtex.svg" class="pub-link-icon" alt="" aria-hidden="true">BibTeX
    </span>
    {% endif %}
  </div>
</div>
{% endfor %}

</div>
{% endfor %}

</div>

<nav class="pub-sidebar">
  {% for year_group in all_years %}
  <a href="#year-{{ year_group.name }}" class="pub-sidebar-item" data-year="{{ year_group.name }}">{{ year_group.name }}</a>
  {% endfor %}
</nav>

</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  var sidebarItems = document.querySelectorAll('.pub-sidebar-item');
  var yearSections = document.querySelectorAll('.pub-year-section');

  function normalizeVenueTagWidth() {
    var cards = document.querySelectorAll('.pub-card');
    cards.forEach(function(card) {
      var tags = card.querySelectorAll('.pub-card-venue .pub-tag');
      var maxWidth = 0;

      if (tags.length <= 1) {
        return;
      }

      tags.forEach(function(tag) {
        tag.style.minWidth = '';
        var width = tag.getBoundingClientRect().width;
        if (width > maxWidth) {
          maxWidth = width;
        }
      });

      tags.forEach(function(tag) {
        tag.style.minWidth = maxWidth + 'px';
      });
    });
  }

  function setActiveYear() {
    var scrollPos = window.scrollY + 120;
    var activeYear = null;
    yearSections.forEach(function(section) {
      if (section.offsetTop <= scrollPos) {
        activeYear = section.id;
      }
    });
    sidebarItems.forEach(function(item) {
      item.classList.remove('active');
      if (activeYear && item.getAttribute('href') === '#' + activeYear) {
        item.classList.add('active');
      }
    });
    if (!activeYear && sidebarItems.length > 0) {
      sidebarItems[0].classList.add('active');
    }
  }

  sidebarItems.forEach(function(item) {
    item.addEventListener('click', function(e) {
      e.preventDefault();
      var target = document.querySelector(this.getAttribute('href'));
      if (target) {
        window.scrollTo({ top: target.offsetTop - 80, behavior: 'smooth' });
      }
    });
  });

  window.addEventListener('scroll', setActiveYear);
  window.addEventListener('resize', normalizeVenueTagWidth);
  setActiveYear();
  normalizeVenueTagWidth();
});
</script>

<style>
.pub-container {
  display: flex;
  position: relative;
  gap: 2em;
}

.pub-main {
  flex: 1;
  min-width: 0;
}

.page__title::after {
  content: "(*Equal contribution, †Corresponding author)";
  font-family: inherit;
  font-size: 1em;
  font-weight: inherit;
  color: inherit;
  margin-left: 0;
}

.pub-sidebar {
  position: sticky;
  top: 80px;
  align-self: flex-start;
  display: flex;
  flex-direction: column;
  min-width: 70px;
  border-radius: 6px;
  overflow: hidden;
  box-shadow: 0 1px 4px rgba(0,0,0,0.08);
  background: #fff;
}

.pub-sidebar-item {
  display: block;
  padding: 8px 18px;
  text-align: center;
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.9em;
  font-weight: 600;
  color: #2980b9;
  text-decoration: none;
  border-bottom: 1px solid #f0f0f0;
  transition: background 0.2s, color 0.2s;
}

.pub-sidebar-item,
.pub-sidebar-item:hover,
.pub-sidebar-item:focus,
.pub-sidebar-item:active,
.pub-sidebar-item:visited {
  text-decoration: none !important;
}

.pub-sidebar-item:last-child {
  border-bottom: none;
}

.pub-sidebar-item:hover {
  background: #e8f4fd;
  text-decoration: none;
}

.pub-sidebar-item.active {
  background: #2980b9;
  color: #fff;
}

.pub-year-section {
  margin-bottom: 1.5em;
}

.pub-year-heading {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 1.5em !important;
  font-weight: bold !important;
  color: #2c3e50 !important;
  margin-top: 0.6em;
  margin-bottom: 0.4em;
  padding-bottom: 0;
}

.pub-card {
  border: 1.5px solid #d7dfe9;
  padding: 1em 1.2em;
  background: linear-gradient(180deg, #ffffff 0%, #fbfcff 100%);
  transition: border-color 0.22s ease, box-shadow 0.22s ease, background 0.22s ease;
}

.pub-card + .pub-card {
  border-top: none;
}

.pub-card:first-child {
  border-radius: 4px 4px 0 0;
}

.pub-card:last-child {
  border-radius: 0 0 4px 4px;
}

.pub-card:only-child {
  border-radius: 4px;
}

.pub-card:hover {
  border-color: #bdc8d7;
  box-shadow: 0 6px 16px rgba(49, 73, 104, 0.1);
  position: relative;
  z-index: 1;
}

.pub-card-title {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.95em;
  font-weight: 750;
  color: #222;
  margin-bottom: 0.3em;
  line-height: 1.35;
}

.pub-card-authors {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.82em;
  color: #555;
  margin-bottom: 0.4em;
  line-height: 1.3;
}

.pub-card-venue {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.8em;
  margin-bottom: 0.5em;
  display: block;
  line-height: 1.5;
}

.pub-venue-line + .pub-venue-line {
  margin-top: 0.12em;
}

.pub-tag {
  display: inline-block;
  padding: 1px 8px;
  border-radius: 3px;
  font-size: 0.85em;
  font-weight: 700;
  color: #fff;
  white-space: nowrap;
  flex-shrink: 0;
  text-align: center;
  box-sizing: border-box;
}

.pub-tag-conf {
  background: #3eb59d;
}

.pub-tag-jour {
  background: #1982c4;
}

.pub-venue-text {
  color: #666;
  font-style: normal;
}

.pub-card-abstract {
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.78em;
  color: #444;
  line-height: 1.55;
  margin-bottom: 0.5em;
  text-align: justify;
}

.pub-abstract-placeholder {
  min-height: 0;
}

.pub-card-links {
  display: flex;
  gap: 0.5em;
  flex-wrap: wrap;
  margin-top: 0.3em;
}

.pub-link-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.32em;
  padding: 3px 10px;
  border: 1px solid #ddd;
  border-radius: 3px;
  font-family: 'Charter', 'Source Han Serif SC', 'Georgia', serif !important;
  font-size: 0.78em;
  color: #333;
  text-decoration: none !important;
  transition: background 0.15s;
  cursor: pointer;
}

.pub-link-btn:hover {
  background: #f5f5f5;
  text-decoration: none !important;
}

.pub-link-icon {
  width: 0.98em;
  height: 0.98em;
  display: inline-block;
  vertical-align: middle;
}

.pub-link-disabled {
  color: #bbb !important;
  border-color: #eee;
  background: #fafafa;
  cursor: default;
  pointer-events: none;
}

.pub-link-disabled .pub-link-icon {
  filter: grayscale(1);
  opacity: 0.5;
}

@media (max-width: 768px) {
  .pub-container {
    flex-direction: column;
  }
  .pub-sidebar {
    position: static;
    flex-direction: row;
    flex-wrap: wrap;
    min-width: unset;
    order: -1;
    margin-bottom: 1em;
  }
  .pub-sidebar-item {
    border-bottom: none;
    border-right: 1px solid #f0f0f0;
    padding: 6px 14px;
  }
  .pub-sidebar-item:last-child {
    border-right: none;
  }
}
</style>
