Checkpoints | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Fine Tuning](/api/reference/typescript/resources/fine_tuning)
[Jobs](/api/reference/typescript/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Checkpoints
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List fine-tuning checkpoints](/api/reference/typescript/resources/fine_tuning/subresources/jobs/subresources/checkpoints/methods/list)
client.fineTuning.jobs.checkpoints.list(stringfineTuningJobID, CheckpointListParams { after, limit } query?, RequestOptionsoptions?): CursorPage\<[FineTuningJobCheckpoint](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>) { id, created\_at, fine\_tuned\_model\_checkpoint, 4 more } \>
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
##### ModelsExpand Collapse
FineTuningJobCheckpoint { id, created\_at, fine\_tuned\_model\_checkpoint, 4 more }
The `fine\_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
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
metrics: Metrics { full\_valid\_loss, full\_valid\_mean\_token\_accuracy, step, 4 more }
Metrics at the step number during the fine-tuning job.
full\_valid\_loss?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_loss>)
full\_valid\_mean\_token\_accuracy?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_mean_token_accuracy>)
step?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) step>)
train\_loss?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_loss>)
train\_mean\_token\_accuracy?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_mean_token_accuracy>)
valid\_loss?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_loss>)
valid\_mean\_token\_accuracy?: number
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics>)
object: "fine\_tuning.job.checkpoint"
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) object>)
step\_number: number
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)