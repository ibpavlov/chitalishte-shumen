{% extends "_master.volt" %}

{% block body %}
    <div class="card">
        <div class="card-block">
            <div style="background: url(/draw.php?do=fixed&w=1110&h=100&path={{ object.image|default('public/images/cover3.jpg') }}) no-repeat center; " class="cover">
                <h2 class="card-title">{{ object.name }}</h2>
            </div>
        </div>
        <div class="card-block">
            <p class="pull-right">
                <a href="/article/render/{{ article.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-arrow-left" aria-hidden="true"></i> назад</a>
            </p>
            <h3 class="card-title">Редактиране</h3>
            <div class="clearfix"></div>
            {% if message|default(false) %}
                <div class="alert alert-info" role="alert">
                    <strong>{{ message }}</strong>
                </div>
            {% endif %}
            <script>
                setTimeout(function() {
                    location.href = "/article/render/{{ article.ident|default('na') }}";
                }, 3000);
            </script>
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