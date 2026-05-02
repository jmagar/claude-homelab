List checkpoint permissions | OpenAI API Reference
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
# List checkpoint permissions
Deprecated: Retrieve is deprecated. Please swap to the paginated list method instead.
client.fineTuning.checkpoints.permissions.retrieve(stringfineTunedModelCheckpoint, PermissionRetrieveParams { after, limit, order, project\_id } query?, RequestOptionsoptions?): [PermissionRetrieveResponse](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>) { data, has\_more, object, 2 more }
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
fineTunedModelCheckpoint: string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
query: PermissionRetrieveParams { after, limit, order, project\_id }
after?: string
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) after>)
limit?: number
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) limit>)
order?: "ascending" | "descending"
The order in which to retrieve permissions.
One of the following:
"ascending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema) > (member) 0>)
"descending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order>)
project\_id?: string
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
PermissionRetrieveResponse { data, has\_more, object, 2 more }
data: Array\<Data\>
id: string
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) created_at>)
object: "checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) object>)
project\_id: string
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data>)
has\_more: boolean
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) has_more>)
object: "list"
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) object>)
first\_id?: string | null
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) first_id>)
last\_id?: string | null
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) last_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>)
### List checkpoint permissions
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
const permission = await client.fineTuning.checkpoints.permissions.retrieve(
'ft-AF1WoRqd3aJAHsqc9NY7iL8F',
);
console.log(permission.first\_id);`
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