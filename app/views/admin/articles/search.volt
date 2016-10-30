<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/articles/index", "Назад",'class':'btn btn-default') }}</li>
            <li class="next">{{ link_to("admin/articles/new", "Създай",'class':'btn btn-default') }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>Резултати</h1>
</div>

{{ content() }}

<div class="row">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Id</th>
            <th>Ident</th>
            <th>Родител</th>
            <th>Читалище</th>
            <th>Заглавие</th>
            <th>Подзагл.</th>
            <th>Създадена</th>
            <th>Статус</th>
            <th>Тип</th>
            <th>Версия</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for article in page.items %}
            <tr>
                <td>{{ article.id }}</td>
            <td>{{ article.ident }}</td>
            <td>{{ article.parent_id }}</td>
            <td>{{ article.object_id }}</td>
            <td>{{ article.title }}</td>
            <td>{{ article.subtitle }}</td>
            <td>{{ article.date_added }}</td>
            <td>{{ article.status }}</td>
            <td>{{ article.type }}</td>
            <td>{{ article.version }}</td>

                <td>{{ link_to("admin/articles/edit/"~article.id, "Промени") }}</td>
                <td>{{ link_to("admin/articles/delete/"~article.id, "Изтрий") }}</td>
            </tr>
        {% endfor %}
        {% endif %}
        </tbody>
    </table>
</div>

<div class="row">
    <div class="col-sm-1">
        <p class="pagination" style="line-height: 1.42857;padding: 6px 12px;">
            {{ page.current~"/"~page.total_pages }}
        </p>
    </div>
    <div class="col-sm-11">
        <nav>
            <ul class="pagination">
                <li>{{ link_to("admin/articles/search", "First") }}</li>
                <li>{{ link_to("admin/articles/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("admin/articles/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("admin/articles/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
