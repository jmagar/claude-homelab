Audit Logs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Audit Logs
List user actions and configuration changes within this organization.
#### data openai\_admin\_organization\_audit\_logs
##### optional Expand Collapse
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) before>)
actor\_emails?: List[String]
Return only events performed by users with these emails.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) actor_emails>)
actor\_ids?: List[String]
Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) actor_ids>)
event\_types?: List[String]
Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](https://platform.openai.com/docs/api-reference/audit-logs/object).
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) event_types>)
project\_ids?: List[String]
Return only events for these projects.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) project_ids>)
resource\_ids?: List[String]
Return only events performed on these targets. For example, a project ID updated.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) resource_ids>)
effective\_at?: Attributes
Return only events whose `effective\_at` (Unix seconds) is in this range.
gt?: Int64
Return only events whose `effective\_at` (Unix seconds) is greater than this value.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) effective_at > (attribute) gt>)
gte?: Int64
Return only events whose `effective\_at` (Unix seconds) is greater than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) effective_at > (attribute) gte>)
lt?: Int64
Return only events whose `effective\_at` (Unix seconds) is less than this value.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) effective_at > (attribute) lt>)
lte?: Int64
Return only events whose `effective\_at` (Unix seconds) is less than or equal to this value.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) effective_at > (attribute) lte>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) effective_at>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The ID of this log.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) id>)
actor: Attributes
The actor who performed the audit logged action.
api\_key: Attributes
The API Key used to perform the audit logged action.
id: String
The tracking id of the API key.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) id>)
service\_account: Attributes
The service account that performed the audit logged action.
id: String
The service account id.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) service_account > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) service_account>)
type: String
The type of API key. Can be either `user` or `service\_account`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) type>)
user: Attributes
The user who performed the audit logged action.
id: String
The user id.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) user > (attribute) id>)
email: String
The user email.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) user > (attribute) email>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key > (attribute) user>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) api_key>)
session: Attributes
The session in which the audit logged action was performed.
ip\_address: String
The IP address from which the action was performed.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) session > (attribute) ip_address>)
user: Attributes
The user who performed the audit logged action.
id: String
The user id.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) session > (attribute) user > (attribute) id>)
email: String
The user email.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) session > (attribute) user > (attribute) email>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) session > (attribute) user>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) session>)
type: String
The type of actor. Is either `session` or `api\_key`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor > (attribute) type>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) actor>)
effective\_at: Int64
The Unix timestamp (in seconds) of the event.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) effective_at>)
type: String
The event type.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) type>)
api\_key\_created: Attributes
The details for events with this `type`.
id: String
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_created > (attribute) id>)
data: Attributes
The payload used to create the API key.
scopes: List[String]
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_created > (attribute) data > (attribute) scopes>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_created > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_created>)
api\_key\_deleted: Attributes
The details for events with this `type`.
id: String
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_deleted>)
api\_key\_updated: Attributes
The details for events with this `type`.
id: String
The tracking ID of the API key.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the API key.
scopes: List[String]
A list of scopes allowed for the API key, e.g. `["api.model.request"]`
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_updated > (attribute) changes_requested > (attribute) scopes>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) api_key_updated>)
certificate\_created: Attributes
The details for events with this `type`.
id: String
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_created > (attribute) id>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_created > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_created>)
certificate\_deleted: Attributes
The details for events with this `type`.
id: String
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_deleted > (attribute) id>)
certificate: String
The certificate content in PEM format.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_deleted > (attribute) certificate>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_deleted > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_deleted>)
certificate\_updated: Attributes
The details for events with this `type`.
id: String
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_updated > (attribute) id>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_updated > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificate_updated>)
certificates\_activated: Attributes
The details for events with this `type`.
certificates: List[Attributes]
id: String
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_activated > (attribute) certificates > (attribute) id>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_activated > (attribute) certificates > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_activated > (attribute) certificates>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_activated>)
certificates\_deactivated: Attributes
The details for events with this `type`.
certificates: List[Attributes]
id: String
The certificate ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_deactivated > (attribute) certificates > (attribute) id>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_deactivated > (attribute) certificates > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_deactivated > (attribute) certificates>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) certificates_deactivated>)
checkpoint\_permission\_created: Attributes
The project and fine-tuned model checkpoint that the checkpoint permission was created for.
id: String
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_created > (attribute) id>)
data: Attributes
The payload used to create the checkpoint permission.
fine\_tuned\_model\_checkpoint: String
The ID of the fine-tuned model checkpoint.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_created > (attribute) data > (attribute) fine_tuned_model_checkpoint>)
project\_id: String
The ID of the project that the checkpoint permission was created for.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_created > (attribute) data > (attribute) project_id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_created > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_created>)
checkpoint\_permission\_deleted: Attributes
The details for events with this `type`.
id: String
The ID of the checkpoint permission.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) checkpoint_permission_deleted>)
external\_key\_registered: Attributes
The details for events with this `type`.
id: String
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) external_key_registered > (attribute) id>)
data: JSON
The configuration for the external key.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) external_key_registered > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) external_key_registered>)
external\_key\_removed: Attributes
The details for events with this `type`.
id: String
The ID of the external key configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) external_key_removed > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) external_key_removed>)
group\_created: Attributes
The details for events with this `type`.
id: String
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_created > (attribute) id>)
data: Attributes
Information about the created group.
group\_name: String
The group name.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_created > (attribute) data > (attribute) group_name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_created > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_created>)
group\_deleted: Attributes
The details for events with this `type`.
id: String
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_deleted>)
group\_updated: Attributes
The details for events with this `type`.
id: String
The ID of the group.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the group.
group\_name: String
The updated group name.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_updated > (attribute) changes_requested > (attribute) group_name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) group_updated>)
invite\_accepted: Attributes
The details for events with this `type`.
id: String
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_accepted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_accepted>)
invite\_deleted: Attributes
The details for events with this `type`.
id: String
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_deleted>)
invite\_sent: Attributes
The details for events with this `type`.
id: String
The ID of the invite.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_sent > (attribute) id>)
data: Attributes
The payload used to create the invite.
email: String
The email invited to the organization.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_sent > (attribute) data > (attribute) email>)
role: String
The role the email was invited to be. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_sent > (attribute) data > (attribute) role>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_sent > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) invite_sent>)
ip\_allowlist\_config\_activated: Attributes
The details for events with this `type`.
configs: List[Attributes]
The configurations that were activated.
id: String
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_activated > (attribute) configs > (attribute) id>)
name: String
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_activated > (attribute) configs > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_activated > (attribute) configs>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_activated>)
ip\_allowlist\_config\_deactivated: Attributes
The details for events with this `type`.
configs: List[Attributes]
The configurations that were deactivated.
id: String
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_deactivated > (attribute) configs > (attribute) id>)
name: String
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_deactivated > (attribute) configs > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_deactivated > (attribute) configs>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_config_deactivated>)
ip\_allowlist\_created: Attributes
The details for events with this `type`.
id: String
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_created > (attribute) id>)
allowed\_ips: List[String]
The IP addresses or CIDR ranges included in the configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_created > (attribute) allowed_ips>)
name: String
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_created > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_created>)
ip\_allowlist\_deleted: Attributes
The details for events with this `type`.
id: String
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_deleted > (attribute) id>)
allowed\_ips: List[String]
The IP addresses or CIDR ranges that were in the configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_deleted > (attribute) allowed_ips>)
name: String
The name of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_deleted > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_deleted>)
ip\_allowlist\_updated: Attributes
The details for events with this `type`.
id: String
The ID of the IP allowlist configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_updated > (attribute) id>)
allowed\_ips: List[String]
The updated set of IP addresses or CIDR ranges in the configuration.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_updated > (attribute) allowed_ips>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) ip_allowlist_updated>)
login\_failed: Attributes
The details for events with this `type`.
error\_code: String
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) login_failed > (attribute) error_code>)
error\_message: String
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) login_failed > (attribute) error_message>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) login_failed>)
login\_succeeded: JSON
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) login_succeeded>)
logout\_failed: Attributes
The details for events with this `type`.
error\_code: String
The error code of the failure.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) logout_failed > (attribute) error_code>)
error\_message: String
The error message of the failure.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) logout_failed > (attribute) error_message>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) logout_failed>)
logout\_succeeded: JSON
This event has no additional fields beyond the standard audit log attributes.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) logout_succeeded>)
organization\_updated: Attributes
The details for events with this `type`.
id: String
The organization ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the organization settings.
api\_call\_logging: String
How your organization logs data from supported API calls. One of `disabled`, `enabled\_per\_call`, `enabled\_for\_all\_projects`, or `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) api_call_logging>)
api\_call\_logging\_project\_ids: String
The list of project ids if api\_call\_logging is set to `enabled\_for\_selected\_projects`
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) api_call_logging_project_ids>)
description: String
The organization description.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) description>)
name: String
The organization name.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) name>)
threads\_ui\_visibility: String
Visibility of the threads page which shows messages created with the Assistants API and Playground. One of `ANY\_ROLE`, `OWNERS`, or `NONE`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) threads_ui_visibility>)
title: String
The organization title.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) title>)
usage\_dashboard\_visibility: String
Visibility of the usage dashboard which shows activity and costs for your organization. One of `ANY\_ROLE` or `OWNERS`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested > (attribute) usage_dashboard_visibility>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) organization_updated>)
project: Attributes
The project that the action was scoped to. Absent for actions not scoped to projects. Note that any admin actions taken via Admin API keys are associated with the default project.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project > (attribute) id>)
name: String
The project title.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project > (attribute) name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project>)
project\_archived: Attributes
The details for events with this `type`.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_archived > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_archived>)
project\_created: Attributes
The details for events with this `type`.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_created > (attribute) id>)
data: Attributes
The payload used to create the project.
name: String
The project name.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_created > (attribute) data > (attribute) name>)
title: String
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_created > (attribute) data > (attribute) title>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_created > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_created>)
project\_deleted: Attributes
The details for events with this `type`.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_deleted>)
project\_updated: Attributes
The details for events with this `type`.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the project.
title: String
The title of the project as seen on the dashboard.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_updated > (attribute) changes_requested > (attribute) title>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) project_updated>)
rate\_limit\_deleted: Attributes
The details for events with this `type`.
id: String
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_deleted>)
rate\_limit\_updated: Attributes
The details for events with this `type`.
id: String
The rate limit ID
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the rate limits.
batch\_1\_day\_max\_input\_tokens: Int64
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Int64
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Int64
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Int64
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) max_requests_per_1_day>)
max\_requests\_per\_1\_minute: Int64
The maximum requests per minute.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: Int64
The maximum tokens per minute.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested > (attribute) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) rate_limit_updated>)
role\_assignment\_created: Attributes
The details for events with this `type`.
id: String
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created > (attribute) id>)
principal\_id: String
The principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created > (attribute) principal_id>)
principal\_type: String
The type of principal (user or group) that received the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created > (attribute) principal_type>)
resource\_id: String
The resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created > (attribute) resource_id>)
resource\_type: String
The type of resource the role assignment is scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created > (attribute) resource_type>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_created>)
role\_assignment\_deleted: Attributes
The details for events with this `type`.
id: String
The identifier of the role assignment.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted > (attribute) id>)
principal\_id: String
The principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted > (attribute) principal_id>)
principal\_type: String
The type of principal (user or group) that had the role removed.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted > (attribute) principal_type>)
resource\_id: String
The resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted > (attribute) resource_id>)
resource\_type: String
The type of resource the role assignment was scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted > (attribute) resource_type>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_assignment_deleted>)
role\_created: Attributes
The details for events with this `type`.
id: String
The role ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created > (attribute) id>)
permissions: List[String]
The permissions granted by the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created > (attribute) permissions>)
resource\_id: String
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created > (attribute) resource_id>)
resource\_type: String
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created > (attribute) resource_type>)
role\_name: String
The name of the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created > (attribute) role_name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_created>)
role\_deleted: Attributes
The details for events with this `type`.
id: String
The role ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_deleted>)
role\_updated: Attributes
The details for events with this `type`.
id: String
The role ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the role.
description: String
The updated role description, when provided.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) description>)
metadata: JSON
Additional metadata stored on the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) metadata>)
permissions\_added: List[String]
The permissions added to the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) permissions_added>)
permissions\_removed: List[String]
The permissions removed from the role.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) permissions_removed>)
resource\_id: String
The resource the role is scoped to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) resource_id>)
resource\_type: String
The type of resource the role belongs to.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) resource_type>)
role\_name: String
The updated role name, when provided.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested > (attribute) role_name>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) role_updated>)
scim\_disabled: Attributes
The details for events with this `type`.
id: String
The ID of the SCIM was disabled for.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) scim_disabled > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) scim_disabled>)
scim\_enabled: Attributes
The details for events with this `type`.
id: String
The ID of the SCIM was enabled for.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) scim_enabled > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) scim_enabled>)
service\_account\_created: Attributes
The details for events with this `type`.
id: String
The service account ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_created > (attribute) id>)
data: Attributes
The payload used to create the service account.
role: String
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_created > (attribute) data > (attribute) role>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_created > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_created>)
service\_account\_deleted: Attributes
The details for events with this `type`.
id: String
The service account ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_deleted>)
service\_account\_updated: Attributes
The details for events with this `type`.
id: String
The service account ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to updated the service account.
role: String
The role of the service account. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_updated > (attribute) changes_requested > (attribute) role>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) service_account_updated>)
user\_added: Attributes
The details for events with this `type`.
id: String
The user ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_added > (attribute) id>)
data: Attributes
The payload used to add the user to the project.
role: String
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_added > (attribute) data > (attribute) role>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_added > (attribute) data>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_added>)
user\_deleted: Attributes
The details for events with this `type`.
id: String
The user ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_deleted > (attribute) id>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_deleted>)
user\_updated: Attributes
The details for events with this `type`.
id: String
The project ID.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_updated > (attribute) id>)
changes\_requested: Attributes
The payload used to update the user.
role: String
The role of the user. Is either `owner` or `member`.
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_updated > (attribute) changes_requested > (attribute) role>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_updated > (attribute) changes_requested>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items > (attribute) user_updated>)
[](<#(resource) admin.organization.audit_logs > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_audit\_logs
Terraform
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
`data "openai\_admin\_organization\_audit\_logs" "example\_admin\_organization\_audit\_logs" {
actor\_emails = ["string"]
actor\_ids = ["string"]
before = "before"
effective\_at = {
gt = 0
gte = 0
lt = 0
lte = 0
}
event\_types = ["api\_key.created"]
project\_ids = ["string"]
resource\_ids = ["string"]
}
`
```