{% extends "_master.volt" %}

{% block body %}
    <div class="card">
        <div class="card-block">
            <a href="/{{ object.image|default('public/images/cover3.jpg') }}" data-toggle="lightbox">
                <div style="background: url(/draw.php?do=fixed&w=1110&h=300&path={{ object.image|default('public/images/cover3.jpg') }}) no-repeat center;" class="cover">
                    <h2 class="card-title">{{ object.name }}</h2>
                </div>
            </a>
        </div>
        <div class="card-block">
            <p class="pull-right">
                <a href="/article/create/{{ object.home.latest.ident|default('na') }}" class="btn btn-sm btn-success-outline"><i class="fa fa-plus" aria-hidden="true"></i> добави</a>
                <a href="/article/edit/{{ object.home.latest.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-pencil" aria-hidden="true"></i> редактирай</a>
                <a href="/article/versions/{{ object.home.latest.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-code-fork" aria-hidden="true"></i> версии</a>
            </p>
            <h3 class="card-title">{{ object.home.latest.title }}</h3>
            <h4 class="card-subtitle">{{ object.home.latest.subtitle }}</h4>
            <br>
            <article class="card-text">
                {{ object.home.latest.body|nl2br }}
            </article>
            <footer>
                Създадена от:
                {{ partial("partials/user.name", ['user' : object.home.Users]) }}
                на {{ object.home.date_added }}
                {% if object.home.latest.date_last_edit|default(false) %}
                    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; Последна редакция: {{ object.home.latest.date_last_edit }}
                    от
                    {{ partial("partials/user.name", ['user' : object.home.latest.Users]) }}
                {% endif %}
            </footer>
        </div>
    </div>

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

{% endblock %}