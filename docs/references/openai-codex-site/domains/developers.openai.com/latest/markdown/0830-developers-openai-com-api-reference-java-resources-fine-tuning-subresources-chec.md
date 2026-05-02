List checkpoint permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
[Checkpoints](/api/reference/java/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List checkpoint permissions
Deprecated: Retrieve is deprecated. Please swap to the paginated list method instead.
[PermissionRetrieveResponse](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema)>) fineTuning().checkpoints().permissions().retrieve(PermissionRetrieveParamsparams = PermissionRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
PermissionRetrieveParams params
Optional\<String\> fineTunedModelCheckpoint
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
Optional\<String\> after
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/retrieve#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema)>)\> order
The order in which to retrieve permissions.
ASCENDING("ascending")
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema) > (member) 0>)
DESCENDING("descending")
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) order > (schema)>)
Optional\<String\> projectId
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default > (param) project_id > (schema)>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class PermissionRetrieveResponse:
List\<Data\> data
String id
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) data > (items) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) data > (items) > (property) created_at>)
JsonValue; object\_ "checkpoint.permission"constant"checkpoint.permission"constant
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) data > (items) > (property) object>)
String projectId
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) data > (items) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) data>)
boolean hasMore
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) has_more>)
JsonValue; object\_ "list"constant"list"constant
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) object>)
Optional\<String\> firstId
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) first_id>)
Optional\<String\> lastId
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema) > (property) last_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) PermissionRetrieveResponse > (schema)>)
### List checkpoint permissions
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.finetuning.checkpoints.permissions.PermissionRetrieveParams;
import com.openai.models.finetuning.checkpoints.permissions.PermissionRetrieveResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
PermissionRetrieveResponse permission = client.fineTuning().checkpoints().permissions().retrieve("ft-AF1WoRqd3aJAHsqc9NY7iL8F");
}
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