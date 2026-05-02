List organization roles | OpenAI API Reference
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
# List organization roles
RoleListPage admin().organization().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/roles
Lists the roles configured for the organization.
##### ParametersExpand Collapse
RoleListParams params
Optional\<String\> after
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing roles.
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of roles to return. Defaults to 1000.
minimum0
maximum1000
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/list#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for the returned roles.
ASC("asc")
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.roles > (method) list > (params) default>)
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
### List organization roles
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
import com.openai.models.admin.organization.roles.RoleListPage;
import com.openai.models.admin.organization.roles.RoleListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleListPage page = client.admin().organization().roles().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
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
],
"has\_more": false,
"next": null
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
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
],
"has\_more": false,
"next": null
}
`
```