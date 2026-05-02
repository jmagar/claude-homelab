Create checkpoint permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Fine Tuning](/api/reference/resources/fine_tuning)
[Checkpoints](/api/reference/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create checkpoint permissions
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).
This enables organization owners to share fine-tuned models with other projects in their organization.
##### Path ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
##### Body ParametersJSONExpand Collapse
project\_ids: array of string
The project identifiers to grant access to.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) 0 > (param) project_ids > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, object, project\_id }
id: string
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) created_at>)
object: "checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) object>)
project\_id: string
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (network schema) > (property) data>)
has\_more: boolean
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (network schema) > (property) has_more>)
object: "list"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (network schema) > (property) object>)
first\_id: optional string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (network schema) > (property) first_id>)
last\_id: optional string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (network schema) > (property) last_id>)
### Create checkpoint permissions
HTTP
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
`curl https://api.openai.com/v1/fine\_tuning/checkpoints/ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd/permissions \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
-d '{"project\_ids": ["proj\_abGMw1llN8IrBb6SvvY5A1iH"]}'
`
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
}
],
"first\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
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
}
],
"first\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"has\_more": false
}
`
```