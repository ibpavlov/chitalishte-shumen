{% extends "_master.volt" %}

{% block body %}
    <div class="card">
        <div class="card-block">
            <div style="{% if object.image|default(false) %}background: url(/draw.php?do=fixed&w=1110&h=100&path={{ object.image }}) no-repeat center; {% endif %}" class="cover">
                <h2 class="card-title">{{ object.name }}</h2>
            </div>
        </div>
        <div class="card-block">
            <p class="pull-right">
                <a href="/article/edit/{{ article.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-pencil" aria-hidden="true"></i> редактирай</a>
                <a href="/article/versions/{{ article.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-code-fork" aria-hidden="true"></i> версии</a>
            </p>
            <h3 class="card-title">{{ article.title }}</h3>
            <h4 class="card-subtitle">{{ article.subtitle }}</h4>
            <br>
            <article class="card-text">
                {{ article.body|nl2br }}
            </article>
            <footer>
                Създадена от:
                {{ partial("partials/user.name", ['user' : article.Users]) }}
                на {{ article.date_added }}
                {% if article.date_last_edit|default(false) %}
                    &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; Последна редакция: {{ article.date_last_edit }}
                    от
                    {{ partial("partials/user.name", ['user' : article.editor]) }}
                {% endif %}
            </footer>
        </div>
    </div>
{% endblock %}