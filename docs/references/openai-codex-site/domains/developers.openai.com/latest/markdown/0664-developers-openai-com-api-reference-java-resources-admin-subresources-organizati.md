Update organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update organization role
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().roles().update(RoleUpdateParamsparams = RoleUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/roles/{role\_id}
Updates an existing organization role.
##### ParametersExpand Collapse
RoleUpdateParams params
Optional\<String\> roleId
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) role_id > (schema)>)
Optional\<String\> description
New description for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) body > (schema) > (property) description>)
Optional\<List\<String\>\> permissions
Updated set of permissions for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) body > (schema) > (property) permissions>)
Optional\<String\> roleName
New name for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) body > (schema) > (property) role_name>)
[](<#(resource) admin.organization.roles > (method) update > (params) default>)
##### ReturnsExpand Collapse
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
### Update organization role
Java
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.admin.organization.roles.Role;
import com.openai.models.admin.organization.roles.RoleUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Role role = client.admin().organization().roles().update("role\_id");
}
}`
```
```
`{
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
`
```
##### Returns Examples
```
`{
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
`
```