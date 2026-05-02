Create checkpoint permissions | OpenAI API Reference
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
# Create checkpoint permissions
client.FineTuning.Checkpoints.Permissions.New(ctx, fineTunedModelCheckpoint, body) (\*Page[[FineTuningCheckpointPermissionNewResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema)>)], error)
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
**NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).
This enables organization owners to share fine-tuned models with other projects in their organization.
##### ParametersExpand Collapse
fineTunedModelCheckpoint string
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) fine_tuned_model_checkpoint > (schema)>)
body FineTuningCheckpointPermissionNewParams
ProjectIDs param.Field[[]string]
The project identifiers to grant access to.
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default > (param) project_ids>)
[](<#(resource) fine_tuning.checkpoints.permissions > (method) create > (params) default>)
##### ReturnsExpand Collapse
type FineTuningCheckpointPermissionNewResponse struct{…}
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
ID string
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema) > (property) created_at>)
Object CheckpointPermission
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema) > (property) object>)
ProjectID string
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) FineTuningCheckpointPermissionNewResponse > (schema)>)
### Create checkpoint permissions
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
page, err := client.FineTuning.Checkpoints.Permissions.New(
context.TODO(),
"ft:gpt-4o-mini-2024-07-18:org:weather:B7R9VjQd",
openai.FineTuningCheckpointPermissionNewParams{
ProjectIDs: []string{"string"},
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