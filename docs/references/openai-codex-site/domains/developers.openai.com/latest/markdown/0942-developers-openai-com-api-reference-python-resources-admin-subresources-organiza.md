Delete invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Invites](/api/reference/python/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete invite
admin.organization.invites.delete(strinvite\_id) -\> [InviteDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)
DELETE/organization/invites/{invite\_id}
Delete an invite. If the invite has already been accepted, it cannot be deleted.
##### ParametersExpand Collapse
invite\_id: str
[](<#(resource) admin.organization.invites > (method) delete > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
class InviteDeleteResponse: …
id: str
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) deleted>)
object: Literal["organization.invite.deleted"]
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)
### Delete invite
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
invite = client.admin.organization.invites.delete(
"invite\_id",
)
print(invite.id)`
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