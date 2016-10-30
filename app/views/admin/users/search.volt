
<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/users/index", "Назад",'class':'btn btn-default') }}</li>
            <li class="next">{{ link_to("admin/users/new", "Създай",'class':'btn btn-default') }}</li>
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
            <th>Email</th>
            <th>Парола</th>
            <th>First Of Name</th>
            <th>Last Of Name</th>
            <th>Active</th>
            <th>Type</th>

                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        {% if page.items is defined %}
        {% for user in page.items %}
            <tr>
                <td>{{ user.id }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.password }}</td>
            <td>{{ user.first_name }}</td>
            <td>{{ user.last_name }}</td>
            <td>{{ user.active }}</td>
            <td>{{ user.type }}</td>

                <td>{{ link_to("admin/users/edit/"~user.id, "Edit") }}</td>
                <td>{{ link_to("admin/users/delete/"~user.id, "Delete") }}</td>
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
                <li>{{ link_to("admin/users/search", "First") }}</li>
                <li>{{ link_to("admin/users/search?page="~page.before, "Previous") }}</li>
                <li>{{ link_to("admin/users/search?page="~page.next, "Next") }}</li>
                <li>{{ link_to("admin/users/search?page="~page.last, "Last") }}</li>
            </ul>
        </nav>
    </div>
</div>
