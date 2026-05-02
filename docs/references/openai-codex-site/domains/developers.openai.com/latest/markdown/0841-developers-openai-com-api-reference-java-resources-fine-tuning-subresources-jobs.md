Resume fine-tuning | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
[Jobs](/api/reference/java/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Resume fine-tuning
[FineTuningJob](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) fineTuning().jobs().resume(JobResumeParamsparams = JobResumeParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/resume
Resume a fine-tune job.
##### ParametersExpand Collapse
JobResumeParams params
Optional\<String\> fineTuningJobId
[](<#(resource) fine_tuning.jobs > (method) resume > (params) default > (param) fine_tuning_job_id > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) resume > (params) default>)
##### ReturnsExpand Collapse
class FineTuningJob:
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
String id
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
Optional\<Error\> error
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
String code
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
String message
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
Optional\<String\> param
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
Optional\<String\> fineTunedModel
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
Optional\<Long\> finishedAt
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
Hyperparameters hyperparameters
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters>)
String model
The base model that is being fine-tuned.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) model>)
JsonValue; object\_ "fine\_tuning.job"constant"fine\_tuning.job"constant
The object type, which is always “fine\_tuning.job”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) object>)
String organizationId
The organization that owns the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) organization_id>)
List\<String\> resultFiles
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
long seed
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
Status status
The current status of the fine-tuning job, which can be either `validating\_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
One of the following:
VALIDATING\_FILES("validating\_files")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 0>)
QUEUED("queued")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 1>)
RUNNING("running")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 2>)
SUCCEEDED("succeeded")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 3>)
FAILED("failed")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 4>)
CANCELLED("cancelled")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status>)
Optional\<Long\> trainedTokens
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
String trainingFile
The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
Optional\<String\> validationFile
The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
Optional\<Long\> estimatedFinish
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
Optional\<List\<[FineTuningJobWandbIntegrationObject](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)\>\> integrations
A list of integrations to enable for this fine-tuning job.
JsonValue; type "wandb"constant"wandb"constant
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
[FineTuningJobWandbIntegration](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) wandb
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
String project
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
Optional\<String\> entity
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
Optional\<String\> name
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
Optional\<List\<String\>\> tags
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
Optional\<Method\> method
The method used for fine-tuning.
Type type
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
SUPERVISED("supervised")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
DPO("dpo")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
REINFORCEMENT("reinforcement")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
Optional\<[DpoMethod](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>)\> dpo
Configuration for the DPO fine-tuning method.
Optional\<[DpoHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the DPO fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
Optional\<Beta\> beta
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
Optional\<[ReinforcementMethod](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)\> reinforcement
Configuration for the reinforcement fine-tuning method.
Grader grader
The grader used for the fine-tuning job.
One of the following:
class StringCheckGrader:
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
String input
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation operation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
EQ("eq")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
NE("ne")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
LIKE("like")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
ILIKE("ilike")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
String reference
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
JsonValue; type "string\_check"constant"string\_check"constant
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader:
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric evaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
COSINE("cosine")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
FUZZY\_MATCH("fuzzy\_match")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
BLEU("bleu")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
GLEU("gleu")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
METEOR("meteor")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
ROUGE\_1("rouge\_1")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
ROUGE\_2("rouge\_2")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
ROUGE\_3("rouge\_3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
ROUGE\_4("rouge\_4")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
ROUGE\_5("rouge\_5")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
ROUGE\_L("rouge\_l")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
String input
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
String reference
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
JsonValue; type "text\_similarity"constant"text\_similarity"constant
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader:
A PythonGrader object that runs a python script on the input.
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
String source
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
JsonValue; type "python"constant"python"constant
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
Optional\<String\> imageTag
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader:
A ScoreModelGrader object that uses a model to assign a score to the input.
List\<Input\> input
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
String model
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
JsonValue; type "score\_model"constant"score\_model"constant
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Optional\<List\<Double\>\> range
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
Optional\<SamplingParams\> samplingParams
The sampling parameters for the model.
Optional\<Long\> maxCompletionsTokens
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
Optional\<[ReasoningEffort](</api/reference/java/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)\> reasoningEffort
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
NONE("none")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
class MultiGrader:
A MultiGrader object combines the output of multiple graders to produce a single score.
String calculateOutput
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
Graders graders
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader:
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
String input
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation operation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
EQ("eq")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
NE("ne")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
LIKE("like")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
ILIKE("ilike")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
String reference
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
JsonValue; type "string\_check"constant"string\_check"constant
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader:
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric evaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
COSINE("cosine")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
FUZZY\_MATCH("fuzzy\_match")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
BLEU("bleu")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
GLEU("gleu")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
METEOR("meteor")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
ROUGE\_1("rouge\_1")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
ROUGE\_2("rouge\_2")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
ROUGE\_3("rouge\_3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
ROUGE\_4("rouge\_4")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
ROUGE\_5("rouge\_5")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
ROUGE\_L("rouge\_l")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
String input
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
String reference
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
JsonValue; type "text\_similarity"constant"text\_similarity"constant
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader:
A PythonGrader object that runs a python script on the input.
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
String source
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
JsonValue; type "python"constant"python"constant
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
Optional\<String\> imageTag
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader:
A ScoreModelGrader object that uses a model to assign a score to the input.
List\<Input\> input
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
String model
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
JsonValue; type "score\_model"constant"score\_model"constant
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Optional\<List\<Double\>\> range
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
Optional\<SamplingParams\> samplingParams
The sampling parameters for the model.
Optional\<Long\> maxCompletionsTokens
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
Optional\<[ReasoningEffort](</api/reference/java/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)\> reasoningEffort
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
NONE("none")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader:
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
List\<Input\> input
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
List\<String\> labels
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
String model
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
List\<String\> passingLabels
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
JsonValue; type "label\_model"constant"label\_model"constant
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
String name
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
JsonValue; type "multi"constant"multi"constant
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
Optional\<[ReinforcementHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the reinforcement fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
Optional\<ComputeMultiplier\> computeMultiplier
Multiplier on amount of compute used for exploring search space during training.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
Optional\<EvalInterval\> evalInterval
The number of training steps between evaluation runs.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
Optional\<EvalSamples\> evalSamples
Number of evaluation samples to generate per training step.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
Optional\<ReasoningEffort\> reasoningEffort
Level of reasoning effort.
One of the following:
DEFAULT("default")
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
LOW("low")
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
MEDIUM("medium")
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
HIGH("high")
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
Optional\<[SupervisedMethod](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)\> supervised
Configuration for the supervised fine-tuning method.
Optional\<[SupervisedHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
### Resume fine-tuning
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
import com.openai.models.finetuning.jobs.FineTuningJob;
import com.openai.models.finetuning.jobs.JobResumeParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FineTuningJob fineTuningJob = client.fineTuning().jobs().resume("ft-AF1WoRqd3aJAHsqc9NY7iL8F");
}
}`
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
"status": "queued",
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
"status": "queued",
"validation\_file": "file-abc123",
"training\_file": "file-abc123"
}
`
```