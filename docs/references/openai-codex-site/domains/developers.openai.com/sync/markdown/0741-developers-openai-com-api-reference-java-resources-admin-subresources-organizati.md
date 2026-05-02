List user organization role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/users)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List user organization role assignments
RoleListPage admin().organization().users().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}/roles
Lists the organization roles assigned to a user within the organization.
##### ParametersExpand Collapse
RoleListParams params
Optional\<String\> userId
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) user_id > (schema)>)
Optional\<String\> after
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing organization roles.
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of organization role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list#(resource) admin.organization.users.roles > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for the returned organization roles.
ASC("asc")
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.users.roles > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.users.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
class RoleListResponse:
Detailed information about a role assignment entry returned when listing assignments.
String id
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) id>)
Optional\<Long\> createdAt
When the role was created.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) created_at>)
Optional\<String\> createdBy
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) created_by>)
Optional\<CreatedByUserObj\> createdByUserObj
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) created_by_user_obj>)
Optional\<String\> description
Description of the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) description>)
Optional\<Metadata\> metadata
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) metadata>)
String name
Name of the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) name>)
List\<String\> permissions
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) predefined_role>)
String resourceType
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) resource_type>)
Optional\<Long\> updatedAt
When the role was last updated.
formatint64
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.users.roles > (model) RoleListResponse > (schema)>)
### List user organization role assignments
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
import com.openai.models.admin.organization.users.roles.RoleListPage;
import com.openai.models.admin.organization.users.roles.RoleListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleListPage page = client.admin().organization().users().roles().list("user\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false,
"description": "Allows managing organization groups",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
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
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false,
"description": "Allows managing organization groups",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
}
],
"has\_more": false,
"next": null
}
`
```