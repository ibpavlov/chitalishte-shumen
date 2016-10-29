{% if user %}
    {% if user.first_name!='' OR user.last_name!='' %}
        <strong>{{ user.first_name }} {{ user.last_name }}</strong>
    {% else %}
        <strong>{{ user.email }}</strong>
    {% endif %}
{% else %}
    <strong>N/A</strong>
{% endif %}