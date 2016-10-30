<div class="page-header">
    <h1>
        Search images
    </h1>
    <p>
        {{ link_to("admin/images/new", "Create images") }}
    </p>
</div>

{{ content() }}

{{ form("admin/images/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldId" class="col-sm-2 control-label">Id</label>
    <div class="col-sm-10">
        {{ text_field("id", "size" : 30, "class" : "form-control", "id" : "fieldId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldArticleId" class="col-sm-2 control-label">Article</label>
    <div class="col-sm-10">
        {{ text_field("article_id", "size" : 30, "class" : "form-control", "id" : "fieldArticleId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldPath" class="col-sm-2 control-label">Path</label>
    <div class="col-sm-10">
        {{ text_field("path", "size" : 30, "class" : "form-control", "id" : "fieldPath") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldTitle" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-10">
        {{ text_field("title", "size" : 30, "class" : "form-control", "id" : "fieldTitle") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDateAdded" class="col-sm-2 control-label">Date Of Added</label>
    <div class="col-sm-10">
        {{ text_field("date_added", "size" : 30, "class" : "form-control", "id" : "fieldDateAdded") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldCreatorId" class="col-sm-2 control-label">Creator</label>
    <div class="col-sm-10">
        {{ text_field("creator_id", "size" : 30, "class" : "form-control", "id" : "fieldCreatorId") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Search', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
