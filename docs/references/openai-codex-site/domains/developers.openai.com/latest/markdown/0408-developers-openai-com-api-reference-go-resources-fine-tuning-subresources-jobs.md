Jobs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Jobs
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [Create fine-tuning job](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/create)
client.FineTuning.Jobs.New(ctx, body) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
POST/fine\_tuning/jobs
##### [List fine-tuning jobs](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/list)
client.FineTuning.Jobs.List(ctx, query) (\*CursorPage[[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)], error)
GET/fine\_tuning/jobs
##### [Retrieve fine-tuning job](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/retrieve)
client.FineTuning.Jobs.Get(ctx, fineTuningJobID) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}
##### [List fine-tuning events](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/list_events)
client.FineTuning.Jobs.ListEvents(ctx, fineTuningJobID, query) (\*CursorPage[[FineTuningJobEvent](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)], error)
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
##### [Cancel fine-tuning](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/cancel)
client.FineTuning.Jobs.Cancel(ctx, fineTuningJobID) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/cancel
##### [Pause fine-tuning](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/pause)
client.FineTuning.Jobs.Pause(ctx, fineTuningJobID) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/pause
##### [Resume fine-tuning](/api/reference/go/resources/fine_tuning/subresources/jobs/methods/resume)
client.FineTuning.Jobs.Resume(ctx, fineTuningJobID) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/resume
##### ModelsExpand Collapse
type FineTuningJob struct{…}
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
ID string
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
Error FineTuningJobError
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
Code string
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
Message string
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
Param string
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
FineTunedModel string
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
FinishedAt int64
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
Hyperparameters FineTuningJobHyperparameters
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
BatchSize FineTuningJobHyperparametersBatchSizeUnionOptional
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
LearningRateMultiplier FineTuningJobHyperparametersLearningRateMultiplierUnionOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
NEpochs FineTuningJobHyperparametersNEpochsUnionOptional
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters>)
Model string
The base model that is being fine-tuned.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) model>)
Object FineTuningJob
The object type, which is always “fine\_tuning.job”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) object>)
OrganizationID string
The organization that owns the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) organization_id>)
ResultFiles []string
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
Seed int64
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
Status FineTuningJobStatus
The current status of the fine-tuning job, which can be either `validating\_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
One of the following:
const FineTuningJobStatusValidatingFiles FineTuningJobStatus = "validating\_files"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 0>)
const FineTuningJobStatusQueued FineTuningJobStatus = "queued"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 1>)
const FineTuningJobStatusRunning FineTuningJobStatus = "running"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 2>)
const FineTuningJobStatusSucceeded FineTuningJobStatus = "succeeded"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 3>)
const FineTuningJobStatusFailed FineTuningJobStatus = "failed"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 4>)
const FineTuningJobStatusCancelled FineTuningJobStatus = "cancelled"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status>)
TrainedTokens int64
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
TrainingFile string
The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
ValidationFile string
The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
EstimatedFinish int64Optional
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
Integrations [][FineTuningJobWandbIntegrationObject](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)Optional
A list of integrations to enable for this fine-tuning job.
Type Wandb
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
Wandb [FineTuningJobWandbIntegration](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
Method FineTuningJobMethodOptional
The method used for fine-tuning.
Type string
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
const FineTuningJobMethodTypeSupervised FineTuningJobMethodType = "supervised"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
const FineTuningJobMethodTypeDpo FineTuningJobMethodType = "dpo"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
const FineTuningJobMethodTypeReinforcement FineTuningJobMethodType = "reinforcement"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
Dpo [DpoMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>)Optional
Configuration for the DPO fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
Reinforcement [ReinforcementMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)Optional
Configuration for the reinforcement fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
Supervised [SupervisedMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)Optional
Configuration for the supervised fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
type FineTuningJobEvent struct{…}
Fine-tuning job event object
ID string
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
Level FineTuningJobEventLevel
The log level of the event.
One of the following:
const FineTuningJobEventLevelInfo FineTuningJobEventLevel = "info"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
const FineTuningJobEventLevelWarn FineTuningJobEventLevel = "warn"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
const FineTuningJobEventLevelError FineTuningJobEventLevel = "error"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
Message string
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
Object FineTuningJobEvent
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
Data anyOptional
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
Type FineTuningJobEventTypeOptional
The type of event.
One of the following:
const FineTuningJobEventTypeMessage FineTuningJobEventType = "message"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
const FineTuningJobEventTypeMetrics FineTuningJobEventType = "metrics"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
type FineTuningJobWandbIntegration struct{…}
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
Project string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
Entity stringOptional
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
Name stringOptional
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
Tags []stringOptional
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
type FineTuningJobWandbIntegrationObject struct{…}
Type Wandb
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
Wandb [FineTuningJobWandbIntegration](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)
#### JobsCheckpoints
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List fine-tuning checkpoints](/api/reference/go/resources/fine_tuning/subresources/jobs/subresources/checkpoints/methods/list)
client.FineTuning.Jobs.Checkpoints.List(ctx, fineTuningJobID, query) (\*CursorPage[[FineTuningJobCheckpoint](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)], error)
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
##### ModelsExpand Collapse
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