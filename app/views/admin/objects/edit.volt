<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/objects", "Назад",'class':'btn btn-default') }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>
        Редакция
    </h1>
</div>

{{ content() }}

{{ form("admin/objects/save", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
        {{ text_field("name", "size" : 30, "class" : "form-control", "id" : "fieldName") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDescription" class="col-sm-2 control-label">Description</label>
    <div class="col-sm-10">
        {{ text_area("description", "cols": "30", "rows": "4", "class" : "form-control", "id" : "fieldDescription") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldImage" class="col-sm-2 control-label">Image</label>
    <div class="col-sm-10">
        {{ text_field("image", "size" : 30, "class" : "form-control", "id" : "fieldImage") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldLang" class="col-sm-2 control-label">Lang</label>
    <div class="col-sm-10">
        {{ text_field("lang", "type" : "numeric", "class" : "form-control", "id" : "fieldLang") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldLong" class="col-sm-2 control-label">Long</label>
    <div class="col-sm-10">
        {{ text_field("long", "type" : "numeric", "class" : "form-control", "id" : "fieldLong") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldUserId" class="col-sm-2 control-label">User</label>
    <div class="col-sm-10">
        {{ text_field("user_id", "size" : 30, "class" : "form-control", "id" : "fieldUserId") }}
    </div>
</div>


{{ hidden_field("id") }}

<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Send', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
