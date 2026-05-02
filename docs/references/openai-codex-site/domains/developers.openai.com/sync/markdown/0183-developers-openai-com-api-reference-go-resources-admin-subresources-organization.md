Audit Logs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Audit Logs
List user actions and configuration changes within this organization.
##### [List audit logs](/api/reference/go/resources/admin/subresources/organization/subresources/audit_logs/methods/list)
client.Admin.Organization.AuditLogs.List(ctx, query) (\*ConversationCursorPage[[AdminOrganizationAuditLogListResponse](</api/reference/go/resources/admin#(resource) admin.organization.audit_logs > (model) AdminOrganizationAuditLogListResponse > (schema)>)], error)
GET/organization/audit\_logs