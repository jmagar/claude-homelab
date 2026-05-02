Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
[Projects](/api/reference/terraform/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
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