Organization | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Organization
#### OrganizationAudit Logs
List user actions and configuration changes within this organization.
##### [List audit logs](/api/reference/python/resources/admin/subresources/organization/subresources/audit_logs/methods/list)
admin.organization.audit\_logs.list(AuditLogListParams\*\*kwargs) -\> SyncConversationCursorPage[[AuditLogListResponse](</api/reference/python/resources/admin#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema)>)]
GET/organization/audit\_logs
##### ModelsExpand Collapse
class AuditLogListResponse: …
A log of a user action or configuration change within this organization.
id: str
The ID of this log.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) id>)
actor: Actor
The actor who performed the audit logged action.
api\_key: Optional[ActorAPIKey]
The API Key used to perform the audit logged action.
id: Optional[str]
The tracking id of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) id>)
service\_account: Optional[ActorAPIKeyServiceAccount]
The service account that performed the audit logged action.
id: Optional[str]
The service account id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) service_account > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) service_account>)
type: Optional[Literal["user", "service\_account"]]
The type of API key. Can be either `user` or `service\_account`.
One of the following:
"user"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type>)
user: Optional[ActorAPIKeyUser]
The user who performed the audit logged action.
id: Optional[str]
The user id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user > (property) id>)
email: Optional[str]
The user email.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key>)
session: Optional[ActorSession]
The session in which the audit logged action was performed.
ip\_address: Optional[str]
The IP address from which the action was performed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) ip_address>)
user: Optional[ActorSessionUser]
The user who performed the audit logged action.
id: Optional[str]
The user id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user > (property) id>)
email: Optional[str]
The user email.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session>)
type: Optional[Literal["session", "api\_key"]]
The type of actor. Is either `session` or `api\_key`.
One of the following:
"session"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type > (member) 0>)
"api\_key"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor>)
effective\_at: int
The Unix timestamp (in seconds) of the event.
formatunixtime
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) effective_at>)
type: Literal["api\_key.created", "api\_key.updated", "api\_key.deleted", 48 more]
The event type.
One of the following:
"api\_key.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 0>)
"api\_key.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 1>)
"api\_key.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 2>)
"certificate.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 3>)
"certificate.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 4>)
"certificate.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 5>)
"certificates.activated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 6>)
"certificates.deactivated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 7>)
"checkpoint.permission.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 8>)
"checkpoint.permission.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 9>)
"external\_key.registered"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 10>)
"external\_key.removed"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 11>)
"group.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 12>)
"group.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 13>)
"group.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 14>)
"invite.sent"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 15>)
"invite.accepted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 16>)
"invite.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 17>)
"ip\_allowlist.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 18>)
"ip\_allowlist.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 19>)
"ip\_allowlist.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 20>)
"ip\_allowlist.config.activated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 21>)
"ip\_allowlist.config.deactivated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 22>)
"login.succeeded"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 23>)
"login.failed"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 24>)
"logout.succeeded"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 25>)
"logout.failed"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 26>)
"organization.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 27>)
"project.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 28>)
"project.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 29>)
"project.archived"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 30>)
"project.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 31>)
"rate\_limit.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 32>)
"rate\_limit.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 33>)
"resource.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 34>)
"tunnel.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 35>)
"tunnel.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 36>)
"tunnel.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 37>)
"role.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 38>)
"role.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 39>)
"role.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 40>)
"role.assignment.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 41>)
"role.assignment.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 42>)
"scim.enabled"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 43>)
"scim.disabled"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 44>)
"service\_account.created"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 45>)
"service\_account.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 46>)
"service\_account.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 47>)
"user.added"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 48>)
"user.updated"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 49>)
"user.deleted"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type > (member) 50>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) type>)
api\_key\_created: Optional[APIKeyCreated]
The details for events with this `type`.
id: Optional[str]
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) id>)
data: Optional[APIKeyCreatedData]
The payload used to create the API key.
scopes: Optional[List[str]]
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) data > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created>)
api\_key\_deleted: Optional[APIKeyDeleted]
The details for events with this `type`.
id: Optional[str]
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.deleted>)
api\_key\_updated: Optional[APIKeyUpdated]
The details for events with this `type`.
id: Optional[str]
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) id>)
changes\_requested: Optional[APIKeyUpdatedChangesRequested]
The payload used to update the API key.
scopes: Optional[List[str]]
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) changes_requested > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated>)
certificate\_created: Optional[CertificateCreated]
The details for events with this `type`.
id: Optional[str]
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created > (property) id>)
name: Optional[str]
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created>)
certificate\_deleted: Optional[CertificateDeleted]
The details for events with this `type`.
id: Optional[str]
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) id>)
certificate: Optional[str]
The certificate content in PEM format.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) certificate>)
name: Optional[str]
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted>)
certificate\_updated: Optional[CertificateUpdated]
The details for events with this `type`.
id: Optional[str]
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated > (property) id>)
name: Optional[str]
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated>)
certificates\_activated: Optional[CertificatesActivated]
The details for events with this `type`.
certificates: Optional[List[CertificatesActivatedCertificate]]
id: Optional[str]
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) id>)
name: Optional[str]
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated>)
certificates\_deactivated: Optional[CertificatesDeactivated]
The details for events with this `type`.
certificates: Optional[List[CertificatesDeactivatedCertificate]]
id: Optional[str]
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) id>)
name: Optional[str]
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated>)
checkpoint\_permission\_created: Optional[CheckpointPermissionCreated]
The project and fine-tuned model checkpoint that the checkpoint permission was created for.
id: Optional[str]
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) id>)
data: Optional[CheckpointPermissionCreatedData]
The payload used to create the checkpoint permission.
fine\_tuned\_model\_checkpoint: Optional[str]
The ID of the fine-tuned model checkpoint.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data > (property) fine_tuned_model_checkpoint>)
project\_id: Optional[str]
The ID of the project that the checkpoint permission was created for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data > (property) project_id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created>)
checkpoint\_permission\_deleted: Optional[CheckpointPermissionDeleted]
The details for events with this `type`.
id: Optional[str]
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.deleted>)
external\_key\_registered: Optional[ExternalKeyRegistered]
The details for events with this `type`.
id: Optional[str]
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered > (property) id>)
data: Optional[object]
The configuration for the external key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered>)
external\_key\_removed: Optional[ExternalKeyRemoved]
The details for events with this `type`.
id: Optional[str]
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.removed > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.removed>)
group\_created: Optional[GroupCreated]
The details for events with this `type`.
id: Optional[str]
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) id>)
data: Optional[GroupCreatedData]
Information about the created group.
group\_name: Optional[str]
The group name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) data > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created>)
group\_deleted: Optional[GroupDeleted]
The details for events with this `type`.
id: Optional[str]
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.deleted>)
group\_updated: Optional[GroupUpdated]
The details for events with this `type`.
id: Optional[str]
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) id>)
changes\_requested: Optional[GroupUpdatedChangesRequested]
The payload used to update the group.
group\_name: Optional[str]
The updated group name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) changes_requested > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated>)
invite\_accepted: Optional[InviteAccepted]
The details for events with this `type`.
id: Optional[str]
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.accepted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.accepted>)
invite\_deleted: Optional[InviteDeleted]
The details for events with this `type`.
id: Optional[str]
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.deleted>)
invite\_sent: Optional[InviteSent]
The details for events with this `type`.
id: Optional[str]
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) id>)
data: Optional[InviteSentData]
The payload used to create the invite.
email: Optional[str]
The email invited to the organization.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data > (property) email>)
role: Optional[str]
The role the email was invited to be. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent>)
ip\_allowlist\_config\_activated: Optional[IPAllowlistConfigActivated]
The details for events with this `type`.
configs: Optional[List[IPAllowlistConfigActivatedConfig]]
The configurations that were activated.
id: Optional[str]
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) id>)
name: Optional[str]
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated>)
ip\_allowlist\_config\_deactivated: Optional[IPAllowlistConfigDeactivated]
The details for events with this `type`.
configs: Optional[List[IPAllowlistConfigDeactivatedConfig]]
The configurations that were deactivated.
id: Optional[str]
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) id>)
name: Optional[str]
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated>)
ip\_allowlist\_created: Optional[IPAllowlistCreated]
The details for events with this `type`.
id: Optional[str]
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) id>)
allowed\_ips: Optional[List[str]]
The IP addresses or CIDR ranges included in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) allowed_ips>)
name: Optional[str]
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created>)
ip\_allowlist\_deleted: Optional[IPAllowlistDeleted]
The details for events with this `type`.
id: Optional[str]
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) id>)
allowed\_ips: Optional[List[str]]
The IP addresses or CIDR ranges that were in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) allowed_ips>)
name: Optional[str]
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted>)
ip\_allowlist\_updated: Optional[IPAllowlistUpdated]
The details for events with this `type`.
id: Optional[str]
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated > (property) id>)
allowed\_ips: Optional[List[str]]
The updated set of IP addresses or CIDR ranges in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated > (property) allowed_ips>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated>)
login\_failed: Optional[LoginFailed]
The details for events with this `type`.
error\_code: Optional[str]
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed > (property) error_code>)
error\_message: Optional[str]
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed>)
login\_succeeded: Optional[object]
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.succeeded>)
logout\_failed: Optional[LogoutFailed]
The details for events with this `type`.
error\_code: Optional[str]
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed > (property) error_code>)
error\_message: Optional[str]
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed>)
logout\_succeeded: Optional[object]
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.succeeded>)
organization\_updated: Optional[OrganizationUpdated]
The details for events with this `type`.
id: Optional[str]
The organization ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) id>)
changes\_requested: Optional[OrganizationUpdatedChangesRequested]
The payload used to update the organization settings.
api\_call\_logging: Optional[str]
How your organization logs data from supported API calls. One of `disabled`, `enabled\_per\_call`, `enabled\_for\_all\_projects`, or `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging>)
api\_call\_logging\_project\_ids: Optional[str]
The list of project ids if api\_call\_logging is set to `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging_project_ids>)
description: Optional[str]
The organization description.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) description>)
name: Optional[str]
The organization name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) name>)
threads\_ui\_visibility: Optional[str]
Visibility of the threads page which shows messages created with the Assistants API and Playground. One of `ANY\_ROLE`, `OWNERS`, or `NONE`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) threads_ui_visibility>)
title: Optional[str]
The organization title.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) title>)
usage\_dashboard\_visibility: Optional[str]
Visibility of the usage dashboard which shows activity and costs for your organization. One of `ANY\_ROLE` or `OWNERS`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) usage_dashboard_visibility>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated>)
project: Optional[Project]
The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project > (property) id>)
name: Optional[str]
The project title.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project>)
project\_archived: Optional[ProjectArchived]
The details for events with this `type`.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.archived > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.archived>)
project\_created: Optional[ProjectCreated]
The details for events with this `type`.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) id>)
data: Optional[ProjectCreatedData]
The payload used to create the project.
name: Optional[str]
The project name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data > (property) name>)
title: Optional[str]
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created>)
project\_deleted: Optional[ProjectDeleted]
The details for events with this `type`.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.deleted>)
project\_updated: Optional[ProjectUpdated]
The details for events with this `type`.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) id>)
changes\_requested: Optional[ProjectUpdatedChangesRequested]
The payload used to update the project.
title: Optional[str]
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) changes_requested > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated>)
rate\_limit\_deleted: Optional[RateLimitDeleted]
The details for events with this `type`.
id: Optional[str]
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.deleted>)
rate\_limit\_updated: Optional[RateLimitUpdated]
The details for events with this `type`.
id: Optional[str]
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) id>)
changes\_requested: Optional[RateLimitUpdatedChangesRequested]
The payload used to update the rate limits.
batch\_1\_day\_max\_input\_tokens: Optional[int]
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Optional[int]
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Optional[int]
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Optional[int]
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_day>)
max\_requests\_per\_1\_minute: Optional[int]
The maximum requests per minute.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: Optional[int]
The maximum tokens per minute.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated>)
role\_assignment\_created: Optional[RoleAssignmentCreated]
The details for events with this `type`.
id: Optional[str]
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) id>)
principal\_id: Optional[str]
The principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) principal_id>)
principal\_type: Optional[str]
The type of principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) principal_type>)
resource\_id: Optional[str]
The resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) resource_id>)
resource\_type: Optional[str]
The type of resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created>)
role\_assignment\_deleted: Optional[RoleAssignmentDeleted]
The details for events with this `type`.
id: Optional[str]
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) id>)
principal\_id: Optional[str]
The principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) principal_id>)
principal\_type: Optional[str]
The type of principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) principal_type>)
resource\_id: Optional[str]
The resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) resource_id>)
resource\_type: Optional[str]
The type of resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted>)
role\_created: Optional[RoleCreated]
The details for events with this `type`.
id: Optional[str]
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) id>)
permissions: Optional[List[str]]
The permissions granted by the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) permissions>)
resource\_id: Optional[str]
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) resource_id>)
resource\_type: Optional[str]
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) resource_type>)
role\_name: Optional[str]
The name of the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created>)
role\_deleted: Optional[RoleDeleted]
The details for events with this `type`.
id: Optional[str]
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.deleted>)
role\_updated: Optional[RoleUpdated]
The details for events with this `type`.
id: Optional[str]
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) id>)
changes\_requested: Optional[RoleUpdatedChangesRequested]
The payload used to update the role.
description: Optional[str]
The updated role description, when provided.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) description>)
metadata: Optional[object]
Additional metadata stored on the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) metadata>)
permissions\_added: Optional[List[str]]
The permissions added to the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_added>)
permissions\_removed: Optional[List[str]]
The permissions removed from the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_removed>)
resource\_id: Optional[str]
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) resource_id>)
resource\_type: Optional[str]
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) resource_type>)
role\_name: Optional[str]
The updated role name, when provided.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated>)
scim\_disabled: Optional[ScimDisabled]
The details for events with this `type`.
id: Optional[str]
The ID of the SCIM was disabled for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.disabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.disabled>)
scim\_enabled: Optional[ScimEnabled]
The details for events with this `type`.
id: Optional[str]
The ID of the SCIM was enabled for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.enabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.enabled>)
service\_account\_created: Optional[ServiceAccountCreated]
The details for events with this `type`.
id: Optional[str]
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) id>)
data: Optional[ServiceAccountCreatedData]
The payload used to create the service account.
role: Optional[str]
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created>)
service\_account\_deleted: Optional[ServiceAccountDeleted]
The details for events with this `type`.
id: Optional[str]
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.deleted>)
service\_account\_updated: Optional[ServiceAccountUpdated]
The details for events with this `type`.
id: Optional[str]
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) id>)
changes\_requested: Optional[ServiceAccountUpdatedChangesRequested]
The payload used to updated the service account.
role: Optional[str]
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated>)
user\_added: Optional[UserAdded]
The details for events with this `type`.
id: Optional[str]
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) id>)
data: Optional[UserAddedData]
The payload used to add the user to the project.
role: Optional[str]
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added>)
user\_deleted: Optional[UserDeleted]
The details for events with this `type`.
id: Optional[str]
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.deleted>)
user\_updated: Optional[UserUpdated]
The details for events with this `type`.
id: Optional[str]
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) id>)
changes\_requested: Optional[UserUpdatedChangesRequested]
The payload used to update the user.
role: Optional[str]
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema)>)
#### OrganizationAdmin API Keys
##### [List all organization and project API keys.](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
admin.organization.admin\_api\_keys.list(AdminAPIKeyListParams\*\*kwargs) -\> SyncCursorPage[[AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)]
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
admin.organization.admin\_api\_keys.create(AdminAPIKeyCreateParams\*\*kwargs) -\> [AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
admin.organization.admin\_api\_keys.retrieve(strkey\_id) -\> [AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
admin.organization.admin\_api\_keys.delete(strkey\_id) -\> [AdminAPIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
class AdminAPIKey: …
Represents an individual Admin API key in an org.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: Optional[int]
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: str
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner
id: Optional[str]
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at: Optional[int]
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name: Optional[str]
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object: Optional[str]
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role: Optional[str]
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type: Optional[str]
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value: Optional[str]
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
class AdminAPIKeyDeleteResponse: …
id: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted: Optional[bool]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
#### OrganizationUsage
##### [Audio speeches](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
admin.organization.usage.audio\_speeches(UsageAudioSpeechesParams\*\*kwargs) -\> [UsageAudioSpeechesResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
admin.organization.usage.audio\_transcriptions(UsageAudioTranscriptionsParams\*\*kwargs) -\> [UsageAudioTranscriptionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
admin.organization.usage.code\_interpreter\_sessions(UsageCodeInterpreterSessionsParams\*\*kwargs) -\> [UsageCodeInterpreterSessionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/completions)
admin.organization.usage.completions(UsageCompletionsParams\*\*kwargs) -\> [UsageCompletionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
GET/organization/usage/completions
##### [Embeddings](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
admin.organization.usage.embeddings(UsageEmbeddingsParams\*\*kwargs) -\> [UsageEmbeddingsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
GET/organization/usage/embeddings
##### [Images](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/images)
admin.organization.usage.images(UsageImagesParams\*\*kwargs) -\> [UsageImagesResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
GET/organization/usage/images
##### [Moderations](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/moderations)
admin.organization.usage.moderations(UsageModerationsParams\*\*kwargs) -\> [UsageModerationsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
GET/organization/usage/moderations
##### [Vector stores](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
admin.organization.usage.vector\_stores(UsageVectorStoresParams\*\*kwargs) -\> [UsageVectorStoresResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/costs)
admin.organization.usage.costs(UsageCostsParams\*\*kwargs) -\> [UsageCostsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)
GET/organization/costs
##### ModelsExpand Collapse
class UsageAudioSpeechesResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
class UsageAudioTranscriptionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
class UsageCodeInterpreterSessionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
class UsageCompletionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
class UsageEmbeddingsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
class UsageImagesResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
class UsageModerationsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
class UsageVectorStoresResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
class UsageCostsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)
#### OrganizationInvites
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
#### OrganizationUsers
##### [List users](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/list)
admin.organization.users.list(UserListParams\*\*kwargs) -\> SyncConversationCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/users
##### [Retrieve user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/retrieve)
admin.organization.users.retrieve(struser\_id) -\> [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/update)
admin.organization.users.update(struser\_id, UserUpdateParams\*\*kwargs) -\> [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/delete)
admin.organization.users.delete(struser\_id) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
class OrganizationUser: …
Represents an individual `user` within an organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: Literal["organization.user"]
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: Literal["owner", "reader"]
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.user.deleted"]
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
#### OrganizationUsersRoles
##### [List user organization role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
admin.organization.users.roles.list(struser\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)]
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
admin.organization.users.roles.create(struser\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
admin.organization.users.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)
DELETE/organization/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a user to a role.
object: Literal["user.role"]
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)
#### OrganizationGroups
##### [List groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/list)
admin.organization.groups.list(GroupListParams\*\*kwargs) -\> SyncCursorPage[[Group](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)]
GET/organization/groups
##### [Create group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/create)
admin.organization.groups.create(GroupCreateParams\*\*kwargs) -\> [Group](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)
POST/organization/groups
##### [Update group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/update)
admin.organization.groups.update(strgroup\_id, GroupUpdateParams\*\*kwargs) -\> [GroupUpdateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/delete)
admin.organization.groups.delete(strgroup\_id) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
class Group: …
Details about an organization group.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
class GroupUpdateResponse: …
Response returned after updating a group.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: str
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
class GroupDeleteResponse: …
Confirmation payload returned after deleting a group.
id: str
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: bool
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["group.deleted"]
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
#### OrganizationGroupsUsers
##### [List group users](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
admin.organization.groups.users.list(strgroup\_id, UserListParams\*\*kwargs) -\> SyncCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
admin.organization.groups.users.create(strgroup\_id, UserCreateParams\*\*kwargs) -\> [UserCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
admin.organization.groups.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
class UserCreateResponse: …
Confirmation payload returned after adding a user to a group.
group\_id: str
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: Literal["group.user"]
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: str
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
class UserDeleteResponse: …
Confirmation payload returned after removing a user from a group.
deleted: bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["group.user.deleted"]
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
#### OrganizationGroupsRoles
##### [List group organization role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
admin.organization.groups.roles.list(strgroup\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)]
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
admin.organization.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
admin.organization.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)
#### OrganizationRoles
##### [List organization roles](/api/reference/python/resources/admin/subresources/organization/subresources/roles/methods/list)
admin.organization.roles.list(RoleListParams\*\*kwargs) -\> SyncCursorPage[[Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)]
GET/organization/roles
##### [Create organization role](/api/reference/python/resources/admin/subresources/organization/subresources/roles/methods/create)
admin.organization.roles.create(RoleCreateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/organization/roles
##### [Update organization role](/api/reference/python/resources/admin/subresources/organization/subresources/roles/methods/update)
admin.organization.roles.update(strrole\_id, RoleUpdateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/python/resources/admin/subresources/organization/subresources/roles/methods/delete)
admin.organization.roles.delete(strrole\_id) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
class Role: …
Details about a role that can be assigned through the public Roles API.
id: str
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: Optional[str]
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: str
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: Literal["role"]
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: List[str]
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after deleting a role.
id: str
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: Literal["role.deleted"]
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
#### OrganizationCertificates
##### [List organization certificates](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/list)
admin.organization.certificates.list(CertificateListParams\*\*kwargs) -\> SyncConversationCursorPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
GET/organization/certificates
##### [Upload certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/create)
admin.organization.certificates.create(CertificateCreateParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
POST/organization/certificates
##### [Get certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
admin.organization.certificates.retrieve(strcertificate\_id, CertificateRetrieveParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/update)
admin.organization.certificates.update(strcertificate\_id, CertificateUpdateParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/delete)
admin.organization.certificates.delete(strcertificate\_id) -\> [CertificateDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/activate)
admin.organization.certificates.activate(CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
admin.organization.certificates.deactivate(CertificateDeactivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
class Certificate: …
Represents an individual `certificate` uploaded to the organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails
content: Optional[str]
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: int
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: str
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: Literal["certificate", "organization.certificate", "organization.project.certificate"]
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
"certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
"organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
"organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
active: Optional[bool]
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
class CertificateDeleteResponse: …
id: str
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: Literal["certificate.deleted"]
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
#### OrganizationProjects
##### [List projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/list)
admin.organization.projects.list(ProjectListParams\*\*kwargs) -\> SyncConversationCursorPage[[Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)]
GET/organization/projects
##### [Create project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/create)
admin.organization.projects.create(ProjectCreateParams\*\*kwargs) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects
##### [Retrieve project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
admin.organization.projects.retrieve(strproject\_id) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/update)
admin.organization.projects.update(strproject\_id, ProjectUpdateParams\*\*kwargs) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/archive)
admin.organization.projects.archive(strproject\_id) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
class Project: …
Represents an individual project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: str
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: Literal["organization.project"]
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: Literal["active", "archived"]
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: Optional[int]
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### OrganizationProjectsUsers
##### [List project users](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
admin.organization.projects.users.list(strproject\_id, UserListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)]
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
admin.organization.projects.users.create(strproject\_id, UserCreateParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
admin.organization.projects.users.retrieve(struser\_id, UserRetrieveParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
admin.organization.projects.users.update(struser\_id, UserUpdateParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
admin.organization.projects.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser: …
Represents an individual user in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: Literal["organization.project.user"]
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.user.deleted"]
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### OrganizationProjectsUsersRoles
##### [List project user role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
admin.organization.projects.users.roles.list(struser\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)]
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
admin.organization.projects.users.roles.create(struser\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
admin.organization.projects.users.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a user to a role.
object: Literal["user.role"]
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
#### OrganizationProjectsService Accounts
##### [List project service accounts](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
admin.organization.projects.service\_accounts.list(strproject\_id, ServiceAccountListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectServiceAccount](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)]
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
admin.organization.projects.service\_accounts.create(strproject\_id, ServiceAccountCreateParams\*\*kwargs) -\> [ServiceAccountCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
admin.organization.projects.service\_accounts.retrieve(strservice\_account\_id, ServiceAccountRetrieveParams\*\*kwargs) -\> [ProjectServiceAccount](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
admin.organization.projects.service\_accounts.delete(strservice\_account\_id, ServiceAccountDeleteParams\*\*kwargs) -\> [ServiceAccountDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
class ProjectServiceAccount: …
Represents an individual service account in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: str
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
class ServiceAccountCreateResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: Literal["organization.project.service\_account.api\_key"]
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: Literal["member"]
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
class ServiceAccountDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.service\_account.deleted"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
#### OrganizationProjectsAPI Keys
##### [List project API keys](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
admin.organization.projects.api\_keys.list(strproject\_id, APIKeyListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)]
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
admin.organization.projects.api\_keys.retrieve(strkey\_id, APIKeyRetrieveParams\*\*kwargs) -\> [ProjectAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
admin.organization.projects.api\_keys.delete(strkey\_id, APIKeyDeleteParams\*\*kwargs) -\> [APIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
class ProjectAPIKey: …
Represents an individual API key in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: int
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: Literal["organization.project.api\_key"]
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner
service\_account: Optional[ProjectServiceAccount]
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type: Optional[Literal["user", "service\_account"]]
`user` or `service\_account`
One of the following:
"user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user: Optional[ProjectUser]
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
class APIKeyDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.api\_key.deleted"]
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
#### OrganizationProjectsRate Limits
##### [List project rate limits](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
admin.organization.projects.rate\_limits.list\_rate\_limits(strproject\_id, RateLimitListRateLimitsParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)]
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
admin.organization.projects.rate\_limits.update\_rate\_limit(strrate\_limit\_id, RateLimitUpdateRateLimitParams\*\*kwargs) -\> [ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
class ProjectRateLimit: …
Represents a project rate limit config.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: int
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: int
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: str
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: Literal["project.rate\_limit"]
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens: Optional[int]
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Optional[int]
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Optional[int]
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Optional[int]
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### OrganizationProjectsGroups
##### [List project groups](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
admin.organization.projects.groups.list(strproject\_id, GroupListParams\*\*kwargs) -\> SyncCursorPage[[ProjectGroup](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)]
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
admin.organization.projects.groups.create(strproject\_id, GroupCreateParams\*\*kwargs) -\> [ProjectGroup](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
admin.organization.projects.groups.delete(strgroup\_id, GroupDeleteParams\*\*kwargs) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup: …
Details about a group’s membership in a project.
created\_at: int
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: str
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: str
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: Literal["project.group"]
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: str
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
class GroupDeleteResponse: …
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["project.group.deleted"]
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### OrganizationProjectsGroupsRoles
##### [List project group role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
admin.organization.projects.groups.roles.list(strgroup\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)]
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
admin.organization.projects.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
admin.organization.projects.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
#### OrganizationProjectsRoles
##### [List project roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
admin.organization.projects.roles.list(strproject\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)]
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
admin.organization.projects.roles.create(strproject\_id, RoleCreateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
admin.organization.projects.roles.update(strrole\_id, RoleUpdateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
admin.organization.projects.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after deleting a role.
id: str
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: Literal["role.deleted"]
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
#### OrganizationProjectsCertificates
##### [List project certificates](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
admin.organization.projects.certificates.list(strproject\_id, CertificateListParams\*\*kwargs) -\> SyncConversationCursorPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
admin.organization.projects.certificates.activate(strproject\_id, CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
admin.organization.projects.certificates.deactivate(strproject\_id, CertificateDeactivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/deactivate