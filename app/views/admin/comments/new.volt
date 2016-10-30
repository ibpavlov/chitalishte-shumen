<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/comments", "Go Back") }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>
        Create comments
    </h1>
</div>

{{ content() }}

{{ form("admin/comments/create", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldArticleId" class="col-sm-2 control-label">Article</label>
    <div class="col-sm-10">
        {{ text_field("article_id", "size" : 30, "class" : "form-control", "id" : "fieldArticleId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldCreatorId" class="col-sm-2 control-label">Creator</label>
    <div class="col-sm-10">
        {{ text_field("creator_id", "size" : 30, "class" : "form-control", "id" : "fieldCreatorId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDateAdded" class="col-sm-2 control-label">Date Of Added</label>
    <div class="col-sm-10">
        {{ text_field("date_added", "size" : 30, "class" : "form-control", "id" : "fieldDateAdded") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldBody" class="col-sm-2 control-label">Body</label>
    <div class="col-sm-10">
        {{ text_area("body", "cols": "30", "rows": "4", "class" : "form-control", "id" : "fieldBody") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Save', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
