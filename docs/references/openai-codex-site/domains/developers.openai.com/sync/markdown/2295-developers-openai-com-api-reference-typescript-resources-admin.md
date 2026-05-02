Admin | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
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
##### [List audit logs](/api/reference/typescript/resources/admin/subresources/organization/subresources/audit_logs/methods/list)
client.admin.organization.auditLogs.list(AuditLogListParams { actor\_emails, actor\_ids, after, 6 more } query?, RequestOptionsoptions?): ConversationCursorPage\<[AuditLogListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema)>) { id, actor, effective\_at, 49 more } \>
GET/organization/audit\_logs
##### ModelsExpand Collapse
AuditLogListResponse { id, actor, effective\_at, 49 more }
A log of a user action or configuration change within this organization.
id: string
The ID of this log.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) id>)
actor: Actor { api\_key, session, type }
The actor who performed the audit logged action.
api\_key?: APIKey { id, service\_account, type, user }
The API Key used to perform the audit logged action.
id?: string
The tracking id of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) id>)
service\_account?: ServiceAccount { id }
The service account that performed the audit logged action.
id?: string
The service account id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) service_account > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) service_account>)
type?: "user" | "service\_account"
The type of API key. Can be either `user` or `service\_account`.
One of the following:
"user"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) type>)
user?: User { id, email }
The user who performed the audit logged action.
id?: string
The user id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user > (property) id>)
email?: string
The user email.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) api_key>)
session?: Session { ip\_address, user }
The session in which the audit logged action was performed.
ip\_address?: string
The IP address from which the action was performed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) ip_address>)
user?: User { id, email }
The user who performed the audit logged action.
id?: string
The user id.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user > (property) id>)
email?: string
The user email.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user > (property) email>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session > (property) user>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) session>)
type?: "session" | "api\_key"
The type of actor. Is either `session` or `api\_key`.
One of the following:
"session"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type > (member) 0>)
"api\_key"
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type > (member) 1>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor > (property) type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) actor>)
effective\_at: number
The Unix timestamp (in seconds) of the event.
formatunixtime
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) effective_at>)
type: "api\_key.created" | "api\_key.updated" | "api\_key.deleted" | 48 more
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
"api\_key.created"?: APIKeyCreated { id, data }
The details for events with this `type`.
id?: string
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) id>)
data?: Data { scopes }
The payload used to create the API key.
scopes?: Array\<string\>
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) data > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.created>)
"api\_key.deleted"?: APIKeyDeleted { id }
The details for events with this `type`.
id?: string
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.deleted>)
"api\_key.updated"?: APIKeyUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) id>)
changes\_requested?: ChangesRequested { scopes }
The payload used to update the API key.
scopes?: Array\<string\>
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) changes_requested > (property) scopes>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) api_key.updated>)
"certificate.created"?: CertificateCreated { id, name }
The details for events with this `type`.
id?: string
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created > (property) id>)
name?: string
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.created>)
"certificate.deleted"?: CertificateDeleted { id, certificate, name }
The details for events with this `type`.
id?: string
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) id>)
certificate?: string
The certificate content in PEM format.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) certificate>)
name?: string
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.deleted>)
"certificate.updated"?: CertificateUpdated { id, name }
The details for events with this `type`.
id?: string
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated > (property) id>)
name?: string
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificate.updated>)
"certificates.activated"?: CertificatesActivated { certificates }
The details for events with this `type`.
certificates?: Array\<Certificate\>
id?: string
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) id>)
name?: string
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.activated>)
"certificates.deactivated"?: CertificatesDeactivated { certificates }
The details for events with this `type`.
certificates?: Array\<Certificate\>
id?: string
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) id>)
name?: string
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated > (property) certificates>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) certificates.deactivated>)
"checkpoint.permission.created"?: CheckpointPermissionCreated { id, data }
The project and fine-tuned model checkpoint that the checkpoint permission was created for.
id?: string
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) id>)
data?: Data { fine\_tuned\_model\_checkpoint, project\_id }
The payload used to create the checkpoint permission.
fine\_tuned\_model\_checkpoint?: string
The ID of the fine-tuned model checkpoint.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data > (property) fine_tuned_model_checkpoint>)
project\_id?: string
The ID of the project that the checkpoint permission was created for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data > (property) project_id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.created>)
"checkpoint.permission.deleted"?: CheckpointPermissionDeleted { id }
The details for events with this `type`.
id?: string
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) checkpoint.permission.deleted>)
"external\_key.registered"?: ExternalKeyRegistered { id, data }
The details for events with this `type`.
id?: string
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered > (property) id>)
data?: unknown
The configuration for the external key.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.registered>)
"external\_key.removed"?: ExternalKeyRemoved { id }
The details for events with this `type`.
id?: string
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.removed > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) external_key.removed>)
"group.created"?: GroupCreated { id, data }
The details for events with this `type`.
id?: string
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) id>)
data?: Data { group\_name }
Information about the created group.
group\_name?: string
The group name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) data > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.created>)
"group.deleted"?: GroupDeleted { id }
The details for events with this `type`.
id?: string
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.deleted>)
"group.updated"?: GroupUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) id>)
changes\_requested?: ChangesRequested { group\_name }
The payload used to update the group.
group\_name?: string
The updated group name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) changes_requested > (property) group_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) group.updated>)
"invite.accepted"?: InviteAccepted { id }
The details for events with this `type`.
id?: string
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.accepted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.accepted>)
"invite.deleted"?: InviteDeleted { id }
The details for events with this `type`.
id?: string
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.deleted>)
"invite.sent"?: InviteSent { id, data }
The details for events with this `type`.
id?: string
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) id>)
data?: Data { email, role }
The payload used to create the invite.
email?: string
The email invited to the organization.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data > (property) email>)
role?: string
The role the email was invited to be. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) invite.sent>)
"ip\_allowlist.config.activated"?: IPAllowlistConfigActivated { configs }
The details for events with this `type`.
configs?: Array\<Config\>
The configurations that were activated.
id?: string
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) id>)
name?: string
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.activated>)
"ip\_allowlist.config.deactivated"?: IPAllowlistConfigDeactivated { configs }
The details for events with this `type`.
configs?: Array\<Config\>
The configurations that were deactivated.
id?: string
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) id>)
name?: string
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs > (items) > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated > (property) configs>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.config.deactivated>)
"ip\_allowlist.created"?: IPAllowlistCreated { id, allowed\_ips, name }
The details for events with this `type`.
id?: string
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) id>)
allowed\_ips?: Array\<string\>
The IP addresses or CIDR ranges included in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) allowed_ips>)
name?: string
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.created>)
"ip\_allowlist.deleted"?: IPAllowlistDeleted { id, allowed\_ips, name }
The details for events with this `type`.
id?: string
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) id>)
allowed\_ips?: Array\<string\>
The IP addresses or CIDR ranges that were in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) allowed_ips>)
name?: string
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.deleted>)
"ip\_allowlist.updated"?: IPAllowlistUpdated { id, allowed\_ips }
The details for events with this `type`.
id?: string
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated > (property) id>)
allowed\_ips?: Array\<string\>
The updated set of IP addresses or CIDR ranges in the configuration.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated > (property) allowed_ips>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) ip_allowlist.updated>)
"login.failed"?: LoginFailed { error\_code, error\_message }
The details for events with this `type`.
error\_code?: string
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed > (property) error_code>)
error\_message?: string
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.failed>)
"login.succeeded"?: unknown
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) login.succeeded>)
"logout.failed"?: LogoutFailed { error\_code, error\_message }
The details for events with this `type`.
error\_code?: string
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed > (property) error_code>)
error\_message?: string
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed > (property) error_message>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.failed>)
"logout.succeeded"?: unknown
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) logout.succeeded>)
"organization.updated"?: OrganizationUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The organization ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) id>)
changes\_requested?: ChangesRequested { api\_call\_logging, api\_call\_logging\_project\_ids, description, 4 more }
The payload used to update the organization settings.
api\_call\_logging?: string
How your organization logs data from supported API calls. One of `disabled`, `enabled\_per\_call`, `enabled\_for\_all\_projects`, or `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging>)
api\_call\_logging\_project\_ids?: string
The list of project ids if api\_call\_logging is set to `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) api_call_logging_project_ids>)
description?: string
The organization description.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) description>)
name?: string
The organization name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) name>)
threads\_ui\_visibility?: string
Visibility of the threads page which shows messages created with the Assistants API and Playground. One of `ANY\_ROLE`, `OWNERS`, or `NONE`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) threads_ui_visibility>)
title?: string
The organization title.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) title>)
usage\_dashboard\_visibility?: string
Visibility of the usage dashboard which shows activity and costs for your organization. One of `ANY\_ROLE` or `OWNERS`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested > (property) usage_dashboard_visibility>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) organization.updated>)
project?: Project { id, name }
The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project > (property) id>)
name?: string
The project title.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project > (property) name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project>)
"project.archived"?: ProjectArchived { id }
The details for events with this `type`.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.archived > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.archived>)
"project.created"?: ProjectCreated { id, data }
The details for events with this `type`.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) id>)
data?: Data { name, title }
The payload used to create the project.
name?: string
The project name.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data > (property) name>)
title?: string
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.created>)
"project.deleted"?: ProjectDeleted { id }
The details for events with this `type`.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.deleted>)
"project.updated"?: ProjectUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) id>)
changes\_requested?: ChangesRequested { title }
The payload used to update the project.
title?: string
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) changes_requested > (property) title>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) project.updated>)
"rate\_limit.deleted"?: RateLimitDeleted { id }
The details for events with this `type`.
id?: string
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.deleted>)
"rate\_limit.updated"?: RateLimitUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) id>)
changes\_requested?: ChangesRequested { batch\_1\_day\_max\_input\_tokens, max\_audio\_megabytes\_per\_1\_minute, max\_images\_per\_1\_minute, 3 more }
The payload used to update the rate limits.
batch\_1\_day\_max\_input\_tokens?: number
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute?: number
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute?: number
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day?: number
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_day>)
max\_requests\_per\_1\_minute?: number
The maximum requests per minute.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute?: number
The maximum tokens per minute.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested > (property) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) rate_limit.updated>)
"role.assignment.created"?: RoleAssignmentCreated { id, principal\_id, principal\_type, 2 more }
The details for events with this `type`.
id?: string
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) id>)
principal\_id?: string
The principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) principal_id>)
principal\_type?: string
The type of principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) principal_type>)
resource\_id?: string
The resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) resource_id>)
resource\_type?: string
The type of resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.created>)
"role.assignment.deleted"?: RoleAssignmentDeleted { id, principal\_id, principal\_type, 2 more }
The details for events with this `type`.
id?: string
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) id>)
principal\_id?: string
The principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) principal_id>)
principal\_type?: string
The type of principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) principal_type>)
resource\_id?: string
The resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) resource_id>)
resource\_type?: string
The type of resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted > (property) resource_type>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.assignment.deleted>)
"role.created"?: RoleCreated { id, permissions, resource\_id, 2 more }
The details for events with this `type`.
id?: string
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) id>)
permissions?: Array\<string\>
The permissions granted by the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) permissions>)
resource\_id?: string
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) resource_id>)
resource\_type?: string
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) resource_type>)
role\_name?: string
The name of the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.created>)
"role.deleted"?: RoleDeleted { id }
The details for events with this `type`.
id?: string
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.deleted>)
"role.updated"?: RoleUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The role ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) id>)
changes\_requested?: ChangesRequested { description, metadata, permissions\_added, 4 more }
The payload used to update the role.
description?: string
The updated role description, when provided.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) description>)
metadata?: unknown
Additional metadata stored on the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) metadata>)
permissions\_added?: Array\<string\>
The permissions added to the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_added>)
permissions\_removed?: Array\<string\>
The permissions removed from the role.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) permissions_removed>)
resource\_id?: string
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) resource_id>)
resource\_type?: string
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) resource_type>)
role\_name?: string
The updated role name, when provided.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested > (property) role_name>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) role.updated>)
"scim.disabled"?: ScimDisabled { id }
The details for events with this `type`.
id?: string
The ID of the SCIM was disabled for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.disabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.disabled>)
"scim.enabled"?: ScimEnabled { id }
The details for events with this `type`.
id?: string
The ID of the SCIM was enabled for.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.enabled > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) scim.enabled>)
"service\_account.created"?: ServiceAccountCreated { id, data }
The details for events with this `type`.
id?: string
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) id>)
data?: Data { role }
The payload used to create the service account.
role?: string
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.created>)
"service\_account.deleted"?: ServiceAccountDeleted { id }
The details for events with this `type`.
id?: string
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.deleted>)
"service\_account.updated"?: ServiceAccountUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The service account ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) id>)
changes\_requested?: ChangesRequested { role }
The payload used to updated the service account.
role?: string
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) service_account.updated>)
"user.added"?: UserAdded { id, data }
The details for events with this `type`.
id?: string
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) id>)
data?: Data { role }
The payload used to add the user to the project.
role?: string
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) data > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added > (property) data>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.added>)
"user.deleted"?: UserDeleted { id }
The details for events with this `type`.
id?: string
The user ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.deleted > (property) id>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.deleted>)
"user.updated"?: UserUpdated { id, changes\_requested }
The details for events with this `type`.
id?: string
The project ID.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) id>)
changes\_requested?: ChangesRequested { role }
The payload used to update the user.
role?: string
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) changes_requested > (property) role>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated > (property) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema) > (property) user.updated>)
[](<#(resource) admin.organization.audit_logs > (model) audit_log_list_response > (schema)>)
#### AdminOrganizationAdmin API Keys
##### [List all organization and project API keys.](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
client.admin.organization.adminAPIKeys.list(AdminAPIKeyListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more } \>
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
client.admin.organization.adminAPIKeys.create(AdminAPIKeyCreateParams { name } body, RequestOptionsoptions?): [AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more }
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
client.admin.organization.adminAPIKeys.retrieve(stringkeyID, RequestOptionsoptions?): [AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more }
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
client.admin.organization.adminAPIKeys.delete(stringkeyID, RequestOptionsoptions?): [AdminAPIKeyDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
AdminAPIKey { id, created\_at, last\_used\_at, 5 more }
Represents an individual Admin API key in an org.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: number | null
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: string
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: string
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner { id, created\_at, name, 3 more }
id?: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at?: number
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name?: string
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object?: string
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role?: string
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type?: string
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: string
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value?: string
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
AdminAPIKeyDeleteResponse { id, deleted, object }
id?: string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted?: boolean
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object?: string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
#### AdminOrganizationUsage
##### [Audio speeches](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
client.admin.organization.usage.audioSpeeches(UsageAudioSpeechesParams { start\_time, api\_key\_ids, bucket\_width, 7 more } query, RequestOptionsoptions?): [UsageAudioSpeechesResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
client.admin.organization.usage.audioTranscriptions(UsageAudioTranscriptionsParams { start\_time, api\_key\_ids, bucket\_width, 7 more } query, RequestOptionsoptions?): [UsageAudioTranscriptionsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
client.admin.organization.usage.codeInterpreterSessions(UsageCodeInterpreterSessionsParams { start\_time, bucket\_width, end\_time, 4 more } query, RequestOptionsoptions?): [UsageCodeInterpreterSessionsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/completions)
client.admin.organization.usage.completions(UsageCompletionsParams { start\_time, api\_key\_ids, batch, 8 more } query, RequestOptionsoptions?): [UsageCompletionsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/completions
##### [Embeddings](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
client.admin.organization.usage.embeddings(UsageEmbeddingsParams { start\_time, api\_key\_ids, bucket\_width, 7 more } query, RequestOptionsoptions?): [UsageEmbeddingsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/embeddings
##### [Images](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/images)
client.admin.organization.usage.images(UsageImagesParams { start\_time, api\_key\_ids, bucket\_width, 9 more } query, RequestOptionsoptions?): [UsageImagesResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_images_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/images
##### [Moderations](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/moderations)
client.admin.organization.usage.moderations(UsageModerationsParams { start\_time, api\_key\_ids, bucket\_width, 7 more } query, RequestOptionsoptions?): [UsageModerationsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/moderations
##### [Vector stores](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
client.admin.organization.usage.vectorStores(UsageVectorStoresParams { start\_time, bucket\_width, end\_time, 4 more } query, RequestOptionsoptions?): [UsageVectorStoresResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/typescript/resources/admin/subresources/organization/subresources/usage/methods/costs)
client.admin.organization.usage.costs(UsageCostsParams { start\_time, api\_key\_ids, bucket\_width, 5 more } query, RequestOptionsoptions?): [UsageCostsResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/costs
##### ModelsExpand Collapse
UsageAudioSpeechesResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
UsageAudioTranscriptionsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
UsageCodeInterpreterSessionsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
UsageCompletionsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
UsageEmbeddingsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
UsageImagesResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
UsageModerationsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
UsageVectorStoresResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
UsageCostsResponse { data, has\_more, next\_page, object }
data: Array\<Data\>
end\_time: number
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) end_time>)
object: "bucket"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) object>)
result: Array\<OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more } | OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more } | OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more } | 6 more\>
One of the following:
OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: number
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: "organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: number
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch?: boolean | null
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens?: number
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens?: number
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens?: number
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier?: string | null
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: "organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: number
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: "organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: number
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: "organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size?: string | null
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source?: string | null
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: number
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: "organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: number
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: "organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: number
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model?: string | null
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id?: string | null
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: "organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: number
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: "organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions?: number
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: "organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount?: Amount { currency, value }
The monetary value in its associated currency.
currency?: string
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value?: number
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id?: string | null
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item?: string | null
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id?: string | null
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result>)
start\_time: number
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) has_more>)
next\_page: string
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) next_page>)
object: "page"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)
#### AdminOrganizationInvites
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
#### AdminOrganizationUsers
##### [List users](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/methods/list)
client.admin.organization.users.list(UserListParams { after, emails, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/users
##### [Retrieve user](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/methods/retrieve)
client.admin.organization.users.retrieve(stringuserID, RequestOptionsoptions?): [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/methods/update)
client.admin.organization.users.update(stringuserID, UserUpdateParams { role } body, RequestOptionsoptions?): [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/methods/delete)
client.admin.organization.users.delete(stringuserID, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
OrganizationUser { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
UserDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.user.deleted"
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
#### AdminOrganizationUsersRoles
##### [List user organization role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
client.admin.organization.users.roles.list(stringuserID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
client.admin.organization.users.roles.create(stringuserID, RoleCreateParams { role\_id } body, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
client.admin.organization.users.roles.delete(stringroleID, RoleDeleteParams { user\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/organization/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationGroups
##### [List groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/methods/list)
client.admin.organization.groups.list(GroupListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Group](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) { id, created\_at, is\_scim\_managed, name } \>
GET/organization/groups
##### [Create group](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/methods/create)
client.admin.organization.groups.create(GroupCreateParams { name } body, RequestOptionsoptions?): [Group](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) { id, created\_at, is\_scim\_managed, name }
POST/organization/groups
##### [Update group](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/methods/update)
client.admin.organization.groups.update(stringgroupID, GroupUpdateParams { name } body, RequestOptionsoptions?): [GroupUpdateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>) { id, created\_at, is\_scim\_managed, name }
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/methods/delete)
client.admin.organization.groups.delete(stringgroupID, RequestOptionsoptions?): [GroupDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
Group { id, created\_at, is\_scim\_managed, name }
Details about an organization group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
GroupUpdateResponse { id, created\_at, is\_scim\_managed, name }
Response returned after updating a group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: string
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
GroupDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a group.
id: string
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "group.deleted"
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
#### AdminOrganizationGroupsUsers
##### [List group users](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
client.admin.organization.groups.users.list(stringgroupID, UserListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
client.admin.organization.groups.users.create(stringgroupID, UserCreateParams { user\_id } body, RequestOptionsoptions?): [UserCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>) { group\_id, object, user\_id }
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
client.admin.organization.groups.users.delete(stringuserID, UserDeleteParams { group\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
UserCreateResponse { group\_id, object, user\_id }
Confirmation payload returned after adding a user to a group.
group\_id: string
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: "group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: string
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
UserDeleteResponse { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: boolean
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
#### AdminOrganizationGroupsRoles
##### [List group organization role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
client.admin.organization.groups.roles.list(stringgroupID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
client.admin.organization.groups.roles.create(stringgroupID, RoleCreateParams { role\_id } body, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
client.admin.organization.groups.roles.delete(stringroleID, RoleDeleteParams { group\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group { id, created\_at, name, 2 more }
Summary information about a group returned in role assignment responses.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: "group"
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: boolean
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: "group.role"
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationRoles
##### [List organization roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/list)
client.admin.organization.roles.list(RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/organization/roles
##### [Create organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/create)
client.admin.organization.roles.create(RoleCreateParams { permissions, role\_name, description } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles
##### [Update organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/update)
client.admin.organization.roles.update(stringroleID, RoleUpdateParams { description, permissions, role\_name } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/delete)
client.admin.organization.roles.delete(stringroleID, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
Role { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string | null
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array\<string\>
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationCertificates
##### [List organization certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/list)
client.admin.organization.certificates.list(CertificateListParams { after, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/certificates
##### [Upload certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/create)
client.admin.organization.certificates.create(CertificateCreateParams { content, name } body, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates
##### [Get certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
client.admin.organization.certificates.retrieve(stringcertificateID, CertificateRetrieveParams { include } query?, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/update)
client.admin.organization.certificates.update(stringcertificateID, CertificateUpdateParams { name } body, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/delete)
client.admin.organization.certificates.delete(stringcertificateID, RequestOptionsoptions?): [CertificateDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>) { id, object }
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/activate)
client.admin.organization.certificates.activate(CertificateActivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
client.admin.organization.certificates.deactivate(CertificateDeactivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
Certificate { id, certificate\_details, created\_at, 3 more }
Represents an individual `certificate` uploaded to the organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails { content, expires\_at, valid\_at }
content?: string
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at?: number
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at?: number
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: number
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: string
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: "certificate" | "organization.certificate" | "organization.project.certificate"
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
active?: boolean
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
CertificateDeleteResponse { id, object }
id: string
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: "certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
#### AdminOrganizationProjects
##### [List projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/list)
client.admin.organization.projects.list(ProjectListParams { after, include\_archived, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more } \>
GET/organization/projects
##### [Create project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/create)
client.admin.organization.projects.create(ProjectCreateParams { name, geography } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects
##### [Retrieve project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
client.admin.organization.projects.retrieve(stringprojectID, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/update)
client.admin.organization.projects.update(stringprojectID, ProjectUpdateParams { name } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/archive)
client.admin.organization.projects.archive(stringprojectID, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
Project { id, created\_at, name, 3 more }
Represents an individual project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: "organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: "active" | "archived"
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at?: number | null
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### AdminOrganizationProjectsUsers
##### [List project users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
client.admin.organization.projects.users.list(stringprojectID, UserListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
client.admin.organization.projects.users.create(stringprojectID, UserCreateParams { role, user\_id } body, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
client.admin.organization.projects.users.retrieve(stringuserID, UserRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
client.admin.organization.projects.users.update(stringuserID, UserUpdateParams { project\_id, role } params, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
client.admin.organization.projects.users.delete(stringuserID, UserDeleteParams { project\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
ProjectUser { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: "organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
UserDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### AdminOrganizationProjectsUsersRoles
##### [List project user role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.admin.organization.projects.users.roles.list(stringuserID, RoleListParams { project\_id, after, limit, order } params, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.admin.organization.projects.users.roles.create(stringuserID, RoleCreateParams { project\_id, role\_id } params, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.admin.organization.projects.users.roles.delete(stringroleID, RoleDeleteParams { project\_id, user\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationProjectsService Accounts
##### [List project service accounts](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
client.admin.organization.projects.serviceAccounts.list(stringprojectID, ServiceAccountListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more } \>
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
client.admin.organization.projects.serviceAccounts.create(stringprojectID, ServiceAccountCreateParams { name } body, RequestOptionsoptions?): [ServiceAccountCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>) { id, api\_key, created\_at, 3 more }
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
client.admin.organization.projects.serviceAccounts.retrieve(stringserviceAccountID, ServiceAccountRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
client.admin.organization.projects.serviceAccounts.delete(stringserviceAccountID, ServiceAccountDeleteParams { project\_id } params, RequestOptionsoptions?): [ServiceAccountDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
ProjectServiceAccount { id, created\_at, name, 2 more }
Represents an individual service account in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: "organization.project.service\_account"
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
ServiceAccountCreateResponse { id, api\_key, created\_at, 3 more }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey { id, created\_at, name, 2 more }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: "organization.project.service\_account.api\_key"
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: "organization.project.service\_account"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: "member"
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
ServiceAccountDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: "organization.project.service\_account.deleted"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
#### AdminOrganizationProjectsAPI Keys
##### [List project API keys](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
client.admin.organization.projects.apiKeys.list(stringprojectID, APIKeyListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more } \>
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
client.admin.organization.projects.apiKeys.retrieve(stringkeyID, APIKeyRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more }
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
client.admin.organization.projects.apiKeys.delete(stringkeyID, APIKeyDeleteParams { project\_id } params, RequestOptionsoptions?): [APIKeyDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
ProjectAPIKey { id, created\_at, last\_used\_at, 4 more }
Represents an individual API key in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: number
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: string
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: "organization.project.api\_key"
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner { service\_account, type, user }
service\_account?: [ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type?: "user" | "service\_account"
`user` or `service\_account`
One of the following:
"user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user?: [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: string
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
APIKeyDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: "organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
#### AdminOrganizationProjectsRate Limits
##### [List project rate limits](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
client.admin.organization.projects.rateLimits.listRateLimits(stringprojectID, RateLimitListRateLimitsParams { after, before, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectRateLimit](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more } \>
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
client.admin.organization.projects.rateLimits.updateRateLimit(stringrateLimitID, RateLimitUpdateRateLimitParams { project\_id, batch\_1\_day\_max\_input\_tokens, max\_audio\_megabytes\_per\_1\_minute, 4 more } params, RequestOptionsoptions?): [ProjectRateLimit](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
ProjectRateLimit { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
Represents a project rate limit config.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: number
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: number
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: "project.rate\_limit"
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens?: number
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute?: number
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute?: number
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day?: number
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### AdminOrganizationProjectsGroups
##### [List project groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
client.admin.organization.projects.groups.list(stringprojectID, GroupListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[ProjectGroup](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more } \>
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
client.admin.organization.projects.groups.create(stringprojectID, GroupCreateParams { group\_id, role } body, RequestOptionsoptions?): [ProjectGroup](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
client.admin.organization.projects.groups.delete(stringgroupID, GroupDeleteParams { project\_id } params, RequestOptionsoptions?): [GroupDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
ProjectGroup { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
created\_at: number
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: "project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: boolean
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### AdminOrganizationProjectsGroupsRoles
##### [List project group role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.admin.organization.projects.groups.roles.list(stringgroupID, RoleListParams { project\_id, after, limit, order } params, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.admin.organization.projects.groups.roles.create(stringgroupID, RoleCreateParams { project\_id, role\_id } params, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.admin.organization.projects.groups.roles.delete(stringroleID, RoleDeleteParams { project\_id, group\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group { id, created\_at, name, 2 more }
Summary information about a group returned in role assignment responses.
id: string
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: string
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: "group"
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: boolean
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: "group.role"
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationProjectsRoles
##### [List project roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.admin.organization.projects.roles.list(stringprojectID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.admin.organization.projects.roles.create(stringprojectID, RoleCreateParams { permissions, role\_name, description } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.admin.organization.projects.roles.update(stringroleID, RoleUpdateParams { project\_id, description, permissions, role\_name } params, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.admin.organization.projects.roles.delete(stringroleID, RoleDeleteParams { project\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
#### AdminOrganizationProjectsCertificates
##### [List project certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.admin.organization.projects.certificates.list(stringprojectID, CertificateListParams { after, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.admin.organization.projects.certificates.activate(stringprojectID, CertificateActivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.admin.organization.projects.certificates.deactivate(stringprojectID, CertificateDeactivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate