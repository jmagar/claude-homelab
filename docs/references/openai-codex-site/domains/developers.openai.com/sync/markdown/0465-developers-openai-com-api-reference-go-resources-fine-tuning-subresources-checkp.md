List checkpoint permissions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Checkpoints](/api/reference/go/resources/fine_tuning/subresources/checkpoints)
[Permissions](/api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List checkpoint permissions
client.FineTuning.Checkpoints.Permissions.List(ctx, fineTunedModelCheckpoint, query) (\*ConversationCursorPage[[FineTuningCheckpointPermissionListResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema)>)], error)
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** This endpoint requires an [admin API key](../admin-api-keys).
Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.
##### ParametersExpand Collapse
fineTunedModelCheckpoint string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
query FineTuningCheckpointPermissionListParams
After param.Field[string]Optional
Identifier for the last permission ID from the previous pagination request.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of permissions to retrieve.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) limit>)
Order param.Field[[FineTuningCheckpointPermissionListParamsOrder](</api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>)]Optional
The order in which to retrieve permissions.
const FineTuningCheckpointPermissionListParamsOrderAscending [FineTuningCheckpointPermissionListParamsOrder](</api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>) = "ascending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const FineTuningCheckpointPermissionListParamsOrderDescending [FineTuningCheckpointPermissionListParamsOrder](</api/reference/go/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema)>) = "descending"
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) order>)
ProjectID param.Field[string]Optional
The ID of the project to get permissions for.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default > (param) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) list > (params) default>)
##### ReturnsExpand Collapse
type FineTuningCheckpointPermissionListResponse struct{…}
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
ID string
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema) > (property) created_at>)
Object CheckpointPermission
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema) > (property) object>)
ProjectID string
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionListResponse > (schema)>)
### List checkpoint permissions
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
page, err := client.FineTuning.Checkpoints.Permissions.List(
context.TODO(),
"ft-AF1WoRqd3aJAHsqc9NY7iL8F",
openai.FineTuningCheckpointPermissionListParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
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