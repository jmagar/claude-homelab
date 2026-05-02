List checkpoint permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Fine Tuning](/api/reference/python/resources/fine_tuning)
[Checkpoints](/api/reference/python/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/python/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List checkpoint permissions
fine\_tuning.checkpoints.permissions.list(strfine\_tuned\_model\_checkpoint, PermissionListParams\*\*kwargs) -\> SyncConversationCursorPage[[PermissionListResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)]
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: str
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
after: Optional[str]
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["ascending", "descending"]]
The order in which to retrieve permissions.
One of the following:
"ascending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"descending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>)
project\_id: Optional[str]
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) project_id > (schema)>)
##### ReturnsExpand Collapse
class PermissionListResponse: …
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: str
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) created_at>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) object>)
project\_id: str
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)
### List checkpoint permissions
Python
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
page = client.fine\_tuning.checkpoints.permissions.list(
fine\_tuned\_model\_checkpoint="ft-AF1WoRqd3aJAHsqc9NY7iL8F",
)
page = page.data[0]
print(page.id)`
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