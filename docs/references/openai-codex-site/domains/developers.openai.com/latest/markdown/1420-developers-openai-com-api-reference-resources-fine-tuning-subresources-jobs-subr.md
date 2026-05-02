List fine-tuning checkpoints | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Fine Tuning](/api/reference/resources/fine_tuning)
[Jobs](/api/reference/resources/fine_tuning/subresources/jobs)
[Checkpoints](/api/reference/resources/fine_tuning/subresources/jobs/subresources/checkpoints)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List fine-tuning checkpoints
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
List checkpoints for a fine-tuning job.
##### Path ParametersExpand Collapse
fine\_tuning\_job\_id: string
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) fine_tuning_job_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last checkpoint ID from the previous pagination request.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of checkpoints to retrieve.
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
data: array of [FineTuningJobCheckpoint](</api/reference/resources/fine_tuning#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>) { id, created\_at, fine\_tuned\_model\_checkpoint, 4 more }
id: string
The checkpoint identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the checkpoint was created.
formatunixtime
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) created_at>)
fine\_tuned\_model\_checkpoint: string
The name of the fine-tuned checkpoint model that is created.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuned_model_checkpoint>)
fine\_tuning\_job\_id: string
The name of the fine-tuning job that this checkpoint was created from.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuning_job_id>)
metrics: object { full\_valid\_loss, full\_valid\_mean\_token\_accuracy, step, 4 more }
Metrics at the step number during the fine-tuning job.
full\_valid\_loss: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_loss>)
full\_valid\_mean\_token\_accuracy: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_mean_token_accuracy>)
step: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) step>)
train\_loss: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_loss>)
train\_mean\_token\_accuracy: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_mean_token_accuracy>)
valid\_loss: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_loss>)
valid\_mean\_token\_accuracy: optional number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics>)
object: "fine\_tuning.job.checkpoint"
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) object>)
step\_number: number
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (network schema) > (property) data>)
has\_more: boolean
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (network schema) > (property) has_more>)
object: "list"
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (network schema) > (property) object>)
first\_id: optional string
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (network schema) > (property) first_id>)
last\_id: optional string
[](<#(resource) fine_tuning.jobs.checkpoints > (method) list > (network schema) > (property) last_id>)
### List fine-tuning checkpoints
HTTP
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
`curl https://api.openai.com/v1/fine\_tuning/jobs/ftjob-abc123/checkpoints \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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