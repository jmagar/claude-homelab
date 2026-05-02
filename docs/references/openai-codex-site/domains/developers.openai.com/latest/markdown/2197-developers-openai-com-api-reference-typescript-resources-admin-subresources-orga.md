Invites | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Invites
##### [List invites](/api/reference/typescript/resources/admin/subresources/organization/subresources/invites/methods/list)
client.admin.organization.invites.list(InviteListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[Invite](</api/reference/typescript/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) { id, email, expires\_at, 6 more } \>
GET/organization/invites
##### [Create invite](/api/reference/typescript/resources/admin/subresources/organization/subresources/invites/methods/create)
client.admin.organization.invites.create(InviteCreateParams { email, role, projects } body, RequestOptionsoptions?): [Invite](</api/reference/typescript/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) { id, email, expires\_at, 6 more }
POST/organization/invites
##### [Retrieve invite](/api/reference/typescript/resources/admin/subresources/organization/subresources/invites/methods/retrieve)
client.admin.organization.invites.retrieve(stringinviteID, RequestOptionsoptions?): [Invite](</api/reference/typescript/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) { id, email, expires\_at, 6 more }
GET/organization/invites/{invite\_id}
##### [Delete invite](/api/reference/typescript/resources/admin/subresources/organization/subresources/invites/methods/delete)
client.admin.organization.invites.delete(stringinviteID, RequestOptionsoptions?): [InviteDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/invites/{invite\_id}
##### ModelsExpand Collapse
Invite { id, email, expires\_at, 6 more }
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
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
status: "accepted" | "expired" | "pending"
`accepted`,`expired`, or `pending`
One of the following:
"accepted"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
"expired"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
"pending"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
accepted\_at?: number
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
projects?: Array\<Project\>
The projects that were granted membership upon acceptance of the invite.
id?: string
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
role?: "member" | "owner"
Project membership role
One of the following:
"member"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
"owner"
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
InviteDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) deleted>)
object: "organization.invite.deleted"
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)