API Keys | OpenAI API Reference
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
# API Keys
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