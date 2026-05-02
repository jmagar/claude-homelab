Update group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update group
client.admin.organization.groups.update(stringgroupID, GroupUpdateParams { name } body, RequestOptionsoptions?): [GroupUpdateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>) { id, created\_at, is\_scim\_managed, name }
POST/organization/groups/{group\_id}
Updates a group’s information.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
body: GroupUpdateParams { name }
name: string
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) name>)
[](<#(resource) admin.organization.groups > (method) update > (params) default>)
##### ReturnsExpand Collapse
GroupUpdateResponse { id, created\_at, is\_scim\_managed, name }
Response returned after updating a group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: string
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
### Update group
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
const group = await client.admin.organization.groups.update('group\_id', { name: 'x' });
console.log(group.id);`
```
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```