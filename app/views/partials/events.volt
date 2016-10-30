<h2>Събития:</h2>
{% if events|default(false) AND events.count() > 0 %}
    <div class="list-group">
    {% for post in events %}
        <a href="/article/render/{{ post.ident }}" class="list-group-item list-group-item-action">
            <h5 class="list-group-item-heading">{{ post.title }}</h5>
            <p class="list-group-item-text">{{ post.subtitle }}</p>
        </a>
    {% endfor %}
    </div>
{% else %}
    Няма Събития
{% endif %}