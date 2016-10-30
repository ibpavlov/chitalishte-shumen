<h5>Новини:</h5>
{% if news|default(false) AND news.count() > 0 %}
    <div class="list-group">
    {% for post in news %}
        <a href="/article/render/{{ post.ident }}" class="list-group-item list-group-item-action">
            <h5 class="list-group-item-heading">{{ post.title }}</h5>
            <p class="list-group-item-text">{{ post.subtitle }}</p>
        </a>
    {% endfor %}
    </div>
{% else %}
    Няма новини
{% endif %}