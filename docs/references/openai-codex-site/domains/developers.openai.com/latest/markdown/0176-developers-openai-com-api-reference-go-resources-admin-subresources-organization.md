List audit logs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Audit Logs](/api/reference/go/resources/admin/subresources/organization/subresources/audit_logs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List audit logs
client.Admin.Organization.AuditLogs.List(ctx, query) (\*ConversationCursorPage[[AdminOrganizationAuditLogListResponse](</api/reference/go/resources/admin#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema)>)], error)
GET/organization/audit\_logs
List user actions and configuration changes within this organization.
##### ParametersExpand Collapse
query AdminOrganizationAuditLogListParams
ActorEmails param.Field[[]string]Optional
Return only events performed by users with these emails.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) actor_emails>)
ActorIDs param.Field[[]string]Optional
Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) actor_ids>)
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) after>)
Before param.Field[string]Optional
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) before>)
EffectiveAt param.Field[[AdminOrganizationAuditLogListParamsEffectiveAt](</api/reference/go/resources/admin/subresources/organization/subresources/audit_logs/methods/list#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema)>)]Optional
Return only events whose `effective\_at` (Unix seconds) is in this range.
Gt int64Optional
Return only events whose `effective\_at` (Unix seconds) is greater than this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) gt>)
Gte int64Optional
Return only events whose `effective\_at` (Unix seconds) is greater than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) gte>)
Lt int64Optional
Return only events whose `effective\_at` (Unix seconds) is less than this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) lt>)
Lte int64Optional
Return only events whose `effective\_at` (Unix seconds) is less than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) lte>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at>)
EventTypes param.Field[[]string]Optional
Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](https://platform.openai.com/docs/api-reference/audit-logs/object).
const AdminOrganizationAuditLogListParamsEventTypeAPIKeyCreated AdminOrganizationAuditLogListParamsEventType = "api\_key.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 0>)
const AdminOrganizationAuditLogListParamsEventTypeAPIKeyUpdated AdminOrganizationAuditLogListParamsEventType = "api\_key.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 1>)
const AdminOrganizationAuditLogListParamsEventTypeAPIKeyDeleted AdminOrganizationAuditLogListParamsEventType = "api\_key.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 2>)
const AdminOrganizationAuditLogListParamsEventTypeCertificateCreated AdminOrganizationAuditLogListParamsEventType = "certificate.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 3>)
const AdminOrganizationAuditLogListParamsEventTypeCertificateUpdated AdminOrganizationAuditLogListParamsEventType = "certificate.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 4>)
const AdminOrganizationAuditLogListParamsEventTypeCertificateDeleted AdminOrganizationAuditLogListParamsEventType = "certificate.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 5>)
const AdminOrganizationAuditLogListParamsEventTypeCertificatesActivated AdminOrganizationAuditLogListParamsEventType = "certificates.activated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 6>)
const AdminOrganizationAuditLogListParamsEventTypeCertificatesDeactivated AdminOrganizationAuditLogListParamsEventType = "certificates.deactivated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 7>)
const AdminOrganizationAuditLogListParamsEventTypeCheckpointPermissionCreated AdminOrganizationAuditLogListParamsEventType = "checkpoint.permission.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 8>)
const AdminOrganizationAuditLogListParamsEventTypeCheckpointPermissionDeleted AdminOrganizationAuditLogListParamsEventType = "checkpoint.permission.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 9>)
const AdminOrganizationAuditLogListParamsEventTypeExternalKeyRegistered AdminOrganizationAuditLogListParamsEventType = "external\_key.registered"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 10>)
const AdminOrganizationAuditLogListParamsEventTypeExternalKeyRemoved AdminOrganizationAuditLogListParamsEventType = "external\_key.removed"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 11>)
const AdminOrganizationAuditLogListParamsEventTypeGroupCreated AdminOrganizationAuditLogListParamsEventType = "group.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 12>)
const AdminOrganizationAuditLogListParamsEventTypeGroupUpdated AdminOrganizationAuditLogListParamsEventType = "group.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 13>)
const AdminOrganizationAuditLogListParamsEventTypeGroupDeleted AdminOrganizationAuditLogListParamsEventType = "group.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 14>)
const AdminOrganizationAuditLogListParamsEventTypeInviteSent AdminOrganizationAuditLogListParamsEventType = "invite.sent"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 15>)
const AdminOrganizationAuditLogListParamsEventTypeInviteAccepted AdminOrganizationAuditLogListParamsEventType = "invite.accepted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 16>)
const AdminOrganizationAuditLogListParamsEventTypeInviteDeleted AdminOrganizationAuditLogListParamsEventType = "invite.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 17>)
const AdminOrganizationAuditLogListParamsEventTypeIPAllowlistCreated AdminOrganizationAuditLogListParamsEventType = "ip\_allowlist.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 18>)
const AdminOrganizationAuditLogListParamsEventTypeIPAllowlistUpdated AdminOrganizationAuditLogListParamsEventType = "ip\_allowlist.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 19>)
const AdminOrganizationAuditLogListParamsEventTypeIPAllowlistDeleted AdminOrganizationAuditLogListParamsEventType = "ip\_allowlist.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 20>)
const AdminOrganizationAuditLogListParamsEventTypeIPAllowlistConfigActivated AdminOrganizationAuditLogListParamsEventType = "ip\_allowlist.config.activated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 21>)
const AdminOrganizationAuditLogListParamsEventTypeIPAllowlistConfigDeactivated AdminOrganizationAuditLogListParamsEventType = "ip\_allowlist.config.deactivated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 22>)
const AdminOrganizationAuditLogListParamsEventTypeLoginSucceeded AdminOrganizationAuditLogListParamsEventType = "login.succeeded"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 23>)
const AdminOrganizationAuditLogListParamsEventTypeLoginFailed AdminOrganizationAuditLogListParamsEventType = "login.failed"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 24>)
const AdminOrganizationAuditLogListParamsEventTypeLogoutSucceeded AdminOrganizationAuditLogListParamsEventType = "logout.succeeded"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 25>)
const AdminOrganizationAuditLogListParamsEventTypeLogoutFailed AdminOrganizationAuditLogListParamsEventType = "logout.failed"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 26>)
const AdminOrganizationAuditLogListParamsEventTypeOrganizationUpdated AdminOrganizationAuditLogListParamsEventType = "organization.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 27>)
const AdminOrganizationAuditLogListParamsEventTypeProjectCreated AdminOrganizationAuditLogListParamsEventType = "project.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 28>)
const AdminOrganizationAuditLogListParamsEventTypeProjectUpdated AdminOrganizationAuditLogListParamsEventType = "project.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 29>)
const AdminOrganizationAuditLogListParamsEventTypeProjectArchived AdminOrganizationAuditLogListParamsEventType = "project.archived"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 30>)
const AdminOrganizationAuditLogListParamsEventTypeProjectDeleted AdminOrganizationAuditLogListParamsEventType = "project.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 31>)
const AdminOrganizationAuditLogListParamsEventTypeRateLimitUpdated AdminOrganizationAuditLogListParamsEventType = "rate\_limit.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 32>)
const AdminOrganizationAuditLogListParamsEventTypeRateLimitDeleted AdminOrganizationAuditLogListParamsEventType = "rate\_limit.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 33>)
const AdminOrganizationAuditLogListParamsEventTypeResourceDeleted AdminOrganizationAuditLogListParamsEventType = "resource.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 34>)
const AdminOrganizationAuditLogListParamsEventTypeTunnelCreated AdminOrganizationAuditLogListParamsEventType = "tunnel.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 35>)
const AdminOrganizationAuditLogListParamsEventTypeTunnelUpdated AdminOrganizationAuditLogListParamsEventType = "tunnel.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 36>)
const AdminOrganizationAuditLogListParamsEventTypeTunnelDeleted AdminOrganizationAuditLogListParamsEventType = "tunnel.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 37>)
const AdminOrganizationAuditLogListParamsEventTypeRoleCreated AdminOrganizationAuditLogListParamsEventType = "role.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 38>)
const AdminOrganizationAuditLogListParamsEventTypeRoleUpdated AdminOrganizationAuditLogListParamsEventType = "role.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 39>)
const AdminOrganizationAuditLogListParamsEventTypeRoleDeleted AdminOrganizationAuditLogListParamsEventType = "role.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 40>)
const AdminOrganizationAuditLogListParamsEventTypeRoleAssignmentCreated AdminOrganizationAuditLogListParamsEventType = "role.assignment.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 41>)
const AdminOrganizationAuditLogListParamsEventTypeRoleAssignmentDeleted AdminOrganizationAuditLogListParamsEventType = "role.assignment.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 42>)
const AdminOrganizationAuditLogListParamsEventTypeScimEnabled AdminOrganizationAuditLogListParamsEventType = "scim.enabled"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 43>)
const AdminOrganizationAuditLogListParamsEventTypeScimDisabled AdminOrganizationAuditLogListParamsEventType = "scim.disabled"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 44>)
const AdminOrganizationAuditLogListParamsEventTypeServiceAccountCreated AdminOrganizationAuditLogListParamsEventType = "service\_account.created"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 45>)
const AdminOrganizationAuditLogListParamsEventTypeServiceAccountUpdated AdminOrganizationAuditLogListParamsEventType = "service\_account.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 46>)
const AdminOrganizationAuditLogListParamsEventTypeServiceAccountDeleted AdminOrganizationAuditLogListParamsEventType = "service\_account.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 47>)
const AdminOrganizationAuditLogListParamsEventTypeUserAdded AdminOrganizationAuditLogListParamsEventType = "user.added"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 48>)
const AdminOrganizationAuditLogListParamsEventTypeUserUpdated AdminOrganizationAuditLogListParamsEventType = "user.updated"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 49>)
const AdminOrganizationAuditLogListParamsEventTypeUserDeleted AdminOrganizationAuditLogListParamsEventType = "user.deleted"
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 50>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) limit>)
ProjectIDs param.Field[[]string]Optional
Return only events for these projects.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) project_ids>)
ResourceIDs param.Field[[]string]Optional
Return only events performed on these targets. For example, a project ID updated.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) resource_ids>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationAuditLogListResponse struct{…}
A log of a user action or configuration change within this organization.
ID string
The ID of this log.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) id>)
Actor AdminOrganizationAuditLogListResponseActor
The actor who performed the audit logged action.
APIKey AdminOrganizationAuditLogListResponseActorAPIKeyOptional
The API Key used to perform the audit logged action.
ID stringOptional
The tracking id of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) id>)
ServiceAccount AdminOrganizationAuditLogListResponseActorAPIKeyServiceAccountOptional
The service account that performed the audit logged action.
ID stringOptional
The service account id.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) service_account > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) service_account>)
Type stringOptional
The type of API key. Can be either `user` or `service\_account`.
One of the following:
const AdminOrganizationAuditLogListResponseActorAPIKeyTypeUser AdminOrganizationAuditLogListResponseActorAPIKeyType = "user"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type > (member) 0>)
const AdminOrganizationAuditLogListResponseActorAPIKeyTypeServiceAccount AdminOrganizationAuditLogListResponseActorAPIKeyType = "service\_account"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type>)
User AdminOrganizationAuditLogListResponseActorAPIKeyUserOptional
The user who performed the audit logged action.
ID stringOptional
The user id.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user > (property) id>)
Email stringOptional
The user email.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) api_key>)
Session AdminOrganizationAuditLogListResponseActorSessionOptional
The session in which the audit logged action was performed.
IPAddress stringOptional
The IP address from which the action was performed.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) session > (property) ip_address>)
User AdminOrganizationAuditLogListResponseActorSessionUserOptional
The user who performed the audit logged action.
ID stringOptional
The user id.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) session > (property) user > (property) id>)
Email stringOptional
The user email.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) session > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) session > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) session>)
Type stringOptional
The type of actor. Is either `session` or `api\_key`.
One of the following:
const AdminOrganizationAuditLogListResponseActorTypeSession AdminOrganizationAuditLogListResponseActorType = "session"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) type > (member) 0>)
const AdminOrganizationAuditLogListResponseActorTypeAPIKey AdminOrganizationAuditLogListResponseActorType = "api\_key"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor > (property) type>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) actor>)
EffectiveAt int64
The Unix timestamp (in seconds) of the event.
formatunixtime
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) effective_at>)
Type AdminOrganizationAuditLogListResponseType
The event type.
One of the following:
const AdminOrganizationAuditLogListResponseTypeAPIKeyCreated AdminOrganizationAuditLogListResponseType = "api\_key.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 0>)
const AdminOrganizationAuditLogListResponseTypeAPIKeyUpdated AdminOrganizationAuditLogListResponseType = "api\_key.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 1>)
const AdminOrganizationAuditLogListResponseTypeAPIKeyDeleted AdminOrganizationAuditLogListResponseType = "api\_key.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 2>)
const AdminOrganizationAuditLogListResponseTypeCertificateCreated AdminOrganizationAuditLogListResponseType = "certificate.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 3>)
const AdminOrganizationAuditLogListResponseTypeCertificateUpdated AdminOrganizationAuditLogListResponseType = "certificate.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 4>)
const AdminOrganizationAuditLogListResponseTypeCertificateDeleted AdminOrganizationAuditLogListResponseType = "certificate.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 5>)
const AdminOrganizationAuditLogListResponseTypeCertificatesActivated AdminOrganizationAuditLogListResponseType = "certificates.activated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 6>)
const AdminOrganizationAuditLogListResponseTypeCertificatesDeactivated AdminOrganizationAuditLogListResponseType = "certificates.deactivated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 7>)
const AdminOrganizationAuditLogListResponseTypeCheckpointPermissionCreated AdminOrganizationAuditLogListResponseType = "checkpoint.permission.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 8>)
const AdminOrganizationAuditLogListResponseTypeCheckpointPermissionDeleted AdminOrganizationAuditLogListResponseType = "checkpoint.permission.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 9>)
const AdminOrganizationAuditLogListResponseTypeExternalKeyRegistered AdminOrganizationAuditLogListResponseType = "external\_key.registered"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 10>)
const AdminOrganizationAuditLogListResponseTypeExternalKeyRemoved AdminOrganizationAuditLogListResponseType = "external\_key.removed"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 11>)
const AdminOrganizationAuditLogListResponseTypeGroupCreated AdminOrganizationAuditLogListResponseType = "group.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 12>)
const AdminOrganizationAuditLogListResponseTypeGroupUpdated AdminOrganizationAuditLogListResponseType = "group.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 13>)
const AdminOrganizationAuditLogListResponseTypeGroupDeleted AdminOrganizationAuditLogListResponseType = "group.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 14>)
const AdminOrganizationAuditLogListResponseTypeInviteSent AdminOrganizationAuditLogListResponseType = "invite.sent"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 15>)
const AdminOrganizationAuditLogListResponseTypeInviteAccepted AdminOrganizationAuditLogListResponseType = "invite.accepted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 16>)
const AdminOrganizationAuditLogListResponseTypeInviteDeleted AdminOrganizationAuditLogListResponseType = "invite.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 17>)
const AdminOrganizationAuditLogListResponseTypeIPAllowlistCreated AdminOrganizationAuditLogListResponseType = "ip\_allowlist.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 18>)
const AdminOrganizationAuditLogListResponseTypeIPAllowlistUpdated AdminOrganizationAuditLogListResponseType = "ip\_allowlist.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 19>)
const AdminOrganizationAuditLogListResponseTypeIPAllowlistDeleted AdminOrganizationAuditLogListResponseType = "ip\_allowlist.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 20>)
const AdminOrganizationAuditLogListResponseTypeIPAllowlistConfigActivated AdminOrganizationAuditLogListResponseType = "ip\_allowlist.config.activated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 21>)
const AdminOrganizationAuditLogListResponseTypeIPAllowlistConfigDeactivated AdminOrganizationAuditLogListResponseType = "ip\_allowlist.config.deactivated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 22>)
const AdminOrganizationAuditLogListResponseTypeLoginSucceeded AdminOrganizationAuditLogListResponseType = "login.succeeded"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 23>)
const AdminOrganizationAuditLogListResponseTypeLoginFailed AdminOrganizationAuditLogListResponseType = "login.failed"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 24>)
const AdminOrganizationAuditLogListResponseTypeLogoutSucceeded AdminOrganizationAuditLogListResponseType = "logout.succeeded"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 25>)
const AdminOrganizationAuditLogListResponseTypeLogoutFailed AdminOrganizationAuditLogListResponseType = "logout.failed"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 26>)
const AdminOrganizationAuditLogListResponseTypeOrganizationUpdated AdminOrganizationAuditLogListResponseType = "organization.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 27>)
const AdminOrganizationAuditLogListResponseTypeProjectCreated AdminOrganizationAuditLogListResponseType = "project.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 28>)
const AdminOrganizationAuditLogListResponseTypeProjectUpdated AdminOrganizationAuditLogListResponseType = "project.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 29>)
const AdminOrganizationAuditLogListResponseTypeProjectArchived AdminOrganizationAuditLogListResponseType = "project.archived"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 30>)
const AdminOrganizationAuditLogListResponseTypeProjectDeleted AdminOrganizationAuditLogListResponseType = "project.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 31>)
const AdminOrganizationAuditLogListResponseTypeRateLimitUpdated AdminOrganizationAuditLogListResponseType = "rate\_limit.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 32>)
const AdminOrganizationAuditLogListResponseTypeRateLimitDeleted AdminOrganizationAuditLogListResponseType = "rate\_limit.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 33>)
const AdminOrganizationAuditLogListResponseTypeResourceDeleted AdminOrganizationAuditLogListResponseType = "resource.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 34>)
const AdminOrganizationAuditLogListResponseTypeTunnelCreated AdminOrganizationAuditLogListResponseType = "tunnel.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 35>)
const AdminOrganizationAuditLogListResponseTypeTunnelUpdated AdminOrganizationAuditLogListResponseType = "tunnel.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 36>)
const AdminOrganizationAuditLogListResponseTypeTunnelDeleted AdminOrganizationAuditLogListResponseType = "tunnel.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 37>)
const AdminOrganizationAuditLogListResponseTypeRoleCreated AdminOrganizationAuditLogListResponseType = "role.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 38>)
const AdminOrganizationAuditLogListResponseTypeRoleUpdated AdminOrganizationAuditLogListResponseType = "role.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 39>)
const AdminOrganizationAuditLogListResponseTypeRoleDeleted AdminOrganizationAuditLogListResponseType = "role.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 40>)
const AdminOrganizationAuditLogListResponseTypeRoleAssignmentCreated AdminOrganizationAuditLogListResponseType = "role.assignment.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 41>)
const AdminOrganizationAuditLogListResponseTypeRoleAssignmentDeleted AdminOrganizationAuditLogListResponseType = "role.assignment.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 42>)
const AdminOrganizationAuditLogListResponseTypeScimEnabled AdminOrganizationAuditLogListResponseType = "scim.enabled"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 43>)
const AdminOrganizationAuditLogListResponseTypeScimDisabled AdminOrganizationAuditLogListResponseType = "scim.disabled"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 44>)
const AdminOrganizationAuditLogListResponseTypeServiceAccountCreated AdminOrganizationAuditLogListResponseType = "service\_account.created"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 45>)
const AdminOrganizationAuditLogListResponseTypeServiceAccountUpdated AdminOrganizationAuditLogListResponseType = "service\_account.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 46>)
const AdminOrganizationAuditLogListResponseTypeServiceAccountDeleted AdminOrganizationAuditLogListResponseType = "service\_account.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 47>)
const AdminOrganizationAuditLogListResponseTypeUserAdded AdminOrganizationAuditLogListResponseType = "user.added"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 48>)
const AdminOrganizationAuditLogListResponseTypeUserUpdated AdminOrganizationAuditLogListResponseType = "user.updated"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 49>)
const AdminOrganizationAuditLogListResponseTypeUserDeleted AdminOrganizationAuditLogListResponseType = "user.deleted"
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type > (member) 50>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) type>)
APIKeyCreated AdminOrganizationAuditLogListResponseAPIKeyCreatedOptional
The details for events with this `type`.
ID stringOptional
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.created > (property) id>)
Data AdminOrganizationAuditLogListResponseAPIKeyCreatedDataOptional
The payload used to create the API key.
Scopes []stringOptional
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.created > (property) data > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.created>)
APIKeyDeleted AdminOrganizationAuditLogListResponseAPIKeyDeletedOptional
The details for events with this `type`.
ID stringOptional
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.deleted>)
APIKeyUpdated AdminOrganizationAuditLogListResponseAPIKeyUpdatedOptional
The details for events with this `type`.
ID stringOptional
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseAPIKeyUpdatedChangesRequestedOptional
The payload used to update the API key.
Scopes []stringOptional
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.updated > (property) changes_requested > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) api_key.updated>)
CertificateCreated AdminOrganizationAuditLogListResponseCertificateCreatedOptional
The details for events with this `type`.
ID stringOptional
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.created > (property) id>)
Name stringOptional
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.created>)
CertificateDeleted AdminOrganizationAuditLogListResponseCertificateDeletedOptional
The details for events with this `type`.
ID stringOptional
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.deleted > (property) id>)
Certificate stringOptional
The certificate content in PEM format.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.deleted > (property) certificate>)
Name stringOptional
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.deleted>)
CertificateUpdated AdminOrganizationAuditLogListResponseCertificateUpdatedOptional
The details for events with this `type`.
ID stringOptional
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.updated > (property) id>)
Name stringOptional
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.updated > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificate.updated>)
CertificatesActivated AdminOrganizationAuditLogListResponseCertificatesActivatedOptional
The details for events with this `type`.
Certificates []AdminOrganizationAuditLogListResponseCertificatesActivatedCertificateOptional
ID stringOptional
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) id>)
Name stringOptional
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.activated>)
CertificatesDeactivated AdminOrganizationAuditLogListResponseCertificatesDeactivatedOptional
The details for events with this `type`.
Certificates []AdminOrganizationAuditLogListResponseCertificatesDeactivatedCertificateOptional
ID stringOptional
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) id>)
Name stringOptional
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) certificates.deactivated>)
CheckpointPermissionCreated AdminOrganizationAuditLogListResponseCheckpointPermissionCreatedOptional
The project and fine-tuned model checkpoint that the checkpoint permission was created for.
ID stringOptional
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) id>)
Data AdminOrganizationAuditLogListResponseCheckpointPermissionCreatedDataOptional
The payload used to create the checkpoint permission.
FineTunedModelCheckpoint stringOptional
The ID of the fine-tuned model checkpoint.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data > (property) fine_tuned_model_checkpoint>)
ProjectID stringOptional
The ID of the project that the checkpoint permission was created for.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data > (property) project_id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.created>)
CheckpointPermissionDeleted AdminOrganizationAuditLogListResponseCheckpointPermissionDeletedOptional
The details for events with this `type`.
ID stringOptional
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) checkpoint.permission.deleted>)
ExternalKeyRegistered AdminOrganizationAuditLogListResponseExternalKeyRegisteredOptional
The details for events with this `type`.
ID stringOptional
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) external_key.registered > (property) id>)
Data anyOptional
The configuration for the external key.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) external_key.registered > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) external_key.registered>)
ExternalKeyRemoved AdminOrganizationAuditLogListResponseExternalKeyRemovedOptional
The details for events with this `type`.
ID stringOptional
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) external_key.removed > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) external_key.removed>)
GroupCreated AdminOrganizationAuditLogListResponseGroupCreatedOptional
The details for events with this `type`.
ID stringOptional
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.created > (property) id>)
Data AdminOrganizationAuditLogListResponseGroupCreatedDataOptional
Information about the created group.
GroupName stringOptional
The group name.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.created > (property) data > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.created>)
GroupDeleted AdminOrganizationAuditLogListResponseGroupDeletedOptional
The details for events with this `type`.
ID stringOptional
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.deleted>)
GroupUpdated AdminOrganizationAuditLogListResponseGroupUpdatedOptional
The details for events with this `type`.
ID stringOptional
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseGroupUpdatedChangesRequestedOptional
The payload used to update the group.
GroupName stringOptional
The updated group name.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.updated > (property) changes_requested > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) group.updated>)
InviteAccepted AdminOrganizationAuditLogListResponseInviteAcceptedOptional
The details for events with this `type`.
ID stringOptional
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.accepted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.accepted>)
InviteDeleted AdminOrganizationAuditLogListResponseInviteDeletedOptional
The details for events with this `type`.
ID stringOptional
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.deleted>)
InviteSent AdminOrganizationAuditLogListResponseInviteSentOptional
The details for events with this `type`.
ID stringOptional
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.sent > (property) id>)
Data AdminOrganizationAuditLogListResponseInviteSentDataOptional
The payload used to create the invite.
Email stringOptional
The email invited to the organization.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.sent > (property) data > (property) email>)
Role stringOptional
The role the email was invited to be. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.sent > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.sent > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) invite.sent>)
IPAllowlistConfigActivated AdminOrganizationAuditLogListResponseIPAllowlistConfigActivatedOptional
The details for events with this `type`.
Configs []AdminOrganizationAuditLogListResponseIPAllowlistConfigActivatedConfigOptional
The configurations that were activated.
ID stringOptional
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) id>)
Name stringOptional
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.activated>)
IPAllowlistConfigDeactivated AdminOrganizationAuditLogListResponseIPAllowlistConfigDeactivatedOptional
The details for events with this `type`.
Configs []AdminOrganizationAuditLogListResponseIPAllowlistConfigDeactivatedConfigOptional
The configurations that were deactivated.
ID stringOptional
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) id>)
Name stringOptional
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated>)
IPAllowlistCreated AdminOrganizationAuditLogListResponseIPAllowlistCreatedOptional
The details for events with this `type`.
ID stringOptional
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) id>)
AllowedIPs []stringOptional
The IP addresses or CIDR ranges included in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) allowed_ips>)
Name stringOptional
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.created>)
IPAllowlistDeleted AdminOrganizationAuditLogListResponseIPAllowlistDeletedOptional
The details for events with this `type`.
ID stringOptional
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) id>)
AllowedIPs []stringOptional
The IP addresses or CIDR ranges that were in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) allowed_ips>)
Name stringOptional
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.deleted>)
IPAllowlistUpdated AdminOrganizationAuditLogListResponseIPAllowlistUpdatedOptional
The details for events with this `type`.
ID stringOptional
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.updated > (property) id>)
AllowedIPs []stringOptional
The updated set of IP addresses or CIDR ranges in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.updated > (property) allowed_ips>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) ip_allowlist.updated>)
LoginFailed AdminOrganizationAuditLogListResponseLoginFailedOptional
The details for events with this `type`.
ErrorCode stringOptional
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) login.failed > (property) error_code>)
ErrorMessage stringOptional
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) login.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) login.failed>)
LoginSucceeded anyOptional
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) login.succeeded>)
LogoutFailed AdminOrganizationAuditLogListResponseLogoutFailedOptional
The details for events with this `type`.
ErrorCode stringOptional
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) logout.failed > (property) error_code>)
ErrorMessage stringOptional
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) logout.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) logout.failed>)
LogoutSucceeded anyOptional
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) logout.succeeded>)
OrganizationUpdated AdminOrganizationAuditLogListResponseOrganizationUpdatedOptional
The details for events with this `type`.
ID stringOptional
The organization ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseOrganizationUpdatedChangesRequestedOptional
The payload used to update the organization settings.
APICallLogging stringOptional
How your organization logs data from supported API calls. One of `disabled`, `enabled\_per\_call`, `enabled\_for\_all\_projects`, or `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging>)
APICallLoggingProjectIDs stringOptional
The list of project ids if api\_call\_logging is set to `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging_project_ids>)
Description stringOptional
The organization description.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) description>)
Name stringOptional
The organization name.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) name>)
ThreadsUiVisibility stringOptional
Visibility of the threads page which shows messages created with the Assistants API and Playground. One of `ANY\_ROLE`, `OWNERS`, or `NONE`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) threads_ui_visibility>)
Title stringOptional
The organization title.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) title>)
UsageDashboardVisibility stringOptional
Visibility of the usage dashboard which shows activity and costs for your organization. One of `ANY\_ROLE` or `OWNERS`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) usage_dashboard_visibility>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) organization.updated>)
Project AdminOrganizationAuditLogListResponseProjectOptional
The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project > (property) id>)
Name stringOptional
The project title.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project>)
ProjectArchived AdminOrganizationAuditLogListResponseProjectArchivedOptional
The details for events with this `type`.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.archived > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.archived>)
ProjectCreated AdminOrganizationAuditLogListResponseProjectCreatedOptional
The details for events with this `type`.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.created > (property) id>)
Data AdminOrganizationAuditLogListResponseProjectCreatedDataOptional
The payload used to create the project.
Name stringOptional
The project name.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.created > (property) data > (property) name>)
Title stringOptional
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.created > (property) data > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.created>)
ProjectDeleted AdminOrganizationAuditLogListResponseProjectDeletedOptional
The details for events with this `type`.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.deleted>)
ProjectUpdated AdminOrganizationAuditLogListResponseProjectUpdatedOptional
The details for events with this `type`.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseProjectUpdatedChangesRequestedOptional
The payload used to update the project.
Title stringOptional
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.updated > (property) changes_requested > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) project.updated>)
RateLimitDeleted AdminOrganizationAuditLogListResponseRateLimitDeletedOptional
The details for events with this `type`.
ID stringOptional
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.deleted>)
RateLimitUpdated AdminOrganizationAuditLogListResponseRateLimitUpdatedOptional
The details for events with this `type`.
ID stringOptional
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseRateLimitUpdatedChangesRequestedOptional
The payload used to update the rate limits.
Batch1DayMaxInputTokens int64Optional
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) batch_1_day_max_input_tokens>)
MaxAudioMegabytesPer1Minute int64Optional
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_audio_megabytes_per_1_minute>)
MaxImagesPer1Minute int64Optional
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_images_per_1_minute>)
MaxRequestsPer1Day int64Optional
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_day>)
MaxRequestsPer1Minute int64Optional
The maximum requests per minute.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_minute>)
MaxTokensPer1Minute int64Optional
The maximum tokens per minute.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) rate_limit.updated>)
RoleAssignmentCreated AdminOrganizationAuditLogListResponseRoleAssignmentCreatedOptional
The details for events with this `type`.
ID stringOptional
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created > (property) id>)
PrincipalID stringOptional
The principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created > (property) principal_id>)
PrincipalType stringOptional
The type of principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created > (property) principal_type>)
ResourceID stringOptional
The resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created > (property) resource_id>)
ResourceType stringOptional
The type of resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.created>)
RoleAssignmentDeleted AdminOrganizationAuditLogListResponseRoleAssignmentDeletedOptional
The details for events with this `type`.
ID stringOptional
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) id>)
PrincipalID stringOptional
The principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) principal_id>)
PrincipalType stringOptional
The type of principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) principal_type>)
ResourceID stringOptional
The resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) resource_id>)
ResourceType stringOptional
The type of resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.assignment.deleted>)
RoleCreated AdminOrganizationAuditLogListResponseRoleCreatedOptional
The details for events with this `type`.
ID stringOptional
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created > (property) id>)
Permissions []stringOptional
The permissions granted by the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created > (property) permissions>)
ResourceID stringOptional
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created > (property) resource_id>)
ResourceType stringOptional
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created > (property) resource_type>)
RoleName stringOptional
The name of the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.created>)
RoleDeleted AdminOrganizationAuditLogListResponseRoleDeletedOptional
The details for events with this `type`.
ID stringOptional
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.deleted>)
RoleUpdated AdminOrganizationAuditLogListResponseRoleUpdatedOptional
The details for events with this `type`.
ID stringOptional
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseRoleUpdatedChangesRequestedOptional
The payload used to update the role.
Description stringOptional
The updated role description, when provided.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) description>)
Metadata anyOptional
Additional metadata stored on the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) metadata>)
PermissionsAdded []stringOptional
The permissions added to the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_added>)
PermissionsRemoved []stringOptional
The permissions removed from the role.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_removed>)
ResourceID stringOptional
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) resource_id>)
ResourceType stringOptional
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) resource_type>)
RoleName stringOptional
The updated role name, when provided.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) role.updated>)
ScimDisabled AdminOrganizationAuditLogListResponseScimDisabledOptional
The details for events with this `type`.
ID stringOptional
The ID of the SCIM was disabled for.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) scim.disabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) scim.disabled>)
ScimEnabled AdminOrganizationAuditLogListResponseScimEnabledOptional
The details for events with this `type`.
ID stringOptional
The ID of the SCIM was enabled for.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) scim.enabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) scim.enabled>)
ServiceAccountCreated AdminOrganizationAuditLogListResponseServiceAccountCreatedOptional
The details for events with this `type`.
ID stringOptional
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.created > (property) id>)
Data AdminOrganizationAuditLogListResponseServiceAccountCreatedDataOptional
The payload used to create the service account.
Role stringOptional
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.created > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.created>)
ServiceAccountDeleted AdminOrganizationAuditLogListResponseServiceAccountDeletedOptional
The details for events with this `type`.
ID stringOptional
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.deleted>)
ServiceAccountUpdated AdminOrganizationAuditLogListResponseServiceAccountUpdatedOptional
The details for events with this `type`.
ID stringOptional
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseServiceAccountUpdatedChangesRequestedOptional
The payload used to updated the service account.
Role stringOptional
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) service_account.updated>)
UserAdded AdminOrganizationAuditLogListResponseUserAddedOptional
The details for events with this `type`.
ID stringOptional
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.added > (property) id>)
Data AdminOrganizationAuditLogListResponseUserAddedDataOptional
The payload used to add the user to the project.
Role stringOptional
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.added > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.added > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.added>)
UserDeleted AdminOrganizationAuditLogListResponseUserDeletedOptional
The details for events with this `type`.
ID stringOptional
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.deleted>)
UserUpdated AdminOrganizationAuditLogListResponseUserUpdatedOptional
The details for events with this `type`.
ID stringOptional
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.updated > (property) id>)
ChangesRequested AdminOrganizationAuditLogListResponseUserUpdatedChangesRequestedOptional
The payload used to update the user.
Role stringOptional
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema) > (property) user.updated>)
[](<#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema)>)
### List audit logs
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
page, err := client.Admin.Organization.AuditLogs.List(context.TODO(), openai.AdminOrganizationAuditLogListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"id": "audit\_log-xxx\_yyyymmdd",
"type": "project.archived",
"effective\_at": 1722461446,
"actor": {
"type": "api\_key",
"api\_key": {
"type": "user",
"user": {
"id": "user-xxx",
"email": "user@example.com"
}
}
},
"project.archived": {
"id": "proj\_abc"
},
},
{
"id": "audit\_log-yyy\_\_20240101",
"type": "api\_key.updated",
"effective\_at": 1720804190,
"actor": {
"type": "session",
"session": {
"user": {
"id": "user-xxx",
"email": "user@example.com"
},
"ip\_address": "127.0.0.1",
"user\_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
"ja3": "a497151ce4338a12c4418c44d375173e",
"ja4": "q13d0313h3\_55b375c5d22e\_c7319ce65786",
"ip\_address\_details": {
"country": "US",
"city": "San Francisco",
"region": "California",
"region\_code": "CA",
"asn": "1234",
"latitude": "37.77490",
"longitude": "-122.41940"
}
}
},
"api\_key.updated": {
"id": "key\_xxxx",
"data": {
"scopes": ["resource\_2.operation\_2"]
}
},
}
],
"first\_id": "audit\_log-xxx\_\_20240101",
"last\_id": "audit\_log\_yyy\_\_20240101",
"has\_more": true
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "audit\_log-xxx\_yyyymmdd",
"type": "project.archived",
"effective\_at": 1722461446,
"actor": {
"type": "api\_key",
"api\_key": {
"type": "user",
"user": {
"id": "user-xxx",
"email": "user@example.com"
}
}
},
"project.archived": {
"id": "proj\_abc"
},
},
{
"id": "audit\_log-yyy\_\_20240101",
"type": "api\_key.updated",
"effective\_at": 1720804190,
"actor": {
"type": "session",
"session": {
"user": {
"id": "user-xxx",
"email": "user@example.com"
},
"ip\_address": "127.0.0.1",
"user\_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
"ja3": "a497151ce4338a12c4418c44d375173e",
"ja4": "q13d0313h3\_55b375c5d22e\_c7319ce65786",
"ip\_address\_details": {
"country": "US",
"city": "San Francisco",
"region": "California",
"region\_code": "CA",
"asn": "1234",
"latitude": "37.77490",
"longitude": "-122.41940"
}
}
},
"api\_key.updated": {
"id": "key\_xxxx",
"data": {
"scopes": ["resource\_2.operation\_2"]
}
},
}
],
"first\_id": "audit\_log-xxx\_\_20240101",
"last\_id": "audit\_log\_yyy\_\_20240101",
"has\_more": true
}
`
```