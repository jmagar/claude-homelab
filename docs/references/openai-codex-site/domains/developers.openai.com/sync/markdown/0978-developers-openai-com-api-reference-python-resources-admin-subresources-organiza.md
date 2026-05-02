Invites | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Invites
##### [List invites](/api/reference/python/resources/admin/subresources/organization/subresources/invites/methods/list)
admin.organization.invites.list(InviteListParams\*\*kwargs) -\> SyncConversationCursorPage[[Invite](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>)]
GET/organization/invites
##### [Create invite](/api/reference/python/resources/admin/subresources/organization/subresources/invites/methods/create)
admin.organization.invites.create(InviteCreateParams\*\*kwargs) -\> [Invite](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>)
POST/organization/invites
##### [Retrieve invite](/api/reference/python/resources/admin/subresources/organization/subresources/invites/methods/retrieve)
admin.organization.invites.retrieve(strinvite\_id) -\> [Invite](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>)
GET/organization/invites/{invite\_id}
##### [Delete invite](/api/reference/python/resources/admin/subresources/organization/subresources/invites/methods/delete)
admin.organization.invites.delete(strinvite\_id) -\> [InviteDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)
DELETE/organization/invites/{invite\_id}
##### ModelsExpand Collapse
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
class InviteDeleteResponse: …
id: str
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) deleted>)
object: Literal["organization.invite.deleted"]
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) invite_delete_response > (schema)>)