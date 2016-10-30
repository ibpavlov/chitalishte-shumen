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
                <a href="/article/render/{{ article.ident|default('na') }}" class="btn btn-sm btn-primary-outline"><i class="fa fa-arrow-left" aria-hidden="true"></i> назад</a>
            </p>
            <h3 class="card-title">Добавяне на подстраница</h3>
            <div class="clearfix"></div>
            <form action="/article/save" class="form" method="post" role="form">
                <fieldset>
                    <div class="form-group">
                        <input type="text" name="title" class="form-control" placeholder="Заглавие" value="{{ article.title|e }}">
                    </div>
                    <div class="form-group">
                        <input type="text" name="subtitle" class="form-control" placeholder="Подзаглавие" value="{{ article.subtitle|e }}">
                    </div>
                    <div class="md-form">
                        <textarea type="text" name="body" id="body" class="md-textarea" style="height: 200px;">{{ article.body|e }}</textarea>
                        <label for="body">Коментар</label>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" name="email" value="" placeholder="Твоят e-mail адрес">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="hidden" name="parent_id" value="{{ article.id|e }}" />
                                <input type="hidden" name="parent_ident" value="{{ article.ident|e }}" />
                                <input type="hidden" name="parent_ident" value="{{ article.ident|e }}" />
                                <button type="submit" class="btn btn-success">Запиши промените</button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
{% endblock %}