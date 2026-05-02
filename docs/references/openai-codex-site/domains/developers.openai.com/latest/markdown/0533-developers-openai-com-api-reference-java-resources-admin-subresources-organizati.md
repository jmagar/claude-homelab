Invites | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Invites
##### [List invites](/api/reference/java/resources/admin/subresources/organization/subresources/invites/methods/list)
InviteListPage admin().organization().invites().list(InviteListParamsparams = InviteListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/invites
##### [Create invite](/api/reference/java/resources/admin/subresources/organization/subresources/invites/methods/create)
[Invite](</api/reference/java/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) admin().organization().invites().create(InviteCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/invites
##### [Retrieve invite](/api/reference/java/resources/admin/subresources/organization/subresources/invites/methods/retrieve)
[Invite](</api/reference/java/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) admin().organization().invites().retrieve(InviteRetrieveParamsparams = InviteRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/invites/{invite\_id}
##### [Delete invite](/api/reference/java/resources/admin/subresources/organization/subresources/invites/methods/delete)
[InviteDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema)>) admin().organization().invites().delete(InviteDeleteParamsparams = InviteDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/invites/{invite\_id}
##### ModelsExpand Collapse
class Invite:
Represents an individual `invite` to the organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
String email
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
long expiresAt
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
long invitedAt
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
JsonValue; object\_ "organization.invite"constant"organization.invite"constant
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
Status status
`accepted`,`expired`, or `pending`
One of the following:
ACCEPTED("accepted")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
EXPIRED("expired")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
PENDING("pending")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
Optional\<Long\> acceptedAt
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
Optional\<List\<Project\>\> projects
The projects that were granted membership upon acceptance of the invite.
Optional\<String\> id
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
Optional\<Role\> role
Project membership role
One of the following:
MEMBER("member")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
OWNER("owner")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)