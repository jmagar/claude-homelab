Certificates | OpenAI API Reference
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
# Certificates
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