List fine-tuning checkpoints | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Jobs](/api/reference/go/resources/fine_tuning/subresources/jobs)
[Checkpoints](/api/reference/go/resources/fine_tuning/subresources/jobs/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning checkpoints
client.FineTuning.Jobs.Checkpoints.List(ctx, fineTuningJobID, query) (\*CursorPage[[FineTuningJobCheckpoint](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)], error)
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
List checkpoints for a fine-tuning job.
##### ParametersExpand Collapse
fineTuningJobID string
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) fine_tuning_job_id > (schema)>)
query FineTuningJobCheckpointListParams
After param.Field[string]Optional
Identifier for the last checkpoint ID from the previous pagination request.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of checkpoints to retrieve.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) limit>)
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default>)
##### ReturnsExpand Collapse
type FineTuningJobCheckpoint struct{…}
The `fine\_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
ID string
The checkpoint identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the checkpoint was created.
formatunixtime
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) created_at>)
FineTunedModelCheckpoint string
The name of the fine-tuned checkpoint model that is created.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuned_model_checkpoint>)
FineTuningJobID string
The name of the fine-tuning job that this checkpoint was created from.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuning_job_id>)
Metrics FineTuningJobCheckpointMetrics
Metrics at the step number during the fine-tuning job.
FullValidLoss float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_loss>)
FullValidMeanTokenAccuracy float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_mean_token_accuracy>)
Step float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) step>)
TrainLoss float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_loss>)
TrainMeanTokenAccuracy float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_mean_token_accuracy>)
ValidLoss float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_loss>)
ValidMeanTokenAccuracy float64Optional
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics>)
Object FineTuningJobCheckpoint
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) object>)
StepNumber int64
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)
### List fine-tuning checkpoints
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
page, err := client.FineTuning.Jobs.Checkpoints.List(
context.TODO(),
"ft-AF1WoRqd3aJAHsqc9NY7iL8F",
openai.FineTuningJobCheckpointListParams{
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
"object": "fine\_tuning.job.checkpoint",
"id": "ftckpt\_zc4Q7MP6XxulcVzj4MZdwsAB",
"created\_at": 1721764867,
"fine\_tuned\_model\_checkpoint": "ft:gpt-4o-mini-2024-07-18:my-org:custom-suffix:96olL566:ckpt-step-2000",
"metrics": {
"full\_valid\_loss": 0.134,
"full\_valid\_mean\_token\_accuracy": 0.874
},
"fine\_tuning\_job\_id": "ftjob-abc123",
"step\_number": 2000
},
{
"object": "fine\_tuning.job.checkpoint",
"id": "ftckpt\_enQCFmOTGj3syEpYVhBRLTSy",
"created\_at": 1721764800,
"fine\_tuned\_model\_checkpoint": "ft:gpt-4o-mini-2024-07-18:my-org:custom-suffix:7q8mpxmy:ckpt-step-1000",
"metrics": {
"full\_valid\_loss": 0.167,
"full\_valid\_mean\_token\_accuracy": 0.781
},
"fine\_tuning\_job\_id": "ftjob-abc123",
"step\_number": 1000
}
],
"first\_id": "ftckpt\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "ftckpt\_enQCFmOTGj3syEpYVhBRLTSy",
"has\_more": true
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "fine\_tuning.job.checkpoint",
"id": "ftckpt\_zc4Q7MP6XxulcVzj4MZdwsAB",
"created\_at": 1721764867,
"fine\_tuned\_model\_checkpoint": "ft:gpt-4o-mini-2024-07-18:my-org:custom-suffix:96olL566:ckpt-step-2000",
"metrics": {
"full\_valid\_loss": 0.134,
"full\_valid\_mean\_token\_accuracy": 0.874
},
"fine\_tuning\_job\_id": "ftjob-abc123",
"step\_number": 2000
},
{
"object": "fine\_tuning.job.checkpoint",
"id": "ftckpt\_enQCFmOTGj3syEpYVhBRLTSy",
"created\_at": 1721764800,
"fine\_tuned\_model\_checkpoint": "ft:gpt-4o-mini-2024-07-18:my-org:custom-suffix:7q8mpxmy:ckpt-step-1000",
"metrics": {
"full\_valid\_loss": 0.167,
"full\_valid\_mean\_token\_accuracy": 0.781
},
"fine\_tuning\_job\_id": "ftjob-abc123",
"step\_number": 1000
}
],
"first\_id": "ftckpt\_zc4Q7MP6XxulcVzj4MZdwsAB",
"last\_id": "ftckpt\_enQCFmOTGj3syEpYVhBRLTSy",
"has\_more": true
}
`
```