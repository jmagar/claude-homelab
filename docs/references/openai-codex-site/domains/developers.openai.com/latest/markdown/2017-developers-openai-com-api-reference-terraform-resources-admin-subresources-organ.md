Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
[Groups](/api/reference/terraform/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
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