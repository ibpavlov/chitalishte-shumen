<h5>Снимки:</h5>
{% if images|default(false) AND images.count() > 0 %}
    <div class="images">
    {% for image in images %}
        <img src="/draw.php?path={{ image.path }}&w=100&h=100&do=fixed" title="{{ image.title }}" alt="{{ image.title }}" class="img-thumbnail" />
    {% endfor %}
    </div>
{% else %}
    Няма снимки
{% endif %}