Delete checkpoint permission | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Fine Tuning](/api/reference/typescript/resources/fine_tuning)
[Checkpoints](/api/reference/typescript/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/typescript/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete checkpoint permission
client.fineTuning.checkpoints.permissions.delete(stringpermissionID, PermissionDeleteParams { fine\_tuned\_model\_checkpoint } params, RequestOptionsoptions?): [PermissionDeleteResponse](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>) { id, deleted, object }
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to delete a permission for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
permissionID: string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) delete > (params) default > (param) permission_id > (schema)>)
params: PermissionDeleteParams { fine\_tuned\_model\_checkpoint }
fine\_tuned\_model\_checkpoint: string
The ID of the fine-tuned model checkpoint to delete a permission for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) delete > (params) default > (param) fine_tuned_model_checkpoint>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) delete > (params) default>)
##### ReturnsExpand Collapse
PermissionDeleteResponse { id, deleted, object }
id: string
The ID of the fine-tuned model checkpoint permission that was deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the fine-tuned model checkpoint permission was successfully deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) deleted>)
object: "checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) object>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)
### Delete checkpoint permission
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
const permission = await client.fineTuning.checkpoints.permissions.delete(
'cp\_zc4Q7MP6XxulcVzj4MZdwsAB',
{ fine\_tuned\_model\_checkpoint: 'ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd' },
);
console.log(permission.id);`
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