---
layout: default
---

<section>

<p>This is a collection of Ruby code snippets, including the results obtained from running them in irb. It can also be used as a cheat sheet.</p>

<h2>ARTICLES</h2>

{% assign sorted_categories = site.categories | sort %}
<ul>
  {% for category in sorted_categories %}
    <li>
      <section>
        <h3 id="{{ category[0] | slugify }}">
          {{ category[0] | upcase }}
        </h3>

        {% assign posts = category[1] | sort: "title" %}
        <ul>
          {% for post in posts %}
            <li>
              <a href="{{ post.url | relative_url }}">
                {{ post.title }}
              </a>
            </li>
          {% endfor %}
        </ul>
      </section>
    </li>
  {% endfor %}
</ul>

</section>