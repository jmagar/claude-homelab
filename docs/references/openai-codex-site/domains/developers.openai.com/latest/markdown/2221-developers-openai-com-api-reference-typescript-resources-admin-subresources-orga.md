Create group | OpenAI API Reference
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
# Create group
client.admin.organization.groups.create(GroupCreateParams { name } body, RequestOptionsoptions?): [Group](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) { id, created\_at, is\_scim\_managed, name }
POST/organization/groups
Creates a new group in the organization.
##### ParametersExpand Collapse
body: GroupCreateParams { name }
name: string
Human readable name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) create > (params) default > (param) name>)
[](<#(resource) admin.organization.groups > (method) create > (params) default>)
##### ReturnsExpand Collapse
Group { id, created\_at, is\_scim\_managed, name }
Details about an organization group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
### Create group
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
const group = await client.admin.organization.groups.create({ name: 'x' });
console.log(group.id);`
```
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```