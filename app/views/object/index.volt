{% extends "_master.volt" %}

{% block body %}
    <div class="card">
    <div class="card-block">
        <div style="background: url(/draw.php?do=fixed&w=1110&h=300&path={{ object.image|default('public/images/cover3.jpg') }}) no-repeat center;" class="cover">
            <h2 class="card-title">{{ object.name }}</h2>
        </div>
    </div>
    </div>
    {% if object.image|default(false) %}
        <div class="pull-right"><img src="/{{ object.image }}" class="img-fluid" style="width: 300px;" /></div>
    {% endif %}

    <h1>{{ object.name }}</h1>
    <p>{{ object.description }}</p>
    <div class="clearfix"></div>
    <hr />

    <div class="row">
        <div class="col-md-4">
            {{  partial("partials/news",["news":object.news])  }}
        </div>
        <div class="col-md-4">
            {{  partial("partials/events",["events":object.events])  }}
        </div>
        <div class="col-md-4">
            {{  partial("partials/gallery",["images":object.images])  }}
        </div>
    </div>

    <h3>{{ object.home.latest.title }}</h3>
    <h5>{{ object.home.latest.subtitle }}</h5>
    <article>
        {{ object.home.latest.body|nl2br }}
    </article>
{% endblock %}