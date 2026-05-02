Audit Logs | OpenAI API Reference
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
# Audit Logs
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