List fine-tuning checkpoints | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
[Jobs](/api/reference/java/resources/fine_tuning/subresources/jobs)
[Checkpoints](/api/reference/java/resources/fine_tuning/subresources/jobs/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning checkpoints
CheckpointListPage fineTuning().jobs().checkpoints().list(CheckpointListParamsparams = CheckpointListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
List checkpoints for a fine-tuning job.
##### ParametersExpand Collapse
CheckpointListParams params
Optional\<String\> fineTuningJobId
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) fine_tuning_job_id > (schema)>)
Optional\<String\> after
Identifier for the last checkpoint ID from the previous pagination request.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of checkpoints to retrieve.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) limit > (schema)>)
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default>)
##### ReturnsExpand Collapse
class FineTuningJobCheckpoint:
The `fine\_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
String id
The checkpoint identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the checkpoint was created.
formatunixtime
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) created_at>)
String fineTunedModelCheckpoint
The name of the fine-tuned checkpoint model that is created.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuned_model_checkpoint>)
String fineTuningJobId
The name of the fine-tuning job that this checkpoint was created from.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuning_job_id>)
Metrics metrics
Metrics at the step number during the fine-tuning job.
Optional\<Double\> fullValidLoss
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_loss>)
Optional\<Double\> fullValidMeanTokenAccuracy
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_mean_token_accuracy>)
Optional\<Double\> step
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) step>)
Optional\<Double\> trainLoss
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_loss>)
Optional\<Double\> trainMeanTokenAccuracy
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_mean_token_accuracy>)
Optional\<Double\> validLoss
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_loss>)
Optional\<Double\> validMeanTokenAccuracy
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics>)
JsonValue; object\_ "fine\_tuning.job.checkpoint"constant"fine\_tuning.job.checkpoint"constant
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) object>)
long stepNumber
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)
### List fine-tuning checkpoints
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
import com.openai.models.finetuning.jobs.checkpoints.CheckpointListPage;
import com.openai.models.finetuning.jobs.checkpoints.CheckpointListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CheckpointListPage page = client.fineTuning().jobs().checkpoints().list("ft-AF1WoRqd3aJAHsqc9NY7iL8F");
}
}`
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