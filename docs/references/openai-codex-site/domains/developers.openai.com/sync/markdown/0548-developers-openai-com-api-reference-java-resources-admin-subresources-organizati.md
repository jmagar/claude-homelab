List audit logs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Audit Logs](/api/reference/java/resources/admin/subresources/organization/subresources/audit_logs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List audit logs
AuditLogListPage admin().organization().auditLogs().list(AuditLogListParamsparams = AuditLogListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/audit\_logs
List user actions and configuration changes within this organization.
##### ParametersExpand Collapse
AuditLogListParams params
Optional\<List\<String\>\> actorEmails
Return only events performed by users with these emails.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) actor_emails > (schema)>)
Optional\<List\<String\>\> actorIds
Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) actor_ids > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) after > (schema)>)
Optional\<String\> before
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) before > (schema)>)
Optional\<[EffectiveAt](</api/reference/java/resources/admin/subresources/organization/subresources/audit_logs/methods/list#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema)>)\> effectiveAt
Return only events whose `effective\_at` (Unix seconds) is in this range.
Optional\<Long\> gt
Return only events whose `effective\_at` (Unix seconds) is greater than this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) gt>)
Optional\<Long\> gte
Return only events whose `effective\_at` (Unix seconds) is greater than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) gte>)
Optional\<Long\> lt
Return only events whose `effective\_at` (Unix seconds) is less than this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) lt>)
Optional\<Long\> lte
Return only events whose `effective\_at` (Unix seconds) is less than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema) > (property) lte>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) effective_at > (schema)>)
Optional\<List\<EventType\>\> eventTypes
Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](https://platform.openai.com/docs/api-reference/audit-logs/object).
API\_KEY\_CREATED("api\_key.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 0>)
API\_KEY\_UPDATED("api\_key.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 1>)
API\_KEY\_DELETED("api\_key.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 2>)
CERTIFICATE\_CREATED("certificate.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 3>)
CERTIFICATE\_UPDATED("certificate.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 4>)
CERTIFICATE\_DELETED("certificate.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 5>)
CERTIFICATES\_ACTIVATED("certificates.activated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 6>)
CERTIFICATES\_DEACTIVATED("certificates.deactivated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 7>)
CHECKPOINT\_PERMISSION\_CREATED("checkpoint.permission.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 8>)
CHECKPOINT\_PERMISSION\_DELETED("checkpoint.permission.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 9>)
EXTERNAL\_KEY\_REGISTERED("external\_key.registered")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 10>)
EXTERNAL\_KEY\_REMOVED("external\_key.removed")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 11>)
GROUP\_CREATED("group.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 12>)
GROUP\_UPDATED("group.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 13>)
GROUP\_DELETED("group.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 14>)
INVITE\_SENT("invite.sent")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 15>)
INVITE\_ACCEPTED("invite.accepted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 16>)
INVITE\_DELETED("invite.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 17>)
IP\_ALLOWLIST\_CREATED("ip\_allowlist.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 18>)
IP\_ALLOWLIST\_UPDATED("ip\_allowlist.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 19>)
IP\_ALLOWLIST\_DELETED("ip\_allowlist.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 20>)
IP\_ALLOWLIST\_CONFIG\_ACTIVATED("ip\_allowlist.config.activated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 21>)
IP\_ALLOWLIST\_CONFIG\_DEACTIVATED("ip\_allowlist.config.deactivated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 22>)
LOGIN\_SUCCEEDED("login.succeeded")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 23>)
LOGIN\_FAILED("login.failed")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 24>)
LOGOUT\_SUCCEEDED("logout.succeeded")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 25>)
LOGOUT\_FAILED("logout.failed")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 26>)
ORGANIZATION\_UPDATED("organization.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 27>)
PROJECT\_CREATED("project.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 28>)
PROJECT\_UPDATED("project.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 29>)
PROJECT\_ARCHIVED("project.archived")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 30>)
PROJECT\_DELETED("project.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 31>)
RATE\_LIMIT\_UPDATED("rate\_limit.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 32>)
RATE\_LIMIT\_DELETED("rate\_limit.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 33>)
RESOURCE\_DELETED("resource.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 34>)
TUNNEL\_CREATED("tunnel.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 35>)
TUNNEL\_UPDATED("tunnel.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 36>)
TUNNEL\_DELETED("tunnel.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 37>)
ROLE\_CREATED("role.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 38>)
ROLE\_UPDATED("role.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 39>)
ROLE\_DELETED("role.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 40>)
ROLE\_ASSIGNMENT\_CREATED("role.assignment.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 41>)
ROLE\_ASSIGNMENT\_DELETED("role.assignment.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 42>)
SCIM\_ENABLED("scim.enabled")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 43>)
SCIM\_DISABLED("scim.disabled")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 44>)
SERVICE\_ACCOUNT\_CREATED("service\_account.created")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 45>)
SERVICE\_ACCOUNT\_UPDATED("service\_account.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 46>)
SERVICE\_ACCOUNT\_DELETED("service\_account.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 47>)
USER\_ADDED("user.added")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 48>)
USER\_UPDATED("user.updated")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 49>)
USER\_DELETED("user.deleted")
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema) > (items) > (member) 50>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) event_types > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) limit > (schema)>)
Optional\<List\<String\>\> projectIds
Return only events for these projects.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) project_ids > (schema)>)
Optional\<List\<String\>\> resourceIds
Return only events performed on these targets. For example, a project ID updated.
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default > (param) resource_ids > (schema)>)
[](<#(resource) admin.organization.audit_logs > (method) list > (params) default>)
##### ReturnsExpand Collapse
class AuditLogListResponse:
A log of a user action or configuration change within this organization.
String id
The ID of this log.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) id>)
Actor actor
The actor who performed the audit logged action.
Optional\<ApiKey\> apiKey
The API Key used to perform the audit logged action.
Optional\<String\> id
The tracking id of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) id>)
Optional\<ServiceAccount\> serviceAccount
The service account that performed the audit logged action.
Optional\<String\> id
The service account id.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) service_account > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) service_account>)
Optional\<Type\> type
The type of API key. Can be either `user` or `service\_account`.
One of the following:
USER("user")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type > (member) 0>)
SERVICE\_ACCOUNT("service\_account")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) type>)
Optional\<User\> user
The user who performed the audit logged action.
Optional\<String\> id
The user id.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user > (property) id>)
Optional\<String\> email
The user email.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) api_key>)
Optional\<Session\> session
The session in which the audit logged action was performed.
Optional\<String\> ipAddress
The IP address from which the action was performed.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) session > (property) ip_address>)
Optional\<User\> user
The user who performed the audit logged action.
Optional\<String\> id
The user id.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) session > (property) user > (property) id>)
Optional\<String\> email
The user email.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) session > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) session > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) session>)
Optional\<Type\> type
The type of actor. Is either `session` or `api\_key`.
One of the following:
SESSION("session")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) type > (member) 0>)
API\_KEY("api\_key")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor > (property) type>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) actor>)
long effectiveAt
The Unix timestamp (in seconds) of the event.
formatunixtime
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) effective_at>)
Type type
The event type.
One of the following:
API\_KEY\_CREATED("api\_key.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 0>)
API\_KEY\_UPDATED("api\_key.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 1>)
API\_KEY\_DELETED("api\_key.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 2>)
CERTIFICATE\_CREATED("certificate.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 3>)
CERTIFICATE\_UPDATED("certificate.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 4>)
CERTIFICATE\_DELETED("certificate.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 5>)
CERTIFICATES\_ACTIVATED("certificates.activated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 6>)
CERTIFICATES\_DEACTIVATED("certificates.deactivated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 7>)
CHECKPOINT\_PERMISSION\_CREATED("checkpoint.permission.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 8>)
CHECKPOINT\_PERMISSION\_DELETED("checkpoint.permission.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 9>)
EXTERNAL\_KEY\_REGISTERED("external\_key.registered")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 10>)
EXTERNAL\_KEY\_REMOVED("external\_key.removed")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 11>)
GROUP\_CREATED("group.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 12>)
GROUP\_UPDATED("group.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 13>)
GROUP\_DELETED("group.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 14>)
INVITE\_SENT("invite.sent")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 15>)
INVITE\_ACCEPTED("invite.accepted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 16>)
INVITE\_DELETED("invite.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 17>)
IP\_ALLOWLIST\_CREATED("ip\_allowlist.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 18>)
IP\_ALLOWLIST\_UPDATED("ip\_allowlist.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 19>)
IP\_ALLOWLIST\_DELETED("ip\_allowlist.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 20>)
IP\_ALLOWLIST\_CONFIG\_ACTIVATED("ip\_allowlist.config.activated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 21>)
IP\_ALLOWLIST\_CONFIG\_DEACTIVATED("ip\_allowlist.config.deactivated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 22>)
LOGIN\_SUCCEEDED("login.succeeded")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 23>)
LOGIN\_FAILED("login.failed")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 24>)
LOGOUT\_SUCCEEDED("logout.succeeded")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 25>)
LOGOUT\_FAILED("logout.failed")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 26>)
ORGANIZATION\_UPDATED("organization.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 27>)
PROJECT\_CREATED("project.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 28>)
PROJECT\_UPDATED("project.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 29>)
PROJECT\_ARCHIVED("project.archived")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 30>)
PROJECT\_DELETED("project.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 31>)
RATE\_LIMIT\_UPDATED("rate\_limit.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 32>)
RATE\_LIMIT\_DELETED("rate\_limit.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 33>)
RESOURCE\_DELETED("resource.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 34>)
TUNNEL\_CREATED("tunnel.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 35>)
TUNNEL\_UPDATED("tunnel.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 36>)
TUNNEL\_DELETED("tunnel.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 37>)
ROLE\_CREATED("role.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 38>)
ROLE\_UPDATED("role.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 39>)
ROLE\_DELETED("role.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 40>)
ROLE\_ASSIGNMENT\_CREATED("role.assignment.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 41>)
ROLE\_ASSIGNMENT\_DELETED("role.assignment.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 42>)
SCIM\_ENABLED("scim.enabled")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 43>)
SCIM\_DISABLED("scim.disabled")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 44>)
SERVICE\_ACCOUNT\_CREATED("service\_account.created")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 45>)
SERVICE\_ACCOUNT\_UPDATED("service\_account.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 46>)
SERVICE\_ACCOUNT\_DELETED("service\_account.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 47>)
USER\_ADDED("user.added")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 48>)
USER\_UPDATED("user.updated")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 49>)
USER\_DELETED("user.deleted")
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type > (member) 50>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) type>)
Optional\<ApiKeyCreated\> apiKeyCreated
The details for events with this `type`.
Optional\<String\> id
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.created > (property) id>)
Optional\<Data\> data
The payload used to create the API key.
Optional\<List\<String\>\> scopes
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.created > (property) data > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.created>)
Optional\<ApiKeyDeleted\> apiKeyDeleted
The details for events with this `type`.
Optional\<String\> id
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.deleted>)
Optional\<ApiKeyUpdated\> apiKeyUpdated
The details for events with this `type`.
Optional\<String\> id
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the API key.
Optional\<List\<String\>\> scopes
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.updated > (property) changes_requested > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) api_key.updated>)
Optional\<CertificateCreated\> certificateCreated
The details for events with this `type`.
Optional\<String\> id
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.created > (property) id>)
Optional\<String\> name
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.created>)
Optional\<CertificateDeleted\> certificateDeleted
The details for events with this `type`.
Optional\<String\> id
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.deleted > (property) id>)
Optional\<String\> certificate
The certificate content in PEM format.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.deleted > (property) certificate>)
Optional\<String\> name
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.deleted>)
Optional\<CertificateUpdated\> certificateUpdated
The details for events with this `type`.
Optional\<String\> id
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.updated > (property) id>)
Optional\<String\> name
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.updated > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificate.updated>)
Optional\<CertificatesActivated\> certificatesActivated
The details for events with this `type`.
Optional\<List\<Certificate\>\> certificates
Optional\<String\> id
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) id>)
Optional\<String\> name
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.activated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.activated>)
Optional\<CertificatesDeactivated\> certificatesDeactivated
The details for events with this `type`.
Optional\<List\<Certificate\>\> certificates
Optional\<String\> id
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) id>)
Optional\<String\> name
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.deactivated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) certificates.deactivated>)
Optional\<CheckpointPermissionCreated\> checkpointPermissionCreated
The project and fine-tuned model checkpoint that the checkpoint permission was created for.
Optional\<String\> id
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) id>)
Optional\<Data\> data
The payload used to create the checkpoint permission.
Optional\<String\> fineTunedModelCheckpoint
The ID of the fine-tuned model checkpoint.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data > (property) fine_tuned_model_checkpoint>)
Optional\<String\> projectId
The ID of the project that the checkpoint permission was created for.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data > (property) project_id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.created>)
Optional\<CheckpointPermissionDeleted\> checkpointPermissionDeleted
The details for events with this `type`.
Optional\<String\> id
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) checkpoint.permission.deleted>)
Optional\<ExternalKeyRegistered\> externalKeyRegistered
The details for events with this `type`.
Optional\<String\> id
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) external_key.registered > (property) id>)
Optional\<JsonValue\> data
The configuration for the external key.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) external_key.registered > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) external_key.registered>)
Optional\<ExternalKeyRemoved\> externalKeyRemoved
The details for events with this `type`.
Optional\<String\> id
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) external_key.removed > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) external_key.removed>)
Optional\<GroupCreated\> groupCreated
The details for events with this `type`.
Optional\<String\> id
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.created > (property) id>)
Optional\<Data\> data
Information about the created group.
Optional\<String\> groupName
The group name.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.created > (property) data > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.created>)
Optional\<GroupDeleted\> groupDeleted
The details for events with this `type`.
Optional\<String\> id
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.deleted>)
Optional\<GroupUpdated\> groupUpdated
The details for events with this `type`.
Optional\<String\> id
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the group.
Optional\<String\> groupName
The updated group name.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.updated > (property) changes_requested > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) group.updated>)
Optional\<InviteAccepted\> inviteAccepted
The details for events with this `type`.
Optional\<String\> id
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.accepted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.accepted>)
Optional\<InviteDeleted\> inviteDeleted
The details for events with this `type`.
Optional\<String\> id
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.deleted>)
Optional\<InviteSent\> inviteSent
The details for events with this `type`.
Optional\<String\> id
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.sent > (property) id>)
Optional\<Data\> data
The payload used to create the invite.
Optional\<String\> email
The email invited to the organization.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.sent > (property) data > (property) email>)
Optional\<String\> role
The role the email was invited to be. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.sent > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.sent > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) invite.sent>)
Optional\<IpAllowlistConfigActivated\> ipAllowlistConfigActivated
The details for events with this `type`.
Optional\<List\<Config\>\> configs
The configurations that were activated.
Optional\<String\> id
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) id>)
Optional\<String\> name
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.activated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.activated>)
Optional\<IpAllowlistConfigDeactivated\> ipAllowlistConfigDeactivated
The details for events with this `type`.
Optional\<List\<Config\>\> configs
The configurations that were deactivated.
Optional\<String\> id
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) id>)
Optional\<String\> name
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.config.deactivated>)
Optional\<IpAllowlistCreated\> ipAllowlistCreated
The details for events with this `type`.
Optional\<String\> id
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) id>)
Optional\<List\<String\>\> allowedIps
The IP addresses or CIDR ranges included in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) allowed_ips>)
Optional\<String\> name
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.created>)
Optional\<IpAllowlistDeleted\> ipAllowlistDeleted
The details for events with this `type`.
Optional\<String\> id
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) id>)
Optional\<List\<String\>\> allowedIps
The IP addresses or CIDR ranges that were in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) allowed_ips>)
Optional\<String\> name
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.deleted>)
Optional\<IpAllowlistUpdated\> ipAllowlistUpdated
The details for events with this `type`.
Optional\<String\> id
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.updated > (property) id>)
Optional\<List\<String\>\> allowedIps
The updated set of IP addresses or CIDR ranges in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.updated > (property) allowed_ips>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) ip_allowlist.updated>)
Optional\<LoginFailed\> loginFailed
The details for events with this `type`.
Optional\<String\> errorCode
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) login.failed > (property) error_code>)
Optional\<String\> errorMessage
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) login.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) login.failed>)
Optional\<JsonValue\> loginSucceeded
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) login.succeeded>)
Optional\<LogoutFailed\> logoutFailed
The details for events with this `type`.
Optional\<String\> errorCode
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) logout.failed > (property) error_code>)
Optional\<String\> errorMessage
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) logout.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) logout.failed>)
Optional\<JsonValue\> logoutSucceeded
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) logout.succeeded>)
Optional\<OrganizationUpdated\> organizationUpdated
The details for events with this `type`.
Optional\<String\> id
The organization ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the organization settings.
Optional\<String\> apiCallLogging
How your organization logs data from supported API calls. One of `disabled`, `enabled\_per\_call`, `enabled\_for\_all\_projects`, or `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging>)
Optional\<String\> apiCallLoggingProjectIds
The list of project ids if api\_call\_logging is set to `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging_project_ids>)
Optional\<String\> description
The organization description.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) description>)
Optional\<String\> name
The organization name.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) name>)
Optional\<String\> threadsUiVisibility
Visibility of the threads page which shows messages created with the Assistants API and Playground. One of `ANY\_ROLE`, `OWNERS`, or `NONE`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) threads_ui_visibility>)
Optional\<String\> title
The organization title.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) title>)
Optional\<String\> usageDashboardVisibility
Visibility of the usage dashboard which shows activity and costs for your organization. One of `ANY\_ROLE` or `OWNERS`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested > (property) usage_dashboard_visibility>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) organization.updated>)
Optional\<Project\> project
The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project > (property) id>)
Optional\<String\> name
The project title.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project>)
Optional\<ProjectArchived\> projectArchived
The details for events with this `type`.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.archived > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.archived>)
Optional\<ProjectCreated\> projectCreated
The details for events with this `type`.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.created > (property) id>)
Optional\<Data\> data
The payload used to create the project.
Optional\<String\> name
The project name.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.created > (property) data > (property) name>)
Optional\<String\> title
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.created > (property) data > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.created>)
Optional\<ProjectDeleted\> projectDeleted
The details for events with this `type`.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.deleted>)
Optional\<ProjectUpdated\> projectUpdated
The details for events with this `type`.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the project.
Optional\<String\> title
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.updated > (property) changes_requested > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) project.updated>)
Optional\<RateLimitDeleted\> rateLimitDeleted
The details for events with this `type`.
Optional\<String\> id
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.deleted>)
Optional\<RateLimitUpdated\> rateLimitUpdated
The details for events with this `type`.
Optional\<String\> id
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the rate limits.
Optional\<Long\> batch1DayMaxInputTokens
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) batch_1_day_max_input_tokens>)
Optional\<Long\> maxAudioMegabytesPer1Minute
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_audio_megabytes_per_1_minute>)
Optional\<Long\> maxImagesPer1Minute
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_images_per_1_minute>)
Optional\<Long\> maxRequestsPer1Day
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_day>)
Optional\<Long\> maxRequestsPer1Minute
The maximum requests per minute.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_minute>)
Optional\<Long\> maxTokensPer1Minute
The maximum tokens per minute.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) rate_limit.updated>)
Optional\<RoleAssignmentCreated\> roleAssignmentCreated
The details for events with this `type`.
Optional\<String\> id
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created > (property) id>)
Optional\<String\> principalId
The principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created > (property) principal_id>)
Optional\<String\> principalType
The type of principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created > (property) principal_type>)
Optional\<String\> resourceId
The resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created > (property) resource_id>)
Optional\<String\> resourceType
The type of resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.created>)
Optional\<RoleAssignmentDeleted\> roleAssignmentDeleted
The details for events with this `type`.
Optional\<String\> id
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) id>)
Optional\<String\> principalId
The principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) principal_id>)
Optional\<String\> principalType
The type of principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) principal_type>)
Optional\<String\> resourceId
The resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) resource_id>)
Optional\<String\> resourceType
The type of resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.assignment.deleted>)
Optional\<RoleCreated\> roleCreated
The details for events with this `type`.
Optional\<String\> id
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created > (property) id>)
Optional\<List\<String\>\> permissions
The permissions granted by the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created > (property) permissions>)
Optional\<String\> resourceId
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created > (property) resource_id>)
Optional\<String\> resourceType
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created > (property) resource_type>)
Optional\<String\> roleName
The name of the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.created>)
Optional\<RoleDeleted\> roleDeleted
The details for events with this `type`.
Optional\<String\> id
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.deleted>)
Optional\<RoleUpdated\> roleUpdated
The details for events with this `type`.
Optional\<String\> id
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the role.
Optional\<String\> description
The updated role description, when provided.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) description>)
Optional\<JsonValue\> metadata
Additional metadata stored on the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) metadata>)
Optional\<List\<String\>\> permissionsAdded
The permissions added to the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_added>)
Optional\<List\<String\>\> permissionsRemoved
The permissions removed from the role.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_removed>)
Optional\<String\> resourceId
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) resource_id>)
Optional\<String\> resourceType
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) resource_type>)
Optional\<String\> roleName
The updated role name, when provided.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) role.updated>)
Optional\<ScimDisabled\> scimDisabled
The details for events with this `type`.
Optional\<String\> id
The ID of the SCIM was disabled for.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) scim.disabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) scim.disabled>)
Optional\<ScimEnabled\> scimEnabled
The details for events with this `type`.
Optional\<String\> id
The ID of the SCIM was enabled for.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) scim.enabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) scim.enabled>)
Optional\<ServiceAccountCreated\> serviceAccountCreated
The details for events with this `type`.
Optional\<String\> id
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.created > (property) id>)
Optional\<Data\> data
The payload used to create the service account.
Optional\<String\> role
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.created > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.created>)
Optional\<ServiceAccountDeleted\> serviceAccountDeleted
The details for events with this `type`.
Optional\<String\> id
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.deleted>)
Optional\<ServiceAccountUpdated\> serviceAccountUpdated
The details for events with this `type`.
Optional\<String\> id
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to updated the service account.
Optional\<String\> role
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) service_account.updated>)
Optional\<UserAdded\> userAdded
The details for events with this `type`.
Optional\<String\> id
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.added > (property) id>)
Optional\<Data\> data
The payload used to add the user to the project.
Optional\<String\> role
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.added > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.added > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.added>)
Optional\<UserDeleted\> userDeleted
The details for events with this `type`.
Optional\<String\> id
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.deleted>)
Optional\<UserUpdated\> userUpdated
The details for events with this `type`.
Optional\<String\> id
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.updated > (property) id>)
Optional\<ChangesRequested\> changesRequested
The payload used to update the user.
Optional\<String\> role
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema) > (property) user.updated>)
[](<#(resource) admin.organization.audit_logs > (model) AuditLogListResponse > (schema)>)
### List audit logs
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.admin.organization.auditlogs.AuditLogListPage;
import com.openai.models.admin.organization.auditlogs.AuditLogListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
AuditLogListPage page = client.admin().organization().auditLogs().list();
}
}`
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