<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/articles", "Назад",'class':'btn btn-default') }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>
        Редакция
    </h1>
</div>

{{ content() }}

{{ form("admin/articles/save", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

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
        {{ select_static("status", ['inactive':"Неактивнa",'active':"Активнa",'archive':"Архив",'delete':"Изтритa"], "class" : "form-control", "id" : "fieldStatus") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldType" class="col-sm-2 control-label">Type</label>
    <div class="col-sm-10">
        {{ select_static("type", ['news':'Новинa','event':"Събитиe",'gallery':"Галериq",'page':"Страницa"], "class" : "form-control", "id" : "fieldType") }}
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


{{ hidden_field("id") }}

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Send', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
