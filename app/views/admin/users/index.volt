

<div class="page-header">
    <h1>
        Search users
    </h1>
    <p>
        {{ link_to("admin/users/new", "Създай",'class':'btn btn-default') }}
    </p>
</div>

{{ content() }}

{{ form("admin/users/search", "method":"post", "autocomplete" : "off", "class" : "form-horizontal") }}

<div class="form-group">
    <label for="fieldId" class="col-sm-2 control-label">Id</label>
    <div class="col-sm-10">
        {{ text_field("id", "size" : 30, "class" : "form-control", "id" : "fieldId") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
        {{ text_field("email", "size" : 30, "class" : "form-control", "id" : "fieldEmail") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldPassword" class="col-sm-2 control-label">Парола</label>
    <div class="col-sm-10">
        {{ text_field("password", "size" : 30, "class" : "form-control", "id" : "fieldPassword") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldFirstName" class="col-sm-2 control-label">First Of Name</label>
    <div class="col-sm-10">
        {{ text_field("first_name", "size" : 30, "class" : "form-control", "id" : "fieldFirstName") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldLastName" class="col-sm-2 control-label">Last Of Name</label>
    <div class="col-sm-10">
        {{ text_field("last_name", "size" : 30, "class" : "form-control", "id" : "fieldLastName") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldActive" class="col-sm-2 control-label">Active</label>
    <div class="col-sm-10">
        {{ text_field("active", "type" : "numeric", "class" : "form-control", "id" : "fieldActive") }}
    </div>
</div>

<div class="form-group">
    <label for="fieldType" class="col-sm-2 control-label">Type</label>
    <div class="col-sm-10">
        {{ select_static("type", ['':"Всички",'user':"Потребител",'local_admin':'Отговорник','administrator':"Администратор"], "class" : "form-control", "id" : "fieldType") }}
    </div>
</div>


<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
        {{ submit_button('Търси', 'class': 'btn btn-default') }}
    </div>
</div>

</form>
