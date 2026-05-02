Organization | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Organization
#### OrganizationAudit Logs
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
#### OrganizationAdmin API Keys
#### resource openai\_admin\_organization\_admin\_api\_key
##### required Expand Collapse
name: String
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) created_at>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) last_used_at>)
object: String
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) object>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) redacted_value>)
value: String
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) value>)
owner: Attributes
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the user was created
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) created_at>)
name: String
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) name>)
object: String
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) object>)
role: String
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) role>)
type: String
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner > (attribute) type>)
[](<#(resource) admin.organization.admin_api_keys > (terraform resource) > (attribute) owner>)
### openai\_admin\_organization\_admin\_api\_key
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
`resource "openai\_admin\_organization\_admin\_api\_key" "example\_admin\_organization\_admin\_api\_key" {
name = "New Admin Key"
}
`
```
#### data openai\_admin\_organization\_admin\_api\_key
##### optional Expand Collapse
key\_id?: String
The ID of the API key.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) key_id>)
find\_one\_by?: Attributes
order?: String
Order results by creation time, ascending or descending.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
The ID of the API key.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) created_at>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) object>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) redacted_value>)
value: String
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) value>)
owner: Attributes
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the user was created
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) created_at>)
name: String
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) name>)
object: String
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) object>)
role: String
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) role>)
type: String
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner > (attribute) type>)
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-single) > (attribute) owner>)
### openai\_admin\_organization\_admin\_api\_key
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
`data "openai\_admin\_organization\_admin\_api\_key" "example\_admin\_organization\_admin\_api\_key" {
key\_id = "key\_id"
}
`
```
#### data openai\_admin\_organization\_admin\_api\_keys
##### optional Expand Collapse
order?: String
Order results by creation time, ascending or descending.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) object>)
owner: Attributes
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the user was created
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) created_at>)
name: String
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) name>)
object: String
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) object>)
role: String
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) role>)
type: String
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) type>)
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) redacted_value>)
value: String
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items > (attribute) value>)
[](<#(resource) admin.organization.admin_api_keys > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_admin\_api\_keys
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
`data "openai\_admin\_organization\_admin\_api\_keys" "example\_admin\_organization\_admin\_api\_keys" {
}
`
```
#### OrganizationInvites
#### resource openai\_admin\_organization\_invite
##### required Expand Collapse
email: String
Send an email to this address
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) email>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) role>)
##### optional Expand Collapse
projects?: List[Attributes]
An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) id>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) accepted_at>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) object>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) status>)
### openai\_admin\_organization\_invite
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
`resource "openai\_admin\_organization\_invite" "example\_admin\_organization\_invite" {
email = "email"
role = "reader"
projects = [{
id = "id"
role = "member"
}]
}
`
```
#### data openai\_admin\_organization\_invite
##### required Expand Collapse
invite\_id: String
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) invite_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) id>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) accepted_at>)
email: String
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) email>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) role>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) status>)
projects: List[Attributes]
The projects that were granted membership upon acceptance of the invite.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects>)
### openai\_admin\_organization\_invite
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
`data "openai\_admin\_organization\_invite" "example\_admin\_organization\_invite" {
invite\_id = "invite\_id"
}
`
```
#### data openai\_admin\_organization\_invites
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) id>)
email: String
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) email>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) role>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) status>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) accepted_at>)
projects: List[Attributes]
The projects that were granted membership upon acceptance of the invite.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects>)
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_invites
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
`data "openai\_admin\_organization\_invites" "example\_admin\_organization\_invites" {
}
`
```
#### OrganizationUsers
#### resource openai\_admin\_organization\_user
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) user_id>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) role>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_user
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
`resource "openai\_admin\_organization\_user" "example\_admin\_organization\_user" {
user\_id = "user\_id"
role = "owner"
}
`
```
#### data openai\_admin\_organization\_user
##### optional Expand Collapse
user\_id?: String
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) user_id>)
find\_one\_by?: Attributes
emails?: List[String]
Filter by the email address of users.
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) find_one_by > (attribute) emails>)
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.users > (terraform datasource-single) > (attribute) role>)
### openai\_admin\_organization\_user
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
`data "openai\_admin\_organization\_user" "example\_admin\_organization\_user" {
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_users
##### optional Expand Collapse
emails?: List[String]
Filter by the email address of users.
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) emails>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.users > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_users
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
`data "openai\_admin\_organization\_users" "example\_admin\_organization\_users" {
emails = ["string"]
}
`
```
#### OrganizationUsersRoles
#### resource openai\_admin\_organization\_user\_role
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) object>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role>)
user: Attributes
Represents an individual `user` within an organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user>)
### openai\_admin\_organization\_user\_role
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
`resource "openai\_admin\_organization\_user\_role" "example\_admin\_organization\_user\_role" {
user\_id = "user\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_user\_roles
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) user_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned organization roles.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_user\_roles
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
`data "openai\_admin\_organization\_user\_roles" "example\_admin\_organization\_user\_roles" {
user\_id = "user\_id"
order = "asc"
}
`
```
#### OrganizationGroups
#### resource openai\_admin\_organization\_group
##### required Expand Collapse
name: String
Human readable name for the group.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) created_at>)
is\_scim\_managed: Bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) is_scim_managed>)
### openai\_admin\_organization\_group
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
`resource "openai\_admin\_organization\_group" "example\_admin\_organization\_group" {
name = "x"
}
`
```
#### data openai\_admin\_organization\_groups
##### optional Expand Collapse
order?: String
Specifies the sort order of the returned groups.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
is\_scim\_managed: Bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) is_scim_managed>)
name: String
Display name of the group.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) name>)
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_groups
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
`data "openai\_admin\_organization\_groups" "example\_admin\_organization\_groups" {
}
`
```
#### OrganizationGroupsUsers
#### resource openai\_admin\_organization\_group\_user
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) group_id>)
user\_id: String
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) user_id>)
##### computed Expand Collapse
object: String
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_group\_user
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
`resource "openai\_admin\_organization\_group\_user" "example\_admin\_organization\_group\_user" {
group\_id = "group\_id"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_group\_users
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) group_id>)
##### optional Expand Collapse
order?: String
Specifies the sort order of users in the list.
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_group\_users
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
`data "openai\_admin\_organization\_group\_users" "example\_admin\_organization\_group\_users" {
group\_id = "group\_id"
}
`
```
#### OrganizationGroupsRoles
#### resource openai\_admin\_organization\_group\_role
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) object>)
group: Attributes
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) name>)
object: String
Always `group`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) object>)
scim\_managed: Bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role>)
### openai\_admin\_organization\_group\_role
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
`resource "openai\_admin\_organization\_group\_role" "example\_admin\_organization\_group\_role" {
group\_id = "group\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_group\_roles
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) group_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned organization roles.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_group\_roles
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
`data "openai\_admin\_organization\_group\_roles" "example\_admin\_organization\_group\_roles" {
group\_id = "group\_id"
order = "asc"
}
`
```
#### OrganizationRoles
#### resource openai\_admin\_organization\_role
##### required Expand Collapse
role\_name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) role_name>)
permissions: List[String]
Permissions to grant to the role.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) permissions>)
##### optional Expand Collapse
description?: String
Optional description of the role.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) description>)
##### computed Expand Collapse
id: String
Identifier for the role.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) id>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) object>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (terraform resource) > (attribute) resource_type>)
### openai\_admin\_organization\_role
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
`resource "openai\_admin\_organization\_role" "example\_admin\_organization\_role" {
permissions = ["string"]
role\_name = "role\_name"
description = "description"
}
`
```
#### data openai\_admin\_organization\_roles
##### optional Expand Collapse
order?: String
Sort order for the returned roles.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
[](<#(resource) admin.organization.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_roles
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
`data "openai\_admin\_organization\_roles" "example\_admin\_organization\_roles" {
}
`
```
#### OrganizationCertificates
#### resource openai\_admin\_organization\_certificate
##### required Expand Collapse
content: String
The certificate content in PEM format
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) content>)
##### optional Expand Collapse
name?: String
An optional name for the certificate
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) id>)
active: Bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) active>)
created\_at: Int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) created_at>)
object: String
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) object>)
certificate\_details: Attributes
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) certificate_details > (attribute) content>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the certificate expires.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) certificate_details > (attribute) expires_at>)
valid\_at: Int64
The Unix timestamp (in seconds) of when the certificate becomes valid.
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) certificate_details > (attribute) valid_at>)
[](<#(resource) admin.organization.certificates > (terraform resource) > (attribute) certificate_details>)
### openai\_admin\_organization\_certificate
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
`resource "openai\_admin\_organization\_certificate" "example\_admin\_organization\_certificate" {
content = "content"
name = "name"
}
`
```
#### data openai\_admin\_organization\_certificate
##### optional Expand Collapse
certificate\_id?: String
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) certificate_id>)
include?: List[String]
A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) include>)
find\_one\_by?: Attributes
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) id>)
active: Bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) active>)
created\_at: Int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) created_at>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) name>)
object: String
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) object>)
certificate\_details: Attributes
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) certificate_details > (attribute) content>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the certificate expires.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) certificate_details > (attribute) expires_at>)
valid\_at: Int64
The Unix timestamp (in seconds) of when the certificate becomes valid.
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) certificate_details > (attribute) valid_at>)
[](<#(resource) admin.organization.certificates > (terraform datasource-single) > (attribute) certificate_details>)
### openai\_admin\_organization\_certificate
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
`data "openai\_admin\_organization\_certificate" "example\_admin\_organization\_certificate" {
certificate\_id = "certificate\_id"
include = ["content"]
}
`
```
#### data openai\_admin\_organization\_certificates
##### optional Expand Collapse
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) id>)
certificate\_details: Attributes
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) content>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the certificate expires.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) expires_at>)
valid\_at: Int64
The Unix timestamp (in seconds) of when the certificate becomes valid.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) valid_at>)
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details>)
created\_at: Int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) object>)
active: Bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items > (attribute) active>)
[](<#(resource) admin.organization.certificates > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_certificates
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
`data "openai\_admin\_organization\_certificates" "example\_admin\_organization\_certificates" {
}
`
```
#### OrganizationProjects
#### resource openai\_admin\_organization\_project
##### required Expand Collapse
name: String
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) name>)
##### optional Expand Collapse
geography?: String
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) geography>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) id>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) archived_at>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) status>)
### openai\_admin\_organization\_project
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
`resource "openai\_admin\_organization\_project" "example\_admin\_organization\_project" {
name = "name"
geography = "US"
}
`
```
#### data openai\_admin\_organization\_project
##### optional Expand Collapse
project\_id?: String
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) project_id>)
find\_one\_by?: Attributes
include\_archived?: Bool
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) find_one_by > (attribute) include_archived>)
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) id>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) archived_at>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) status>)
### openai\_admin\_organization\_project
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
`data "openai\_admin\_organization\_project" "example\_admin\_organization\_project" {
project\_id = "project\_id"
}
`
```
#### data openai\_admin\_organization\_projects
##### optional Expand Collapse
include\_archived?: Bool
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) include_archived>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) status>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) archived_at>)
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_projects
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
`data "openai\_admin\_organization\_projects" "example\_admin\_organization\_projects" {
}
`
```
#### OrganizationProjectsUsers
#### resource openai\_admin\_organization\_project\_user
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) project_id>)
user\_id: String
The ID of the user.
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) user_id>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) role>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_project\_user
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
`resource "openai\_admin\_organization\_project\_user" "example\_admin\_organization\_project\_user" {
project\_id = "project\_id"
role = "owner"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_project\_user
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) user_id>)
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) role>)
### openai\_admin\_organization\_project\_user
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
`data "openai\_admin\_organization\_project\_user" "example\_admin\_organization\_project\_user" {
project\_id = "project\_id"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_project\_users
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_users
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
`data "openai\_admin\_organization\_project\_users" "example\_admin\_organization\_project\_users" {
project\_id = "project\_id"
}
`
```
#### OrganizationProjectsUsersRoles
#### resource openai\_admin\_organization\_project\_user\_role
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) project_id>)
user\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) object>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role>)
user: Attributes
Represents an individual `user` within an organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user>)
### openai\_admin\_organization\_project\_user\_role
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
`resource "openai\_admin\_organization\_project\_user\_role" "example\_admin\_organization\_project\_user\_role" {
project\_id = "project\_id"
user\_id = "user\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_project\_user\_roles
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) project_id>)
user\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) user_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned project roles.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_user\_roles
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
`data "openai\_admin\_organization\_project\_user\_roles" "example\_admin\_organization\_project\_user\_roles" {
project\_id = "project\_id"
user\_id = "user\_id"
order = "asc"
}
`
```
#### OrganizationProjectsService Accounts
#### resource openai\_admin\_organization\_project\_service\_account
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) project_id>)
name: String
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) role>)
api\_key: Attributes
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) id>)
created\_at: Int64
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) object>)
value: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) value>)
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key>)
### openai\_admin\_organization\_project\_service\_account
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
`resource "openai\_admin\_organization\_project\_service\_account" "example\_admin\_organization\_project\_service\_account" {
project\_id = "project\_id"
name = "name"
}
`
```
#### data openai\_admin\_organization\_project\_service\_account
##### required Expand Collapse
service\_account\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) service_account_id>)
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) role>)
### openai\_admin\_organization\_project\_service\_account
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
`data "openai\_admin\_organization\_project\_service\_account" "example\_admin\_organization\_project\_service\_account" {
project\_id = "project\_id"
service\_account\_id = "service\_account\_id"
}
`
```
#### data openai\_admin\_organization\_project\_service\_accounts
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_service\_accounts
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
`data "openai\_admin\_organization\_project\_service\_accounts" "example\_admin\_organization\_project\_service\_accounts" {
project\_id = "project\_id"
}
`
```
#### OrganizationProjectsAPI Keys
#### data openai\_admin\_organization\_project\_api\_key
##### required Expand Collapse
key\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) key_id>)
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) created_at>)
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) id>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) object>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) redacted_value>)
owner: Attributes
service\_account: Attributes
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account>)
type: String
`user` or `service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) type>)
user: Attributes
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner>)
### openai\_admin\_organization\_project\_api\_key
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
`data "openai\_admin\_organization\_project\_api\_key" "example\_admin\_organization\_project\_api\_key" {
project\_id = "project\_id"
key\_id = "key\_id"
}
`
```
#### data openai\_admin\_organization\_project\_api\_keys
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) object>)
owner: Attributes
service\_account: Attributes
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account>)
type: String
`user` or `service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) type>)
user: Attributes
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_api\_keys
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
`data "openai\_admin\_organization\_project\_api\_keys" "example\_admin\_organization\_project\_api\_keys" {
project\_id = "project\_id"
}
`
```
#### OrganizationProjectsGroups
#### resource openai\_admin\_organization\_project\_group
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) project_id>)
group\_id: String
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) group_id>)
role: String
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) role>)
##### computed Expand Collapse
created\_at: Int64
Unix timestamp (in seconds) when the group was granted project access.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) created_at>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) group_name>)
object: String
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_project\_group
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
`resource "openai\_admin\_organization\_project\_group" "example\_admin\_organization\_project\_group" {
project\_id = "project\_id"
group\_id = "group\_id"
role = "role"
}
`
```
#### data openai\_admin\_organization\_project\_groups
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned groups.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
created\_at: Int64
Unix timestamp (in seconds) when the group was granted project access.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
group\_id: String
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) group_id>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) group_name>)
object: String
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) object>)
project\_id: String
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) project_id>)
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_groups
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
`data "openai\_admin\_organization\_project\_groups" "example\_admin\_organization\_project\_groups" {
project\_id = "project\_id"
}
`
```
#### OrganizationProjectsGroupsRoles
#### resource openai\_admin\_organization\_project\_group\_role
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group_id>)
project\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) project_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) object>)
group: Attributes
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) name>)
object: String
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) object>)
scim\_managed: Bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role>)
### openai\_admin\_organization\_project\_group\_role
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
`resource "openai\_admin\_organization\_project\_group\_role" "example\_admin\_organization\_project\_group\_role" {
project\_id = "project\_id"
group\_id = "group\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_project\_group\_roles
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) group_id>)
project\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned project roles.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_group\_roles
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
`data "openai\_admin\_organization\_project\_group\_roles" "example\_admin\_organization\_project\_group\_roles" {
project\_id = "project\_id"
group\_id = "group\_id"
order = "asc"
}
`
```
#### OrganizationProjectsRoles
#### resource openai\_admin\_organization\_project\_role
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) project_id>)
role\_name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) role_name>)
permissions: List[String]
Permissions to grant to the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) permissions>)
##### optional Expand Collapse
description?: String
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) description>)
##### computed Expand Collapse
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) id>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) object>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) resource_type>)
### openai\_admin\_organization\_project\_role
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
`resource "openai\_admin\_organization\_project\_role" "example\_admin\_organization\_project\_role" {
project\_id = "project\_id"
permissions = ["string"]
role\_name = "role\_name"
description = "description"
}
`
```
#### data openai\_admin\_organization\_project\_roles
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned roles.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_roles
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
`data "openai\_admin\_organization\_project\_roles" "example\_admin\_organization\_project\_roles" {
project\_id = "project\_id"
}
`
```
#### OrganizationProjectsCertificates
#### data openai\_admin\_organization\_project\_certificates
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) id>)
certificate\_details: Attributes
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) content>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the certificate expires.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) expires_at>)
valid\_at: Int64
The Unix timestamp (in seconds) of when the certificate becomes valid.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) valid_at>)
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details>)
created\_at: Int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) object>)
active: Bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) active>)
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_certificates
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
`data "openai\_admin\_organization\_project\_certificates" "example\_admin\_organization\_project\_certificates" {
project\_id = "project\_id"
}
`
```