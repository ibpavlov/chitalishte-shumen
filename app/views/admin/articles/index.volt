<div class="page-header">
    <h1>
        Search articles
    </h1>
    <p>
        {{ link_to("admin/articles/new", "Create articles") }}
    </p>
</div>

{{ content() }}

{{ form("admin/articles/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldId" class="col-sm-2 control-label">Id</label>
    <div class="col-sm-10">
        {{ text_field("id", "size" : 30, "class" : "form-control", "id" : "fieldId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldIdent" class="col-sm-2 control-label">Ident</label>
    <div class="col-sm-10">
        {{ text_field("ident", "size" : 30, "class" : "form-control", "id" : "fieldIdent") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldParentId" class="col-sm-2 control-label">Parent</label>
    <div class="col-sm-10">
        {{ text_field("parent_id", "size" : 30, "class" : "form-control", "id" : "fieldParentId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldObjectId" class="col-sm-2 control-label">Object</label>
    <div class="col-sm-10">
        {{ text_field("object_id", "size" : 30, "class" : "form-control", "id" : "fieldObjectId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldTitle" class="col-sm-2 control-label">Title</label>
    <div class="col-sm-10">
        {{ text_field("title", "size" : 30, "class" : "form-control", "id" : "fieldTitle") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldSubtitle" class="col-sm-2 control-label">Subtitle</label>
    <div class="col-sm-10">
        {{ text_field("subtitle", "size" : 30, "class" : "form-control", "id" : "fieldSubtitle") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldBody" class="col-sm-2 control-label">Body</label>
    <div class="col-sm-10">
        {{ text_area("body", "cols": "30", "rows": "4", "class" : "form-control", "id" : "fieldBody") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDateAdded" class="col-sm-2 control-label">Date Of Added</label>
    <div class="col-sm-10">
        {{ text_field("date_added", "size" : 30, "class" : "form-control", "id" : "fieldDateAdded") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDateLastEdit" class="col-sm-2 control-label">Date Of Last Of Edit</label>
    <div class="col-sm-10">
        {{ text_field("date_last_edit", "size" : 30, "class" : "form-control", "id" : "fieldDateLastEdit") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDateDeleted" class="col-sm-2 control-label">Date Of Deleted</label>
    <div class="col-sm-10">
        {{ text_field("date_deleted", "size" : 30, "class" : "form-control", "id" : "fieldDateDeleted") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldStatus" class="col-sm-2 control-label">Status</label>
    <div class="col-sm-10">
        {{ select_static("status", ['':'Всички','inactive':"Неактивни",'active':"Активни",'archive':"Архиви",'delete':"Изтрити"], "class" : "form-control", "id" : "fieldStatus") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldType" class="col-sm-2 control-label">Type</label>
    <div class="col-sm-10">
        {{ select_static("type", ['':'Всички','news':'Новини','event':"Събития",'gallery':"Галерии",'page':"Страници"], "class" : "form-control", "id" : "fieldType") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldCreatorId" class="col-sm-2 control-label">Creator</label>
    <div class="col-sm-10">
        {{ text_field("creator_id", "size" : 30, "class" : "form-control", "id" : "fieldCreatorId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldVersion" class="col-sm-2 control-label">Version</label>
    <div class="col-sm-10">
        {{ text_field("version", "size" : 30, "class" : "form-control", "id" : "fieldVersion") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldVersionParentId" class="col-sm-2 control-label">Version Of Parent</label>
    <div class="col-sm-10">
        {{ text_field("version_parent_id", "size" : 30, "class" : "form-control", "id" : "fieldVersionParentId") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Search', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
