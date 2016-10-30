<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/comments/index", "Назад",'class':'btn btn-default') }}</li>
            <li class="next">{{ link_to("admin/comments/new", "Създай",'class':'btn btn-default') }}</li>
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
            <th>Creator</th>
            <th>Date Of Added</th>
            <th>Body</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for comment in page.items %}
            <tr>
                <td>{{ comment.id }}</td>
            <td>{{ comment.article_id }}</td>
            <td>{{ comment.creator_id }}</td>
            <td>{{ comment.date_added }}</td>
            <td>{{ comment.body }}</td>

                <td>{{ link_to("admin/comments/edit/"~comment.id, "Edit") }}</td>
                <td>{{ link_to("admin/comments/delete/"~comment.id, "Delete") }}</td>
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
                <li>{{ link_to("admin/comments/search", "First") }}</li>
                <li>{{ link_to("admin/comments/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("admin/comments/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("admin/comments/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
