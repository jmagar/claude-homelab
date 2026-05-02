Retrieve invite | OpenAI API Reference
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
# Retrieve invite
admin.organization.invites.retrieve(strinvite\_id) -\> [Invite](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>)
GET/organization/invites/{invite\_id}
Retrieves an invite.
##### ParametersExpand Collapse
invite\_id: str
[](<#(resource) admin.organization.invites > (method) retrieve > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
class Invite: …
Represents an individual `invite` to the organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
email: str
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
expires\_at: int
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
invited\_at: int
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
object: Literal["organization.invite"]
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
role: Literal["owner", "reader"]
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
status: Literal["accepted", "expired", "pending"]
`accepted`,`expired`, or `pending`
One of the following:
"accepted"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
"expired"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
"pending"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
accepted\_at: Optional[int]
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
projects: Optional[List[Project]]
The projects that were granted membership upon acceptance of the invite.
id: Optional[str]
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
role: Optional[Literal["member", "owner"]]
Project membership role
One of the following:
"member"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
### Retrieve invite
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
invite = client.admin.organization.invites.retrieve(
"invite\_id",
)
print(invite.id)`
```
```
`{
"object": "organization.invite",
"id": "invite-abc",
"email": "user@example.com",
"role": "owner",
"status": "accepted",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite",
"id": "invite-abc",
"email": "user@example.com",
"role": "owner",
"status": "accepted",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": 1711471533
}
`
```