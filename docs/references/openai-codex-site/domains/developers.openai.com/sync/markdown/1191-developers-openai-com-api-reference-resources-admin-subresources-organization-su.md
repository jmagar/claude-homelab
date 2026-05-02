Create invite | OpenAI API Reference
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
# Create invite
POST/organization/invites
Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.
##### Body ParametersJSONExpand Collapse
email: string
Send an email to this address
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) email > (schema)>)
role: "reader" or "owner"
`owner` or `reader`
One of the following:
"reader"
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) role > (schema) > (member) 0>)
"owner"
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) role > (schema)>)
projects: optional array of object { id, role }
An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
id: string
Project’s public ID
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) projects > (schema) > (items) > (property) id>)
role: "member" or "owner"
Project membership role
One of the following:
"member"
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) projects > (schema) > (items) > (property) role > (member) 0>)
"owner"
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) projects > (schema) > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) projects > (schema) > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (method) create > (params) 0 > (param) projects > (schema)>)
##### ReturnsExpand Collapse
Invite object { id, email, expires\_at, 6 more }
Represents an individual `invite` to the organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
email: string
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
expires\_at: number
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
invited\_at: number
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
object: "organization.invite"
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
status: "accepted" or "expired" or "pending"
`accepted`,`expired`, or `pending`
One of the following:
"accepted"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
"expired"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
"pending"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
accepted\_at: optional number
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
projects: optional array of object { id, role }
The projects that were granted membership upon acceptance of the invite.
id: optional string
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
role: optional "member" or "owner"
Project membership role
One of the following:
"member"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
### Create invite
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
`curl -X POST https://api.openai.com/v1/organization/invites \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"email": "anotheruser@example.com",
"role": "reader",
"projects": [
{
"id": "project-xyz",
"role": "member"
},
{
"id": "project-abc",
"role": "owner"
}
]
}'
`
```
```
`{
"object": "organization.invite",
"id": "invite-def",
"email": "anotheruser@example.com",
"role": "reader",
"status": "pending",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": null,
"projects": [
{
"id": "project-xyz",
"role": "member"
},
{
"id": "project-abc",
"role": "owner"
}
]
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite",
"id": "invite-def",
"email": "anotheruser@example.com",
"role": "reader",
"status": "pending",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": null,
"projects": [
{
"id": "project-xyz",
"role": "member"
},
{
"id": "project-abc",
"role": "owner"
}
]
}
`
```