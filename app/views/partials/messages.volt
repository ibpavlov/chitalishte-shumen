{% set _messageFlashSession = flash.getMessages() %}
{% if _messageFlashSession|length > 0 %}
<div class="alerts-wrapper">
    <div class="container">
        {% for type, messages in _messageFlashSession %}
            {% for message in messages %}
                <div class="alert alert-{% if type=='error' %}danger{% else %}{{type}}{% endif %}">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    {{ message }}
                </div>
            {% endfor%}
        {% endfor %}
    </div>
</div>
{% endif %}