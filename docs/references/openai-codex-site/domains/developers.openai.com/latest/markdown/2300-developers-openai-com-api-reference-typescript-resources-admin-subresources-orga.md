List project user role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project user role assignments
client.admin.organization.projects.users.roles.list(stringuserID, RoleListParams { project\_id, after, limit, order } params, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/users/{user\_id}/roles
Lists the project roles assigned to a user within a project.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) user_id > (schema)>)
params: RoleListParams { project\_id, after, limit, order }
project\_id: string
Path param: The ID of the project to inspect.
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) project_id>)
after?: string
Query param: Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing project roles.
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) after>)
limit?: number
Query param: A limit on the number of project role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Query param: Sort order for the returned project roles.
One of the following:
"asc"
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
### List project user role assignments
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
// Automatically fetches more pages as needed.
for await (const roleListResponse of client.admin.organization.projects.users.roles.list(
'user\_id',
{ project\_id: 'project\_id' },
)) {
console.log(roleListResponse.id);
}`
```
```
`{
"object": "list",
"data": [
{
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
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
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
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