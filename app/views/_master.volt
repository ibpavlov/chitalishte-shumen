<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Читалище Шумен: {{ page.title|default('Добре дошли') }}</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/public/css/bootstrap.min.css">
    <link rel="stylesheet" href="/public/css/general.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="/public/js/tether.min.js"></script>
    <script src="/public/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/2ed134f9a4.js"></script>

    <script src="/public/js/moment.min.js"></script>
    <script src="/public/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="/public/css/bootstrap-datetimepicker.min.css">
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-light bg-faded" id="header">
            <a class="navbar-brand" href="#">
                {% if object %}
                    {{ object.name }}
                {% else %}
                    Читалище Шумен
                {% endif %}
            </a>
            <ul class="nav navbar-nav">
                <li class="nav-item{% if router.getControllerName() == '' %} active{% endif %}">
                    <a href="/" class="nav-link">Начало</a>
                </li>
                <li class="dropdown nav-item{% if router.getControllerName() == 'objects' %} active{% endif %}">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Читалища</a>
                    <ul class="dropdown-menu">
                        {% for menuObject in objects %}
                        <li><a href="/object/index/{{ menuObject.id }}">{{ menuObject.name }}</a></li>
                        {% endfor %}
                    </ul>
                </li>
            </ul>
        </nav>
        {% block body %}

        {% endblock %}
        <nav class="navbar navbar-light bg-faded" id="header">
            <ul class="nav navbar-nav">
                <li class="nav-item{% if router.getControllerName() == '' %} active{% endif %}">
                    <a href="/" class="nav-link">Начало</a>
                </li>
                <li class="nav-item{% if router.getControllerName() == 'test' %} active{% endif %}">
                    <a href="/" class="nav-link">Тест</a>
                </li>
            </ul>
        </nav>
    </div>
</body>
</html>