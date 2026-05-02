Create checkpoint permissions | OpenAI API Reference
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
# Create checkpoint permissions
client.fineTuning.checkpoints.permissions.create(stringfineTunedModelCheckpoint, PermissionCreateParams { project\_ids } body, RequestOptionsoptions?): Page\<[PermissionCreateResponse](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>) { id, created\_at, object, project\_id } \>
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).
This enables organization owners to share fine-tuned models with other projects in their organization.
##### ParametersExpand Collapse
fineTunedModelCheckpoint: string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
body: PermissionCreateParams { project\_ids }
project\_ids: Array\<string\>
The project identifiers to grant access to.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) project_ids>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default>)
##### ReturnsExpand Collapse
PermissionCreateResponse { id, created\_at, object, project\_id }
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
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
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)
### Create checkpoint permissions
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
// Automatically fetches more pages as needed.
for await (const permissionCreateResponse of client.fineTuning.checkpoints.permissions.create(
'ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd',
{ project\_ids: ['string'] },
)) {
console.log(permissionCreateResponse.id);
}`
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