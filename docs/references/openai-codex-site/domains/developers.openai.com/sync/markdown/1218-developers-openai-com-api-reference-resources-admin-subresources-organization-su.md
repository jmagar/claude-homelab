Update group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update group
POST/organization/groups/{group\_id}
Updates a group’s information.
##### Path ParametersExpand Collapse
group\_id: string
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
##### Body ParametersJSONExpand Collapse
name: string
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) 0 > (param) name > (schema)>)
##### ReturnsExpand Collapse
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
### Update group
HTTP
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
`curl -X POST https://api.openai.com/v1/organization/groups/group\_01J1F8ABCDXYZ \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"name": "Escalations"
}'
`
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