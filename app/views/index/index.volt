{% extends "_master.volt" %}

{% block body %}
    <h3>{{ home.title }}</h3>
    <h5>{{ home.subtitle }}</h5>
    <article>
        {{ home.body|nl2br }}
    </article>
    <p class="article-footer">
        Създадена от:
        {% if home.Users %}
            {% if home.Users.first_name!='' OR home.Users.last_name!='' %}
                <strong>{{ home.Users.first_name }} {{ home.Users.last_name }}</strong>
            {% else %}
                <strong>{{ home.User.email }}</strong>
            {% endif %}
        {% else %}
            <strong>N/A</strong>
        {% endif %}
        на {{ home.date_added }}
        {% if home.date_last_edit %}|
            последна редакция {{ home.date_last_edit }}
            от
            {% if home.editor %}
                {% if home.editor.first_name!='' OR home.editor.last_name!='' %}
                    <strong>{{ home.editor.first_name }} {{ home.editor.last_name }}</strong>
                {% else %}
                    <strong>{{ home.editor.email }}</strong>
                {% endif %}
            {% else %}
                <strong>N/A</strong>
            {% endif %}
        {% endif %}
    </p>
    <h5>Коментари:</h5>
    {% if home.Comments %}
        {% for comment in home.Comments %}
            <article class="comment">
                {{ comment.body }}
                <p class="article-footer">
                    Написан от
                    {% if comment.Users.first_name!='' OR comment.Users.last_name!='' %}
                        <strong>{{ comment.Users.first_name }} {{ comment.Users.last_name }}</strong>
                    {% else %}
                        <strong>{{ comment.User.email }}</strong>
                    {% endif %}
                    на
                    {{ comment.date_added }}
                </p>
                <hr>
            </article>
        {% endfor %}
    {% endif %}
{% endblock %}