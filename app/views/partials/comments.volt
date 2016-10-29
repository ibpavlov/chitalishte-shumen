<h5>Коментари:</h5>
<form class="form-horizontal clearfix" action="/comment/post" method="POST">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email">
        </div>
    </div>
    <div class="form-group">
        <label for="comment" class="col-sm-2 control-label">Коментар</label>
        <div class="col-sm-10">
            <textarea class="form-control" name="comment" id="comment" rows="2"></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">Добави</button>
            <input type="hidden" name="article_id" value="{{ article.id }}" />
        </div>
    </div>
</form>
{% if article.comments %}
    {% for comment in article.comments %}
        <article class="comment">
            {{ comment.body }}
            <p class="article-footer">
                Написан от
                {{ partial("partials/user.name", ['user' : comment.Users]) }}
                на
                {{ comment.date_added }}
            </p>
            <hr>
        </article>
    {% endfor %}
{% else %}
    Бъдете първия и оставете коментар
{% endif %}