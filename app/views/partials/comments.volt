<div class="card">
    <div class="card-block">
        <div class="row">
            <div class="col-md-8">
                <h4 class="card-title">Коментари</h4>
                {% if article.comments|default(false) AND article.comments.count() > 0 %}
                    {% for comment in article.comments %}
                        <article class="comment">
                            {{ comment.body }}
                            <footer class="no-border">
                                Написан от
                                {{ partial("partials/user.name", ['user' : comment.Users]) }}
                                на
                                {{ comment.date_added }}
                            </footer>
                            <hr>
                        </article>
                    {% endfor %}
                {% else %}
                    <strong>Бъдете първия и оставете коментар използвайки формата вдясно.</strong>
                {% endif %}
            </div>
            <div class="col-md-4">
                <h4 class="card-title">Добави своят коментар</h4>
                <form class="form" action="/comment/post" method="POST" role="form">
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email">
                    </div>
                    <div class="md-form">
                        <textarea type="text" name="comment" id="comment" class="md-textarea" style="height: 200px;"></textarea>
                        <label for="comment">Коментар</label>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-default">Добави</button>
                        <input type="hidden" name="article_id" value="{{ article.id }}" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>