Delete checkpoint permission | OpenAI API Reference
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
# Delete checkpoint permission
fine\_tuning.checkpoints.permissions.delete(strpermission\_id, PermissionDeleteParams\*\*kwargs) -\> [PermissionDeleteResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to delete a permission for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: str
[](<#(resource) fine_tuning.checkpoints.permissions > (method) delete > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
permission\_id: str
[](<#(resource) fine_tuning.checkpoints.permissions > (method) delete > (params) default > (param) permission_id > (schema)>)
##### ReturnsExpand Collapse
class PermissionDeleteResponse: …
id: str
The ID of the fine-tuned model checkpoint permission that was deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) id>)
deleted: bool
Whether the fine-tuned model checkpoint permission was successfully deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) deleted>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) object>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)
### Delete checkpoint permission
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
permission = client.fine\_tuning.checkpoints.permissions.delete(
permission\_id="cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
fine\_tuned\_model\_checkpoint="ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd",
)
print(permission.id)`
```
```
`{
"object": "checkpoint.permission",
"id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "checkpoint.permission",
"id": "cp\_zc4Q7MP6XxulcVzj4MZdwsAB",
"deleted": true
}
`
```