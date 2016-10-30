<h2>Снимки:</h2>
{% if images|default(false) AND images.count() > 0 %}
    <div class="images">
    {% for image in images %}
        <a href="https://unsplash.it/1200/768.jpg?image=251" data-toggle="lightbox" data-footer="{{ image.title }}" class="pull-left" style="padding-right:5px;padding-top:5px;">
            <img src="/draw.php?path={{ image.path }}&w=100&h=100&do=fixed" title="{{ image.title }}" alt="{{ image.title }}" class="img-fluid" />
        </a>
    {% endfor %}
    </div>
{% else %}
    Няма снимки
{% endif %}