<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/objects/index", "Назад",'class':'btn btn-default') }}</li>
            <li class="next">{{ link_to("admin/objects/new", "Създай",'class':'btn btn-default') }}</li>
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
            <th>Име</th>
            <th>Lang</th>
            <th>Long</th>
            <th>Потребителско ID</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for object in page.items %}
            <tr>
                <td>{{ object.id }}</td>
            <td>{{ object.name }}</td>
            <td>{{ object.lang }}</td>
            <td>{{ object.long }}</td>
            <td>{{ object.user_id }}</td>

                <td>{{ link_to("admin/objects/edit/"~object.id, "Редакция") }}</td>
                <td>{{ link_to("admin/objects/delete/"~object.id, "Изтрий") }}</td>
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
                <li>{{ link_to("admin/objects/search", "First") }}</li>
                <li>{{ link_to("admin/objects/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("admin/objects/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("admin/objects/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
