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
            <h3 class="card-title">Добавяне на подстраница</h3>
            <div class="clearfix"></div>
            <form action="/article/createsave" class="form" method="post" role="form">
                <fieldset>
                    <div class="md-form">
                        {{ select_static("type", ['news':'Новинa','event':"Събитиe",'gallery':"Галериq",'page':"Страницa"], "class" : "form-control", "id" : "fieldType","placeholder":"Тип страница") }}
                    </div>
                    <div class="md-form">
                        <input type="text" name="ident" class="form-control" placeholder="Път (URL)" value="">
                    </div>
                    <div class="form-group">
                        <input type="text" name="title" class="form-control" placeholder="Заглавие" value="">
                    </div>
                    <div class="form-group">
                        <input type="text" name="subtitle" class="form-control" placeholder="Подзаглавие" value="">
                    </div>
                    <div class="md-form">
                        <textarea type="text" name="body" id="body" class="md-textarea" style="height: 200px;">{{ article.body|e }}</textarea>
                        <label for="body">Коментар</label>
                    </div>
                    <div class="col-sm-10">
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
                                <input type="hidden" name="object_id" value="{{ article.object_id|e }}" />
                                <input type="hidden" name="status" value="active" />
                                <button type="submit" class="btn btn-success">Запиши промените</button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
{% endblock %}