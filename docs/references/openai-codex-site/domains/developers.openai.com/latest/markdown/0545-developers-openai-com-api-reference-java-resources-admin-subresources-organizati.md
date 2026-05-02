Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List organization roles](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/list)
RoleListPage admin().organization().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/roles
##### [Create organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/create)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/roles
##### [Update organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/update)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().roles().update(RoleUpdateParamsparams = RoleUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().roles().delete(RoleDeleteParamsparams = RoleDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
class Role:
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)