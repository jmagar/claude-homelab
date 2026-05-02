Admin API Keys | OpenAI API Reference
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
# Admin API Keys
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