Permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Fine Tuning](/api/reference/terraform/resources/fine_tuning)
[Checkpoints](/api/reference/terraform/resources/fine_tuning/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Permissions
Manage fine-tuning jobs to tailor a model to your specific training data.
#### resource openai\_fine\_tuning\_checkpoint\_permission
##### required Expand Collapse
fine\_tuned\_model\_checkpoint: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) fine_tuned_model_checkpoint>)
project\_ids: List[String]
The project identifiers to grant access to.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) project_ids>)
##### computed Expand Collapse
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the permission was created.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) created_at>)
first\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) first_id>)
has\_more: Bool
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) has_more>)
last\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) last_id>)
object: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) project_id>)
data: List[Attributes]
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) data > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the permission was created.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) data > (attribute) created_at>)
object: String
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) data > (attribute) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) data > (attribute) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform resource) > (attribute) data>)
### openai\_fine\_tuning\_checkpoint\_permission
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
`resource "openai\_fine\_tuning\_checkpoint\_permission" "example\_fine\_tuning\_checkpoint\_permission" {
fine\_tuned\_model\_checkpoint = "ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd"
project\_ids = ["string"]
}
`
```
#### data openai\_fine\_tuning\_checkpoint\_permission
##### optional Expand Collapse
fine\_tuned\_model\_checkpoint?: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) fine_tuned_model_checkpoint>)
after?: String
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) after>)
project\_id?: String
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) project_id>)
limit?: Int64
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) limit>)
order?: String
The order in which to retrieve permissions.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) order>)
find\_one\_by?: Attributes
order?: String
The order in which to retrieve permissions.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) id>)
first\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) first_id>)
has\_more: Bool
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) has_more>)
last\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) last_id>)
object: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) object>)
data: List[Attributes]
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) data > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the permission was created.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) data > (attribute) created_at>)
object: String
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) data > (attribute) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) data > (attribute) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-single) > (attribute) data>)
### openai\_fine\_tuning\_checkpoint\_permission
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
`data "openai\_fine\_tuning\_checkpoint\_permission" "example\_fine\_tuning\_checkpoint\_permission" {
fine\_tuned\_model\_checkpoint = "ft-AF1WoRqd3aJAHsqc9NY7iL8F"
after = "after"
limit = 0
order = "ascending"
project\_id = "project\_id"
}
`
```
#### data openai\_fine\_tuning\_checkpoint\_permissions
##### required Expand Collapse
fine\_tuned\_model\_checkpoint: String
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) fine_tuned_model_checkpoint>)
##### optional Expand Collapse
project\_id?: String
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) project_id>)
order?: String
The order in which to retrieve permissions.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the permission was created.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
object: String
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) items > (attribute) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) items > (attribute) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (terraform datasource-plural) > (attribute) items>)
### openai\_fine\_tuning\_checkpoint\_permissions
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
`data "openai\_fine\_tuning\_checkpoint\_permissions" "example\_fine\_tuning\_checkpoint\_permissions" {
fine\_tuned\_model\_checkpoint = "ft-AF1WoRqd3aJAHsqc9NY7iL8F"
project\_id = "project\_id"
}
`
```