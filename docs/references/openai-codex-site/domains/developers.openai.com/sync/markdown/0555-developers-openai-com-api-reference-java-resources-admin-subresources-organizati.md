List group organization role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group organization role assignments
RoleListPage admin().organization().groups().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/roles
Lists the organization roles assigned to a group within the organization.
##### ParametersExpand Collapse
RoleListParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) group_id > (schema)>)
Optional\<String\> after
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing organization roles.
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of organization role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for the returned organization roles.
ASC("asc")
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
class RoleListResponse:
Detailed information about a role assignment entry returned when listing assignments.
String id
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) id>)
Optional\<Long\> createdAt
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) created_at>)
Optional\<String\> createdBy
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) created_by>)
Optional\<CreatedByUserObj\> createdByUserObj
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) created_by_user_obj>)
Optional\<String\> description
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) description>)
Optional\<Metadata\> metadata
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) metadata>)
String name
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) name>)
List\<String\> permissions
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) predefined_role>)
String resourceType
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) resource_type>)
Optional\<Long\> updatedAt
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) RoleListResponse > (schema)>)
### List group organization role assignments
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
import com.openai.models.admin.organization.groups.roles.RoleListPage;
import com.openai.models.admin.organization.groups.roles.RoleListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleListPage page = client.admin().organization().groups().roles().list("group\_id");
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