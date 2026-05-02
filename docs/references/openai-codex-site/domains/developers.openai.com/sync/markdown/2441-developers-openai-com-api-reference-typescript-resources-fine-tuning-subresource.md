Jobs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Fine Tuning](/api/reference/typescript/resources/fine_tuning)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Jobs
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [Create fine-tuning job](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/create)
client.fineTuning.jobs.create(JobCreateParams { model, training\_file, hyperparameters, 6 more } body, RequestOptionsoptions?): [FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs
##### [List fine-tuning jobs](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/list)
client.fineTuning.jobs.list(JobListParams { after, limit, metadata } query?, RequestOptionsoptions?): CursorPage\<[FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more } \>
GET/fine\_tuning/jobs
##### [Retrieve fine-tuning job](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/retrieve)
client.fineTuning.jobs.retrieve(stringfineTuningJobID, RequestOptionsoptions?): [FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}
##### [List fine-tuning events](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/list_events)
client.fineTuning.jobs.listEvents(stringfineTuningJobID, JobListEventsParams { after, limit } query?, RequestOptionsoptions?): CursorPage\<[FineTuningJobEvent](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>) { id, created\_at, level, 4 more } \>
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
##### [Cancel fine-tuning](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/cancel)
client.fineTuning.jobs.cancel(stringfineTuningJobID, RequestOptionsoptions?): [FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/cancel
##### [Pause fine-tuning](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/pause)
client.fineTuning.jobs.pause(stringfineTuningJobID, RequestOptionsoptions?): [FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/pause
##### [Resume fine-tuning](/api/reference/typescript/resources/fine_tuning/subresources/jobs/methods/resume)
client.fineTuning.jobs.resume(stringfineTuningJobID, RequestOptionsoptions?): [FineTuningJob](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/resume
##### ModelsExpand Collapse
FineTuningJob { id, created\_at, error, 16 more }
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
id: string
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
error: Error | null
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
code: string
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
message: string
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
param: string | null
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
fine\_tuned\_model: string | null
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
finished\_at: number | null
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
hyperparameters: Hyperparameters { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
batch\_size?: "auto" | number | null
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
"auto"
"auto"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0 > (member) 0>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
learning\_rate\_multiplier?: "auto" | number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
"auto"
"auto"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0 > (member) 0>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
n\_epochs?: "auto" | number
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
"auto"
"auto"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0 > (member) 0>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters>)
model: string
The base model that is being fine-tuned.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) model>)
object: "fine\_tuning.job"
The object type, which is always “fine\_tuning.job”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) object>)
organization\_id: string
The organization that owns the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) organization_id>)
result\_files: Array\<string\>
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
seed: number
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
status: "validating\_files" | "queued" | "running" | 3 more
The current status of the fine-tuning job, which can be either `validating\_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
One of the following:
"validating\_files"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 0>)
"queued"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 1>)
"running"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 2>)
"succeeded"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 4>)
"cancelled"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status>)
trained\_tokens: number | null
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
training\_file: string
The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
validation\_file: string | null
The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
estimated\_finish?: number | null
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
integrations?: Array\<[FineTuningJobWandbIntegrationObject](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>) { type, wandb } \> | null
A list of integrations to enable for this fine-tuning job.
type: "wandb"
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
metadata?: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
method?: Method { type, dpo, reinforcement, supervised }
The method used for fine-tuning.
type: "supervised" | "dpo" | "reinforcement"
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
"supervised"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
"dpo"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
"reinforcement"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
dpo?: [DpoMethod](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>) { hyperparameters }
Configuration for the DPO fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
reinforcement?: [ReinforcementMethod](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>) { grader, hyperparameters }
Configuration for the reinforcement fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
supervised?: [SupervisedMethod](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>) { hyperparameters }
Configuration for the supervised fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
FineTuningJobEvent { id, created\_at, level, 4 more }
Fine-tuning job event object
id: string
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
level: "info" | "warn" | "error"
The log level of the event.
One of the following:
"info"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
"warn"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
"error"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
message: string
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
object: "fine\_tuning.job.event"
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
data?: unknown
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
type?: "message" | "metrics"
The type of event.
One of the following:
"message"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
"metrics"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
FineTuningJobWandbIntegration { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
project: string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
entity?: string | null
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
name?: string | null
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
tags?: Array\<string\>
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
FineTuningJobWandbIntegrationObject { type, wandb }
type: "wandb"
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/typescript/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)
#### JobsCheckpoints
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