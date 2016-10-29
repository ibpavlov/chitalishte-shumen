<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Читалище Шумен: {{ page.title|default('Добре дошли') }}</title>
    <link rel="stylesheet" href="/public/css/bootstrap.min.css">
    <link rel="stylesheet" href="/public/css/mdb.min.css">
    <link rel="stylesheet" href="/public/css/general.min.css">
    <link rel="stylesheet" href="/public/css/ekko-lightbox.min.css">

    <script type="text/javascript" src="/public/js/jquery-3.1.1.min.js"></script>
    <script src="/public/js/tether.min.js"></script>
    <script src="/public/js/bootstrap.min.js"></script>
    <script src="/public/js/mdb.min.js" type="text/javascript"></script>
    <script src="/public/js/ekko-lightbox.min.js" type="text/javascript"></script>
    <script src="https://use.fontawesome.com/2ed134f9a4.js"></script>
    <script>
        $(document).on('click', '[data-toggle="lightbox"]', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox();
        });
    </script>

    {# <script src="/public/js/moment.min.js"></script> #}
    {# <script src="/public/js/bootstrap-datetimepicker.min.js"></script> #}
    {# <link rel="stylesheet" href="/public/css/bootstrap-datetimepicker.min.css">#}
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-light bg-faded" id="header">
            {% if object|default(false) %}
                <a class="navbar-brand" href="/object/index/{{ object.id }}">{{ object.name }}</a>
            {% else %}
                <a class="navbar-brand" href="/">ЧИТАЛИЩА РЕГИОН ШУМЕН</a>
            {% endif %}
            <ul class="nav navbar-nav">
                <li class="nav-item{% if router.getControllerName() == '' %} active{% endif %}">
                    <a href="/" class="nav-link">Начало</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/objects/" id="supportedContentDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Читалища</a>
                    <div class="dropdown-menu" aria-labelledby="supportedContentDropdown">
                        {% for menuObject in objects %}
                        <a class="dropdown-item" href="/object/index/{{ menuObject.id }}">{{ menuObject.name }}</a>
                        {% endfor %}
                    </div>
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/objects/" id="supportedContentDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Читалища</a>
                    <div class="dropdown-menu" aria-labelledby="supportedContentDropdown">
                        {% for menuObject in objects %}
                            <a class="dropdown-item" href="/object/index/{{ menuObject.id }}">{{ menuObject.name }}</a>
                        {% endfor %}
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</body>
</html>