Service Accounts | OpenAI API Reference
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
# Service Accounts
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