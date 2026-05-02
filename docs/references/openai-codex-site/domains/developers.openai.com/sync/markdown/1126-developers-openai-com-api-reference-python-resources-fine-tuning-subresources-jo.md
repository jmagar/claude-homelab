Cancel fine-tuning | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Fine Tuning](/api/reference/python/resources/fine_tuning)
[Jobs](/api/reference/python/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Cancel fine-tuning
fine\_tuning.jobs.cancel(strfine\_tuning\_job\_id) -\> [FineTuningJob](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/cancel
Immediately cancel a fine-tune job.
##### ParametersExpand Collapse
fine\_tuning\_job\_id: str
[](<#(resource) fine_tuning.jobs > (method) cancel > (params) default > (param) fine_tuning_job_id > (schema)>)
##### ReturnsExpand Collapse
class FineTuningJob: …
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
id: str
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
error: Optional[Error]
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
code: str
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
message: str
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
param: Optional[str]
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
fine\_tuned\_model: Optional[str]
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
finished\_at: Optional[int]
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
hyperparameters: Hyperparameters
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
batch\_size: Optional[Union[Literal["auto"], int, null]]
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
int
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
learning\_rate\_multiplier: Optional[Union[Literal["auto"], float, null]]
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
float
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
n\_epochs: Optional[Union[Literal["auto"], int, null]]
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0>)
int
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters>)
model: str
The base model that is being fine-tuned.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) model>)
object: Literal["fine\_tuning.job"]
The object type, which is always “fine\_tuning.job”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) object>)
organization\_id: str
The organization that owns the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) organization_id>)
result\_files: List[str]
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
seed: int
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
status: Literal["validating\_files", "queued", "running", 3 more]
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
trained\_tokens: Optional[int]
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
training\_file: str
The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
validation\_file: Optional[str]
The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
estimated\_finish: Optional[int]
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
integrations: Optional[List[[FineTuningJobWandbIntegrationObject](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)]]
A list of integrations to enable for this fine-tuning job.
type: Literal["wandb"]
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/python/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
project: str
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
entity: Optional[str]
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
name: Optional[str]
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
tags: Optional[List[str]]
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
method: Optional[Method]
The method used for fine-tuning.
type: Literal["supervised", "dpo", "reinforcement"]
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
"supervised"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
"dpo"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
"reinforcement"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
dpo: Optional[DpoMethod]
Configuration for the DPO fine-tuning method.
hyperparameters: Optional[DpoHyperparameters]
The hyperparameters used for the DPO fine-tuning job.
batch\_size: Optional[Union[Literal["auto"], int, null]]
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
beta: Optional[Union[Literal["auto"], float, null]]
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
float
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
learning\_rate\_multiplier: Optional[Union[Literal["auto"], float, null]]
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: Optional[Union[Literal["auto"], int, null]]
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
reinforcement: Optional[ReinforcementMethod]
Configuration for the reinforcement fine-tuning method.
grader: Grader
The grader used for the fine-tuning job.
One of the following:
class StringCheckGrader: …
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: str
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: Literal["eq", "ne", "like", "ilike"]
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: str
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: Literal["string\_check"]
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader: …
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: Literal["cosine", "fuzzy\_match", "bleu", 8 more]
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: str
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: str
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: Literal["text\_similarity"]
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader: …
A PythonGrader object that runs a python script on the input.
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: str
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: Literal["python"]
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: Optional[str]
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader: …
A ScoreModelGrader object that uses a model to assign a score to the input.
input: List[Input]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: str
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: Literal["score\_model"]
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Optional[List[float]]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: Optional[SamplingParams]
The sampling parameters for the model.
max\_completions\_tokens: Optional[int]
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: Optional[ReasoningEffort]
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
One of the following:
"none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Optional[int]
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Optional[float]
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Optional[float]
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
class MultiGrader: …
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: str
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: Graders
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader: …
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: str
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: Literal["eq", "ne", "like", "ilike"]
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: str
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: Literal["string\_check"]
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader: …
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: Literal["cosine", "fuzzy\_match", "bleu", 8 more]
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: str
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: str
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: Literal["text\_similarity"]
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader: …
A PythonGrader object that runs a python script on the input.
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: str
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: Literal["python"]
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: Optional[str]
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader: …
A ScoreModelGrader object that uses a model to assign a score to the input.
input: List[Input]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: str
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: Literal["score\_model"]
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Optional[List[float]]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: Optional[SamplingParams]
The sampling parameters for the model.
max\_completions\_tokens: Optional[int]
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: Optional[ReasoningEffort]
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
One of the following:
"none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Optional[int]
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Optional[float]
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Optional[float]
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader: …
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: List[Input]
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: List[str]
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: str
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: List[str]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: Literal["label\_model"]
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: str
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: Literal["multi"]
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
hyperparameters: Optional[ReinforcementHyperparameters]
The hyperparameters used for the reinforcement fine-tuning job.
batch\_size: Optional[Union[Literal["auto"], int, null]]
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
compute\_multiplier: Optional[Union[Literal["auto"], float, null]]
Multiplier on amount of compute used for exploring search space during training.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
float
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
eval\_interval: Optional[Union[Literal["auto"], int, null]]
The number of training steps between evaluation runs.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
eval\_samples: Optional[Union[Literal["auto"], int, null]]
Number of evaluation samples to generate per training step.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
learning\_rate\_multiplier: Optional[Union[Literal["auto"], float, null]]
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: Optional[Union[Literal["auto"], int, null]]
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
reasoning\_effort: Optional[Literal["default", "low", "medium", "high"]]
Level of reasoning effort.
One of the following:
"default"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
"low"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
"medium"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
"high"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
supervised: Optional[SupervisedMethod]
Configuration for the supervised fine-tuning method.
hyperparameters: Optional[SupervisedHyperparameters]
The hyperparameters used for the fine-tuning job.
batch\_size: Optional[Union[Literal["auto"], int, null]]
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
learning\_rate\_multiplier: Optional[Union[Literal["auto"], float, null]]
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: Optional[Union[Literal["auto"], int, null]]
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
Literal["auto"]
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
### Cancel fine-tuning
Python
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
`from openai import OpenAI
client = OpenAI()
client.fine\_tuning.jobs.cancel("ftjob-abc123")
`
```
```
`{
"object": "fine\_tuning.job",
"id": "ftjob-abc123",
"model": "gpt-4o-mini-2024-07-18",
"created\_at": 1721764800,
"fine\_tuned\_model": null,
"organization\_id": "org-123",
"result\_files": [],
"status": "cancelled",
"validation\_file": "file-abc123",
"training\_file": "file-abc123"
}
`
```
##### Returns Examples
```
`{
"object": "fine\_tuning.job",
"id": "ftjob-abc123",
"model": "gpt-4o-mini-2024-07-18",
"created\_at": 1721764800,
"fine\_tuned\_model": null,
"organization\_id": "org-123",
"result\_files": [],
"status": "cancelled",
"validation\_file": "file-abc123",
"training\_file": "file-abc123"
}
`
```