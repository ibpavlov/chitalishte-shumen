{% extends "_master.volt" %}

{% block body %}

    <div class="card-deck-wrapper">
        <div class="card-deck">
            {% for object in objects %}
                <div class="card">
                    <a href="/object/index/{{ object.id }}" class="card-link">
                        <img class="card-img-top" src="/draw.php?do=fixed&w=402&h=200&path={{ object.image|default('public/images/cover3.jpg') }}" alt="Card image cap">
                        </a>
                    <div class="card-block" style="height: 250px;overflow:hidden;">
                        <a href="/object/index/{{ object.id }}" class="card-link"><h4 class="card-title">{{ object.name }}</h4></a>
                        <p class="card-text">{{ object.description }}</p>
                    </div>
                    <div class="card-block">
                        <a href="/object/index/{{ object.id }}" class="card-link">Отвори</a>
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
{% endblock %}