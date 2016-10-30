<div class="row">
    <nav>
        <ul class="pager">
            <li class="previous">{{ link_to("admin/objects", "Назад",'class':'btn btn-default') }}</li>
        </ul>
    </nav>
</div>

<div class="page-header">
    <h1>
        Създай Читалище
    </h1>
</div>

{{ content() }}

{{ form("admin/objects/create", "method":"post", "autocomplete" : "off", "class" : "form-horizontal","enctype":"multipart/form-data") }}

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
<div class="clearfix"></div>

<div class="form-group">
    <label for="fieldImage" class="col-sm-2 control-label">Снимка</label>
    <div class="col-sm-10">
        <input type="file" name="image" class="form-control" />
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
    <label for="fieldUserId" class="col-sm-2 control-label">Потребителско ID</label>
    <div class="col-sm-10">
            {{ text_field("user_id", "size" : 30, "class" : "form-control", "id" : "fieldUserId") }}
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            {{ submit_button('Save', 'class': 'btn btn-default') }}
        </div>
    </div>

    </form>
