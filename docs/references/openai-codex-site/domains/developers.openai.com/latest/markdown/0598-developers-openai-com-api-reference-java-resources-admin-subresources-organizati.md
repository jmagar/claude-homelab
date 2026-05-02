Organization | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Organization
#### OrganizationAudit Logs
List user actions and configuration changes within this organization.
##### [List audit logs](/api/reference/java/resources/admin/subresources/organization/subresources/audit_logs/methods/list)
AuditLogListPage admin().organization().auditLogs().list(AuditLogListParamsparams = AuditLogListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/audit\_logs
#### OrganizationAdmin API Keys
##### [List all organization and project API keys.](/api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
AdminApiKeyListPage admin().organization().adminApiKeys().list(AdminApiKeyListParamsparams = AdminApiKeyListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
[AdminApiKey](</api/reference/java/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) admin().organization().adminApiKeys().create(AdminApiKeyCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
[AdminApiKey](</api/reference/java/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) admin().organization().adminApiKeys().retrieve(AdminApiKeyRetrieveParamsparams = AdminApiKeyRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
[AdminApiKeyDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema)>) admin().organization().adminApiKeys().delete(AdminApiKeyDeleteParamsparams = AdminApiKeyDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
class AdminApiKey:
Represents an individual Admin API key in an org.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
Optional\<Long\> lastUsedAt
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
String name
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
String object\_
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
Owner owner
Optional\<String\> id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
Optional\<Long\> createdAt
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
Optional\<String\> name
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
Optional\<String\> object\_
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
Optional\<String\> role
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
Optional\<String\> type
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
String redactedValue
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
Optional\<String\> value
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
#### OrganizationUsage
##### [Audio speeches](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
[UsageAudioSpeechesResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageAudioSpeechesResponse > (schema)>) admin().organization().usage().audioSpeeches(UsageAudioSpeechesParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
[UsageAudioTranscriptionsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageAudioTranscriptionsResponse > (schema)>) admin().organization().usage().audioTranscriptions(UsageAudioTranscriptionsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
[UsageCodeInterpreterSessionsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageCodeInterpreterSessionsResponse > (schema)>) admin().organization().usage().codeInterpreterSessions(UsageCodeInterpreterSessionsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/completions)
[UsageCompletionsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageCompletionsResponse > (schema)>) admin().organization().usage().completions(UsageCompletionsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/completions
##### [Embeddings](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
[UsageEmbeddingsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageEmbeddingsResponse > (schema)>) admin().organization().usage().embeddings(UsageEmbeddingsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/embeddings
##### [Images](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/images)
[UsageImagesResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageImagesResponse > (schema)>) admin().organization().usage().images(UsageImagesParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/images
##### [Moderations](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/moderations)
[UsageModerationsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageModerationsResponse > (schema)>) admin().organization().usage().moderations(UsageModerationsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/moderations
##### [Vector stores](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
[UsageVectorStoresResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageVectorStoresResponse > (schema)>) admin().organization().usage().vectorStores(UsageVectorStoresParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/costs)
[UsageCostsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema)>) admin().organization().usage().costs(UsageCostsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/costs
#### OrganizationInvites
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
#### OrganizationUsers
##### [List users](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/list)
UserListPage admin().organization().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users
##### [Retrieve user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/retrieve)
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) admin().organization().users().retrieve(UserRetrieveParamsparams = UserRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/update)
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) admin().organization().users().update(UserUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) UserDeleteResponse > (schema)>) admin().organization().users().delete(UserDeleteParamsparams = UserDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
class OrganizationUser:
Represents an individual `user` within an organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
JsonValue; object\_ "organization.user"constant"organization.user"constant
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
#### OrganizationUsersRoles
##### [List user organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().users().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}/roles/{role\_id}
#### OrganizationGroups
##### [List groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/list)
GroupListPage admin().organization().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups
##### [Create group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/create)
[Group](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) admin().organization().groups().create(GroupCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups
##### [Update group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/update)
[GroupUpdateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema)>) admin().organization().groups().update(GroupUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/delete)
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().groups().delete(GroupDeleteParamsparams = GroupDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
class Group:
Details about an organization group.
String id
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
boolean isScimManaged
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
String name
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
#### OrganizationGroupsUsers
##### [List group users](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
UserListPage admin().organization().groups().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
[UserCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema)>) admin().organization().groups().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema)>) admin().organization().groups().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/users/{user\_id}
#### OrganizationGroupsRoles
##### [List group organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().groups().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/roles/{role\_id}
#### OrganizationRoles
##### [List organization roles](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/list)
RoleListPage admin().organization().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/roles
##### [Create organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/create)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/roles
##### [Update organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/update)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().roles().update(RoleUpdateParamsparams = RoleUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/java/resources/admin/subresources/organization/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().roles().delete(RoleDeleteParamsparams = RoleDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
class Role:
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
#### OrganizationCertificates
##### [List organization certificates](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/list)
CertificateListPage admin().organization().certificates().list(CertificateListParamsparams = CertificateListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/certificates
##### [Upload certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/create)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().create(CertificateCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates
##### [Get certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().retrieve(CertificateRetrieveParamsparams = CertificateRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/update)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().update(CertificateUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/delete)
[CertificateDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema)>) admin().organization().certificates().delete(CertificateDeleteParamsparams = CertificateDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/activate)
CertificateActivatePage admin().organization().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
CertificateDeactivatePage admin().organization().certificates().deactivate(CertificateDeactivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
class Certificate:
Represents an individual `certificate` uploaded to the organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
CertificateDetails certificateDetails
Optional\<String\> content
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
Optional\<Long\> validAt
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
long createdAt
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
String name
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
Object object\_
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
CERTIFICATE("certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
ORGANIZATION\_CERTIFICATE("organization.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
ORGANIZATION\_PROJECT\_CERTIFICATE("organization.project.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
Optional\<Boolean\> active
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
#### OrganizationProjects
##### [List projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/list)
ProjectListPage admin().organization().projects().list(ProjectListParamsparams = ProjectListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects
##### [Create project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/create)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().create(ProjectCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects
##### [Retrieve project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().retrieve(ProjectRetrieveParamsparams = ProjectRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/update)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().update(ProjectUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/archive)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().archive(ProjectArchiveParamsparams = ProjectArchiveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
class Project:
Represents an individual project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
String name
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
JsonValue; object\_ "organization.project"constant"organization.project"constant
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status status
`active` or `archived`
One of the following:
ACTIVE("active")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
ARCHIVED("archived")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
Optional\<Long\> archivedAt
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### OrganizationProjectsUsers
##### [List project users](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
UserListPage admin().organization().projects().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().retrieve(UserRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().update(UserUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema)>) admin().organization().projects().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser:
Represents an individual user in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
JsonValue; object\_ "organization.project.user"constant"organization.project.user"constant
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
#### OrganizationProjectsUsersRoles
##### [List project user role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().projects().users().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
#### OrganizationProjectsService Accounts
##### [List project service accounts](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
ServiceAccountListPage admin().organization().projects().serviceAccounts().list(ServiceAccountListParamsparams = ServiceAccountListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
[ServiceAccountCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema)>) admin().organization().projects().serviceAccounts().create(ServiceAccountCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) admin().organization().projects().serviceAccounts().retrieve(ServiceAccountRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
[ServiceAccountDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema)>) admin().organization().projects().serviceAccounts().delete(ServiceAccountDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
class ProjectServiceAccount:
Represents an individual service account in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
String name
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
JsonValue; object\_ "organization.project.service\_account"constant"organization.project.service\_account"constant
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
#### OrganizationProjectsAPI Keys
##### [List project API keys](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
ApiKeyListPage admin().organization().projects().apiKeys().list(ApiKeyListParamsparams = ApiKeyListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
[ProjectApiKey](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) admin().organization().projects().apiKeys().retrieve(ApiKeyRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
[ApiKeyDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema)>) admin().organization().projects().apiKeys().delete(ApiKeyDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
class ProjectApiKey:
Represents an individual API key in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
long lastUsedAt
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
String name
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
JsonValue; object\_ "organization.project.api\_key"constant"organization.project.api\_key"constant
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner owner
Optional\<[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)\> serviceAccount
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Optional\<Type\> type
`user` or `service\_account`
One of the following:
USER("user")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
SERVICE\_ACCOUNT("service\_account")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
Optional\<[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)\> user
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
String redactedValue
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
#### OrganizationProjectsRate Limits
##### [List project rate limits](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
RateLimitListRateLimitsPage admin().organization().projects().rateLimits().listRateLimits(RateLimitListRateLimitsParamsparams = RateLimitListRateLimitsParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
[ProjectRateLimit](</api/reference/java/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) admin().organization().projects().rateLimits().updateRateLimit(RateLimitUpdateRateLimitParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
class ProjectRateLimit:
Represents a project rate limit config.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
long maxRequestsPer1Minute
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
long maxTokensPer1Minute
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
String model
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
JsonValue; object\_ "project.rate\_limit"constant"project.rate\_limit"constant
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Optional\<Long\> batch1DayMaxInputTokens
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
Optional\<Long\> maxAudioMegabytesPer1Minute
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
Optional\<Long\> maxImagesPer1Minute
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
Optional\<Long\> maxRequestsPer1Day
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### OrganizationProjectsGroups
##### [List project groups](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
GroupListPage admin().organization().projects().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
[ProjectGroup](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) admin().organization().projects().groups().create(GroupCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().projects().groups().delete(GroupDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup:
Details about a group’s membership in a project.
long createdAt
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
String groupId
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
String groupName
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
JsonValue; object\_ "project.group"constant"project.group"constant
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
String projectId
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
#### OrganizationProjectsGroupsRoles
##### [List project group role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().projects().groups().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
#### OrganizationProjectsRoles
##### [List project roles](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
RoleListPage admin().organization().projects().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().update(RoleUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/roles/{role\_id}
#### OrganizationProjectsCertificates
##### [List project certificates](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
CertificateListPage admin().organization().projects().certificates().list(CertificateListParamsparams = CertificateListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
CertificateActivatePage admin().organization().projects().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
CertificateDeactivatePage admin().organization().projects().certificates().deactivate(CertificateDeactivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/deactivate