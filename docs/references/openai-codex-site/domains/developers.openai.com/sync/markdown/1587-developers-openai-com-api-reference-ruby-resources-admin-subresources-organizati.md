Delete invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Invites](/api/reference/ruby/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete invite
admin.organization.invites.delete(invite\_id) -\> [InviteDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/invites/{invite\_id}
Delete an invite. If the invite has already been accepted, it cannot be deleted.
##### ParametersExpand Collapse
invite\_id: String
[](<#(resource) admin.organization.invites > (method) delete > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
class InviteDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) deleted>)
object: :"organization.invite.deleted"
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)
### Delete invite
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
invite = openai.admin.organization.invites.delete("invite\_id")
puts(invite)`
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