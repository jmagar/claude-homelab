Create checkpoint permissions | OpenAI API Reference
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
# Create checkpoint permissions
fine\_tuning.checkpoints.permissions.create(strfine\_tuned\_model\_checkpoint, PermissionCreateParams\*\*kwargs) -\> SyncPage[[PermissionCreateResponse](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)]
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).
This enables organization owners to share fine-tuned models with other projects in their organization.
##### ParametersExpand Collapse
fine\_tuned\_model\_checkpoint: str
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
project\_ids: Sequence[str]
The project identifiers to grant access to.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) project_ids > (schema)>)
##### ReturnsExpand Collapse
class PermissionCreateResponse: …
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: str
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) created_at>)
object: Literal["checkpoint.permission"]
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) object>)
project\_id: str
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)
### Create checkpoint permissions
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
page = client.fine\_tuning.checkpoints.permissions.create(
fine\_tuned\_model\_checkpoint="ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd",
project\_ids=["string"],
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