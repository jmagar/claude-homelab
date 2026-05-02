Delete invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Invites](/api/reference/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete invite
DELETE/organization/invites/{invite\_id}
Delete an invite. If the invite has already been accepted, it cannot be deleted.
##### Path ParametersExpand Collapse
invite\_id: string
[](<#(resource) admin.organization.invites > (method) delete > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
id: string
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) deleted>)
object: "organization.invite.deleted"
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) object>)
### Delete invite
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
`curl -X DELETE https://api.openai.com/v1/organization/invites/invite-abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```