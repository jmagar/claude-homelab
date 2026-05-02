Assign organization role to group | OpenAI API Reference
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
# Assign organization role to group
client.admin.organization.groups.roles.create(stringgroupID, RoleCreateParams { role\_id } body, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/organization/groups/{group\_id}/roles
Assigns an organization role to a group within the organization.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
body: RoleCreateParams { role\_id }
role\_id: string
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) role_id>)
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group { id, created\_at, name, 2 more }
Summary information about a group returned in role assignment responses.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: "group"
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: boolean
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: "group.role"
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string | null
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array\<string\>
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
### Assign organization role to group
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
const role = await client.admin.organization.groups.roles.create('group\_id', {
role\_id: 'role\_id',
});
console.log(role.group);`
```
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
},
"role": {
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
}
`
```
##### Returns Examples
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
},
"role": {
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
}
`
```