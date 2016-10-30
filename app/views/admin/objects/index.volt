<div class="page-header">
    <h1>
        Търси читалище
    </h1>
    <p>
        {{ link_to("admin/objects/new", "Създай",'class':'btn btn-default') }}
    </p>
</div>

{{ content() }}

{{ form("admin/objects/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldId" class="col-sm-2 control-label">Id</label>
    <div class="col-sm-10">
        {{ text_field("id", "size" : 30, "class" : "form-control", "id" : "fieldId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldName" class="col-sm-2 control-label">Име</label>
    <div class="col-sm-10">
        {{ text_field("name", "size" : 30, "class" : "form-control", "id" : "fieldName") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldDescription" class="col-sm-2 control-label">Описание</label>
    <div class="col-sm-10">
        {{ text_area("description", "cols": "30", "rows": "4", "class" : "form-control", "id" : "fieldDescription") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldImage" class="col-sm-2 control-label">Път към снимка</label>
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
    <label for="fieldUserId" class="col-sm-2 control-label">Потребител</label>
    <div class="col-sm-10">
        {{ text_field("user_id", "size" : 30, "class" : "form-control", "id" : "fieldUserId") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Търси', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
