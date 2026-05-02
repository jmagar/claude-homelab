List group organization role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group organization role assignments
client.admin.organization.groups.roles.list(stringgroupID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/organization/groups/{group\_id}/roles
Lists the organization roles assigned to a group within the organization.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) group_id > (schema)>)
query: RoleListParams { after, limit, order }
after?: string
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing organization roles.
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) after>)
limit?: number
A limit on the number of organization role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Sort order for the returned organization roles.
One of the following:
"asc"
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
### List group organization role assignments
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
for await (const roleListResponse of client.admin.organization.groups.roles.list('group\_id')) {
console.log(roleListResponse.id);
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