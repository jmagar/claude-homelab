List checkpoint permissions | OpenAI API Reference
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
# List checkpoint permissions
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### Path ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) limit > (schema)>)
order: optional "ascending" or "descending"
The order in which to retrieve permissions.
One of the following:
"ascending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"descending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>)
project\_id: optional string
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) project_id > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, object, project\_id }
id: string
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) created_at>)
object: "checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) object>)
project\_id: string
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (network schema) > (property) data>)
has\_more: boolean
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (network schema) > (property) has_more>)
object: "list"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (network schema) > (property) object>)
first\_id: optional string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (network schema) > (property) first_id>)
last\_id: optional string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (network schema) > (property) last_id>)
### List checkpoint permissions
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