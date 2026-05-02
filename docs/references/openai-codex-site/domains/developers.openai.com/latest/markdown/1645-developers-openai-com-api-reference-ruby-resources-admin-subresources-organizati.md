Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List project certificates](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
admin.organization.projects.certificates.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
admin.organization.projects.certificates.activate(project\_id, \*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
admin.organization.projects.certificates.deactivate(project\_id, \*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate