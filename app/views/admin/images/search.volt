<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/images/index", "Назад",'class':'btn btn-default') }}</li>
            <li class="next">{{ link_to("admin/images/new", "Създай",'class':'btn btn-default') }}</li>
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
            <th>Article</th>
            <th>Path</th>
            <th>Title</th>
            <th>Date Of Added</th>
            <th>Creator</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for image in page.items %}
            <tr>
                <td>{{ image.id }}</td>
            <td>{{ image.article_id }}</td>
            <td>{{ image.path }}</td>
            <td>{{ image.title }}</td>
            <td>{{ image.date_added }}</td>
            <td>{{ image.creator_id }}</td>

                <td>{{ link_to("admin/images/edit/"~image.id, "Промени") }}</td>
                <td>{{ link_to("admin/images/delete/"~image.id, "Изтрий") }}</td>
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
                <li>{{ link_to("admin/images/search", "First") }}</li>
                <li>{{ link_to("admin/images/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("admin/images/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("admin/images/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
