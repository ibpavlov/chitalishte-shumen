{% extends "_master.volt" %}

{% block body %}
    <h3>{{ article.title }}</h3>
    <h5>{{ article.subtitle }}</h5>
    <article>
        {{ article.body|nl2br }}
    </article>
    <p class="article-footer">
        Създадена от:
        {{ partial("partials/user.name", ['user' : article.Users]) }}
        на {{ article.date_added }}
        {% if article.date_last_edit|default(false) %}|
            последна редакция {{ article.date_last_edit }}
            от
            {{ partial("partials/user.name", ['user' : article.editor]) }}
        {% endif %}
    </p>
    {{  partial("partials/comments", ['article':article]) }}
{% endblock %}