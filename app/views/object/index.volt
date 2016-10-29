{% extends "_master.volt" %}

{% block body %}
    {% if object.image|default(false) %}
        <div class="pull-right"><img src="{{ object.image }}" class="img-fluid" style="width: 300px;" /></div>
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
    <p class="article-footer">
        Създадена от:
        {{ partial("partials/user.name", ['user' : object.home.Users]) }}
        на {{ object.home.date_added }}
        {% if object.home.date_last_edit|default(false) %}|
            последна редакция {{ object.home.date_last_edit }}
            от
            {{ partial("partials/user.name", ['user' : object.home.editor]) }}
        {% endif %}
    </p>
    {{  partial("partials/comments", ['article':object.home]) }}
{% endblock %}