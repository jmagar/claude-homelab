Retrieve invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Invites](/api/reference/go/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve invite
client.Admin.Organization.Invites.Get(ctx, inviteID) (\*[Invite](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>), error)
GET/organization/invites/{invite\_id}
Retrieves an invite.
##### ParametersExpand Collapse
inviteID string
[](<#(resource) admin.organization.invites > (method) retrieve > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
type Invite struct{…}
Represents an individual `invite` to the organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
Email string
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
ExpiresAt int64
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
InvitedAt int64
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
Object OrganizationInvite
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
Role InviteRole
`owner` or `reader`
One of the following:
const InviteRoleOwner InviteRole = "owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
const InviteRoleReader InviteRole = "reader"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
Status InviteStatus
`accepted`,`expired`, or `pending`
One of the following:
const InviteStatusAccepted InviteStatus = "accepted"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
const InviteStatusExpired InviteStatus = "expired"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
const InviteStatusPending InviteStatus = "pending"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
AcceptedAt int64Optional
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
Projects []InviteProjectOptional
The projects that were granted membership upon acceptance of the invite.
ID stringOptional
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
Role stringOptional
Project membership role
One of the following:
const InviteProjectRoleMember InviteProjectRole = "member"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
const InviteProjectRoleOwner InviteProjectRole = "owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
### Retrieve invite
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAdminAPIKey("My Admin API Key"),
)
invite, err := client.Admin.Organization.Invites.Get(context.TODO(), "invite\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", invite.ID)
}
`
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