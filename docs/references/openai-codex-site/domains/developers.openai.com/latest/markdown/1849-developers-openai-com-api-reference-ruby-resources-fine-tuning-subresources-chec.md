List checkpoint permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Fine Tuning](/api/reference/ruby/resources/fine_tuning)
[Checkpoints](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List checkpoint permissions
fine\_tuning.checkpoints.permissions.list(fine\_tuned\_model\_checkpoint, \*\*kwargs) -\> ConversationCursorPage\<[PermissionListResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>) { id, created\_at, object, project\_id } \>
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: String
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
after: String
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) limit > (schema)>)
order: :ascending | :descending
The order in which to retrieve permissions.
One of the following:
:ascending
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:descending
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>)
project\_id: String
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) project_id > (schema)>)
##### ReturnsExpand Collapse
class PermissionListResponse { id, created\_at, object, project\_id }
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) created_at>)
object: :"checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)
### List checkpoint permissions
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
page = openai.fine\_tuning.checkpoints.permissions.list("ft-AF1WoRqd3aJAHsqc9NY7iL8F")
puts(page)`
```
```
`{
"object": "list",
"data": [
{
"object": "checkpoint.permission",
"id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"created\_at": 1721764867,
"project\_id": "proj\_abGMw1llN8IrBb6SvvY5A1iH"
},
{
"object": "checkpoint.permission",
"id": "cp\_enQCFmOTGj3syEpYVhBRLTSy",
"created\_at": 1721764800,
"project\_id": "proj\_iqGMw1llN8IrBb6SvvY5A1oF"
},
],
"first\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "cp\_enQCFmOTGj3syEpYVhBRLTSy",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "checkpoint.permission",
"id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"created\_at": 1721764867,
"project\_id": "proj\_abGMw1llN8IrBb6SvvY5A1iH"
},
{
"object": "checkpoint.permission",
"id": "cp\_enQCFmOTGj3syEpYVhBRLTSy",
"created\_at": 1721764800,
"project\_id": "proj\_iqGMw1llN8IrBb6SvvY5A1oF"
},
],
"first\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "cp\_enQCFmOTGj3syEpYVhBRLTSy",
"has\_more": false
}
`
```