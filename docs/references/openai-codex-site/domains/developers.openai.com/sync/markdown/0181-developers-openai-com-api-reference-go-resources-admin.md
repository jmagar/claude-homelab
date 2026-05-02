Admin | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Admin
#### AdminOrganization
#### AdminOrganizationAudit Logs
List user actions and configuration changes within this organization.
##### [List audit logs](/api/reference/go/resources/admin/subresources/organization/subresources/audit_logs/methods/list)
client.Admin.Organization.AuditLogs.List(ctx, query) (\*ConversationCursorPage[[AdminOrganizationAuditLogListResponse](</api/reference/go/resources/admin#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema)>)], error)
GET/organization/audit\_logs
#### AdminOrganizationAdmin API Keys
##### [List all organization and project API keys.](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
client.Admin.Organization.AdminAPIKeys.List(ctx, query) (\*CursorPage[[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)], error)
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
client.Admin.Organization.AdminAPIKeys.New(ctx, body) (\*[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>), error)
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
client.Admin.Organization.AdminAPIKeys.Get(ctx, keyID) (\*[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>), error)
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
client.Admin.Organization.AdminAPIKeys.Delete(ctx, keyID) (\*[AdminOrganizationAdminAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
type AdminAPIKey struct{…}
Represents an individual Admin API key in an org.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
LastUsedAt int64
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
Name string
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
Object string
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
Owner AdminAPIKeyOwner
ID stringOptional
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
CreatedAt int64Optional
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
Name stringOptional
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
Object stringOptional
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
Role stringOptional
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
Type stringOptional
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
RedactedValue string
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
Value stringOptional
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
#### AdminOrganizationUsage
##### [Audio speeches](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
client.Admin.Organization.Usage.AudioSpeeches(ctx, query) (\*[AdminOrganizationUsageAudioSpeechesResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageAudioSpeechesResponse > (schema)>), error)
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
client.Admin.Organization.Usage.AudioTranscriptions(ctx, query) (\*[AdminOrganizationUsageAudioTranscriptionsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageAudioTranscriptionsResponse > (schema)>), error)
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
client.Admin.Organization.Usage.CodeInterpreterSessions(ctx, query) (\*[AdminOrganizationUsageCodeInterpreterSessionsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageCodeInterpreterSessionsResponse > (schema)>), error)
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/completions)
client.Admin.Organization.Usage.Completions(ctx, query) (\*[AdminOrganizationUsageCompletionsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageCompletionsResponse > (schema)>), error)
GET/organization/usage/completions
##### [Embeddings](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
client.Admin.Organization.Usage.Embeddings(ctx, query) (\*[AdminOrganizationUsageEmbeddingsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema)>), error)
GET/organization/usage/embeddings
##### [Images](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/images)
client.Admin.Organization.Usage.Images(ctx, query) (\*[AdminOrganizationUsageImagesResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageImagesResponse > (schema)>), error)
GET/organization/usage/images
##### [Moderations](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/moderations)
client.Admin.Organization.Usage.Moderations(ctx, query) (\*[AdminOrganizationUsageModerationsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageModerationsResponse > (schema)>), error)
GET/organization/usage/moderations
##### [Vector stores](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
client.Admin.Organization.Usage.VectorStores(ctx, query) (\*[AdminOrganizationUsageVectorStoresResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageVectorStoresResponse > (schema)>), error)
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/costs)
client.Admin.Organization.Usage.Costs(ctx, query) (\*[AdminOrganizationUsageCostsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema)>), error)
GET/organization/costs
#### AdminOrganizationInvites
##### [List invites](/api/reference/go/resources/admin/subresources/organization/subresources/invites/methods/list)
client.Admin.Organization.Invites.List(ctx, query) (\*ConversationCursorPage[[Invite](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>)], error)
GET/organization/invites
##### [Create invite](/api/reference/go/resources/admin/subresources/organization/subresources/invites/methods/create)
client.Admin.Organization.Invites.New(ctx, body) (\*[Invite](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>), error)
POST/organization/invites
##### [Retrieve invite](/api/reference/go/resources/admin/subresources/organization/subresources/invites/methods/retrieve)
client.Admin.Organization.Invites.Get(ctx, inviteID) (\*[Invite](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>), error)
GET/organization/invites/{invite\_id}
##### [Delete invite](/api/reference/go/resources/admin/subresources/organization/subresources/invites/methods/delete)
client.Admin.Organization.Invites.Delete(ctx, inviteID) (\*[AdminOrganizationInviteDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema)>), error)
DELETE/organization/invites/{invite\_id}
##### ModelsExpand Collapse
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
#### AdminOrganizationUsers
##### [List users](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/list)
client.Admin.Organization.Users.List(ctx, query) (\*ConversationCursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/users
##### [Retrieve user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/retrieve)
client.Admin.Organization.Users.Get(ctx, userID) (\*[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>), error)
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/update)
client.Admin.Organization.Users.Update(ctx, userID, body) (\*[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>), error)
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/delete)
client.Admin.Organization.Users.Delete(ctx, userID) (\*[AdminOrganizationUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
type OrganizationUser struct{…}
Represents an individual `user` within an organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
Object OrganizationUser
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role OrganizationUserRole
`owner` or `reader`
One of the following:
const OrganizationUserRoleOwner OrganizationUserRole = "owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
const OrganizationUserRoleReader OrganizationUserRole = "reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
#### AdminOrganizationUsersRoles
##### [List user organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Users.Roles.List(ctx, userID, query) (\*CursorPage[[AdminOrganizationUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleListResponse > (schema)>)], error)
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Users.Roles.New(ctx, userID, body) (\*[AdminOrganizationUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema)>), error)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Users.Roles.Delete(ctx, userID, roleID) (\*[AdminOrganizationUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}/roles/{role\_id}
#### AdminOrganizationGroups
##### [List groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/list)
client.Admin.Organization.Groups.List(ctx, query) (\*CursorPage[[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)], error)
GET/organization/groups
##### [Create group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/create)
client.Admin.Organization.Groups.New(ctx, body) (\*[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>), error)
POST/organization/groups
##### [Update group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/update)
client.Admin.Organization.Groups.Update(ctx, groupID, body) (\*[AdminOrganizationGroupUpdateResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema)>), error)
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/delete)
client.Admin.Organization.Groups.Delete(ctx, groupID) (\*[AdminOrganizationGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
type Group struct{…}
Details about an organization group.
ID string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
IsScimManaged bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
Name string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
#### AdminOrganizationGroupsUsers
##### [List group users](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
client.Admin.Organization.Groups.Users.List(ctx, groupID, query) (\*CursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
client.Admin.Organization.Groups.Users.New(ctx, groupID, body) (\*[AdminOrganizationGroupUserNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
client.Admin.Organization.Groups.Users.Delete(ctx, groupID, userID) (\*[AdminOrganizationGroupUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/users/{user\_id}
#### AdminOrganizationGroupsRoles
##### [List group organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Groups.Roles.List(ctx, groupID, query) (\*CursorPage[[AdminOrganizationGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema)>)], error)
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Groups.Roles.New(ctx, groupID, body) (\*[AdminOrganizationGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Groups.Roles.Delete(ctx, groupID, roleID) (\*[AdminOrganizationGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
#### AdminOrganizationRoles
##### [List organization roles](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/list)
client.Admin.Organization.Roles.List(ctx, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/organization/roles
##### [Create organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/create)
client.Admin.Organization.Roles.New(ctx, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/organization/roles
##### [Update organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/update)
client.Admin.Organization.Roles.Update(ctx, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/delete)
client.Admin.Organization.Roles.Delete(ctx, roleID) (\*[AdminOrganizationRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema)>), error)
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
type Role struct{…}
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
#### AdminOrganizationCertificates
##### [List organization certificates](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/list)
client.Admin.Organization.Certificates.List(ctx, query) (\*ConversationCursorPage[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
GET/organization/certificates
##### [Upload certificate](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/create)
client.Admin.Organization.Certificates.New(ctx, body) (\*[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>), error)
POST/organization/certificates
##### [Get certificate](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
client.Admin.Organization.Certificates.Get(ctx, certificateID, query) (\*[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>), error)
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/update)
client.Admin.Organization.Certificates.Update(ctx, certificateID, body) (\*[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>), error)
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/delete)
client.Admin.Organization.Certificates.Delete(ctx, certificateID) (\*[AdminOrganizationCertificateDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) AdminOrganizationCertificateDeleteResponse > (schema)>), error)
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/activate)
client.Admin.Organization.Certificates.Activate(ctx, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/go/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
client.Admin.Organization.Certificates.Deactivate(ctx, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
type Certificate struct{…}
Represents an individual `certificate` uploaded to the organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
CertificateDetails CertificateCertificateDetails
Content stringOptional
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
ValidAt int64Optional
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
CreatedAt int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
Name string
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
Object CertificateObject
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
const CertificateObjectCertificate CertificateObject = "certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
const CertificateObjectOrganizationCertificate CertificateObject = "organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
const CertificateObjectOrganizationProjectCertificate CertificateObject = "organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
Active boolOptional
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
#### AdminOrganizationProjects
##### [List projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/list)
client.Admin.Organization.Projects.List(ctx, query) (\*ConversationCursorPage[[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)], error)
GET/organization/projects
##### [Create project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create)
client.Admin.Organization.Projects.New(ctx, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects
##### [Retrieve project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
client.Admin.Organization.Projects.Get(ctx, projectID) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/update)
client.Admin.Organization.Projects.Update(ctx, projectID, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/archive)
client.Admin.Organization.Projects.Archive(ctx, projectID) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
type Project struct{…}
Represents an individual project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
Name string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
Object OrganizationProject
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status ProjectStatus
`active` or `archived`
One of the following:
const ProjectStatusActive ProjectStatus = "active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
const ProjectStatusArchived ProjectStatus = "archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
ArchivedAt int64Optional
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### AdminOrganizationProjectsUsers
##### [List project users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
client.Admin.Organization.Projects.Users.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)], error)
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
client.Admin.Organization.Projects.Users.New(ctx, projectID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
client.Admin.Organization.Projects.Users.Get(ctx, projectID, userID) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
client.Admin.Organization.Projects.Users.Update(ctx, projectID, userID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
client.Admin.Organization.Projects.Users.Delete(ctx, projectID, userID) (\*[AdminOrganizationProjectUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
type ProjectUser struct{…}
Represents an individual user in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
Object OrganizationProjectUser
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role ProjectUserRole
`owner` or `member`
One of the following:
const ProjectUserRoleOwner ProjectUserRole = "owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
const ProjectUserRoleMember ProjectUserRole = "member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
#### AdminOrganizationProjectsUsersRoles
##### [List project user role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Projects.Users.Roles.List(ctx, projectID, userID, query) (\*CursorPage[[AdminOrganizationProjectUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Projects.Users.Roles.New(ctx, projectID, userID, body) (\*[AdminOrganizationProjectUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Users.Roles.Delete(ctx, projectID, userID, roleID) (\*[AdminOrganizationProjectUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
#### AdminOrganizationProjectsService Accounts
##### [List project service accounts](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
client.Admin.Organization.Projects.ServiceAccounts.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)], error)
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
client.Admin.Organization.Projects.ServiceAccounts.New(ctx, projectID, body) (\*[AdminOrganizationProjectServiceAccountNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema)>), error)
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
client.Admin.Organization.Projects.ServiceAccounts.Get(ctx, projectID, serviceAccountID) (\*[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>), error)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
client.Admin.Organization.Projects.ServiceAccounts.Delete(ctx, projectID, serviceAccountID) (\*[AdminOrganizationProjectServiceAccountDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
type ProjectServiceAccount struct{…}
Represents an individual service account in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
Name string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role ProjectServiceAccountRole
`owner` or `member`
One of the following:
const ProjectServiceAccountRoleOwner ProjectServiceAccountRole = "owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
const ProjectServiceAccountRoleMember ProjectServiceAccountRole = "member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
#### AdminOrganizationProjectsAPI Keys
##### [List project API keys](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
client.Admin.Organization.Projects.APIKeys.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)], error)
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
client.Admin.Organization.Projects.APIKeys.Get(ctx, projectID, keyID) (\*[ProjectAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>), error)
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
client.Admin.Organization.Projects.APIKeys.Delete(ctx, projectID, keyID) (\*[AdminOrganizationProjectAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
type ProjectAPIKey struct{…}
Represents an individual API key in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
LastUsedAt int64
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
Name string
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
Object OrganizationProjectAPIKey
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner ProjectAPIKeyOwner
ServiceAccount [ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)Optional
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Type stringOptional
`user` or `service\_account`
One of the following:
const ProjectAPIKeyOwnerTypeUser ProjectAPIKeyOwnerType = "user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
const ProjectAPIKeyOwnerTypeServiceAccount ProjectAPIKeyOwnerType = "service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
User [ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)Optional
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
RedactedValue string
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
#### AdminOrganizationProjectsRate Limits
##### [List project rate limits](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
client.Admin.Organization.Projects.RateLimits.ListRateLimits(ctx, projectID, query) (\*ConversationCursorPage[[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)], error)
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
client.Admin.Organization.Projects.RateLimits.UpdateRateLimit(ctx, projectID, rateLimitID, body) (\*[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>), error)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
type ProjectRateLimit struct{…}
Represents a project rate limit config.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
MaxRequestsPer1Minute int64
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
MaxTokensPer1Minute int64
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
Model string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
Object ProjectRateLimit
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Batch1DayMaxInputTokens int64Optional
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
MaxAudioMegabytesPer1Minute int64Optional
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
MaxImagesPer1Minute int64Optional
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
MaxRequestsPer1Day int64Optional
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### AdminOrganizationProjectsGroups
##### [List project groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
client.Admin.Organization.Projects.Groups.List(ctx, projectID, query) (\*CursorPage[[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)], error)
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
client.Admin.Organization.Projects.Groups.New(ctx, projectID, body) (\*[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>), error)
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
client.Admin.Organization.Projects.Groups.Delete(ctx, projectID, groupID) (\*[AdminOrganizationProjectGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
type ProjectGroup struct{…}
Details about a group’s membership in a project.
CreatedAt int64
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
GroupID string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
GroupName string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
Object ProjectGroup
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
ProjectID string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
#### AdminOrganizationProjectsGroupsRoles
##### [List project group role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Projects.Groups.Roles.List(ctx, projectID, groupID, query) (\*CursorPage[[AdminOrganizationProjectGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Projects.Groups.Roles.New(ctx, projectID, groupID, body) (\*[AdminOrganizationProjectGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Groups.Roles.Delete(ctx, projectID, groupID, roleID) (\*[AdminOrganizationProjectGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
#### AdminOrganizationProjectsRoles
##### [List project roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.Admin.Organization.Projects.Roles.List(ctx, projectID, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.Admin.Organization.Projects.Roles.New(ctx, projectID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.Admin.Organization.Projects.Roles.Update(ctx, projectID, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Roles.Delete(ctx, projectID, roleID) (\*[AdminOrganizationProjectRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/roles/{role\_id}
#### AdminOrganizationProjectsCertificates
##### [List project certificates](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.Admin.Organization.Projects.Certificates.List(ctx, projectID, query) (\*ConversationCursorPage[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.Admin.Organization.Projects.Certificates.Activate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.Admin.Organization.Projects.Certificates.Deactivate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/deactivate