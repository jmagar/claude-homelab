Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List project certificates](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.Admin.Organization.Projects.Certificates.List(ctx, projectID, query) (\*ConversationCursorPage[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.Admin.Organization.Projects.Certificates.Activate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.Admin.Organization.Projects.Certificates.Deactivate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/deactivate