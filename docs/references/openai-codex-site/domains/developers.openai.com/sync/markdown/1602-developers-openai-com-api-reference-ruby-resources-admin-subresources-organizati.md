Create invite | OpenAI API Reference
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
# Create invite
admin.organization.invites.create(\*\*kwargs) -\> [Invite](</api/reference/ruby/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) { id, email, expires\_at, 6 more }
POST/organization/invites
Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.
##### ParametersExpand Collapse
email: String
Send an email to this address
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) email > (schema)>)
role: :reader | :owner
`owner` or `reader`
One of the following:
:reader
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) role > (schema) > (member) 0>)
:owner
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) role > (schema)>)
projects: Array[Project{ id, role}]
An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) projects > (schema) > (items) > (property) id>)
role: :member | :owner
Project membership role
One of the following:
:member
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) projects > (schema) > (items) > (property) role > (member) 0>)
:owner
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) projects > (schema) > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) projects > (schema) > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) projects > (schema)>)
##### ReturnsExpand Collapse
class Invite { id, email, expires\_at, 6 more }
Represents an individual `invite` to the organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
email: String
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
expires\_at: Integer
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
invited\_at: Integer
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
object: :"organization.invite"
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
role: :owner | :reader
`owner` or `reader`
One of the following:
:owner
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
:reader
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
status: :accepted | :expired | :pending
`accepted`,`expired`, or `pending`
One of the following:
:accepted
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
:expired
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
:pending
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
accepted\_at: Integer
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
projects: Array[Project{ id, role}]
The projects that were granted membership upon acceptance of the invite.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
role: :member | :owner
Project membership role
One of the following:
:member
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
:owner
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
### Create invite
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
invite = openai.admin.organization.invites.create(email: "email", role: :reader)
puts(invite)`
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