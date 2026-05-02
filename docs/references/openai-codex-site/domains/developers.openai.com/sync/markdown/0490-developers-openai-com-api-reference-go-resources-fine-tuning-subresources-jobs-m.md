Create fine-tuning job | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Jobs](/api/reference/go/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create fine-tuning job
client.FineTuning.Jobs.New(ctx, body) (\*[FineTuningJob](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>), error)
POST/fine\_tuning/jobs
Creates a fine-tuning job which begins the process of creating a new model from a given dataset.
Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.
[Learn more about fine-tuning](https://platform.openai.com/docs/guides/model-optimization)
##### ParametersExpand Collapse
body FineTuningJobNewParams
Model param.Field[FineTuningJobNewParamsModel]
The name of the model to fine-tune. You can select one of the
[supported models](https://platform.openai.com/docs/guides/fine-tuning#which-models-can-be-fine-tuned).
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
type FineTuningJobNewParamsModel string
The name of the model to fine-tune. You can select one of the
[supported models](https://platform.openai.com/docs/guides/fine-tuning#which-models-can-be-fine-tuned).
One of the following:
const FineTuningJobNewParamsModelBabbage002 FineTuningJobNewParamsModel = "babbage-002"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 1 > (member) 0>)
const FineTuningJobNewParamsModelDavinci002 FineTuningJobNewParamsModel = "davinci-002"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 1 > (member) 1>)
const FineTuningJobNewParamsModelGPT3\_5Turbo FineTuningJobNewParamsModel = "gpt-3.5-turbo"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 1 > (member) 2>)
const FineTuningJobNewParamsModelGPT4oMini FineTuningJobNewParamsModel = "gpt-4o-mini"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 1 > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model > (schema) > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) model>)
TrainingFile param.Field[string]
The ID of an uploaded file that contains training data.
See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.
Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.
The contents of the file should differ depending on if the model uses the [chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input), [completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) format, or if the fine-tuning method uses the [preference](https://platform.openai.com/docs/api-reference/fine-tuning/preference-input) format.
See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) training_file>)
DeprecatedHyperparameters param.Field[[FineTuningJobNewParamsHyperparameters](</api/reference/go/resources/fine_tuning/subresources/jobs/methods/create#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema)>)]Optional
The hyperparameters used for the fine-tuning job.
This value is now deprecated in favor of `method`, and should be passed in under the `method` parameter.
BatchSize FineTuningJobNewParamsHyperparametersBatchSizeUnionOptional
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) batch_size>)
LearningRateMultiplier FineTuningJobNewParamsHyperparametersLearningRateMultiplierUnionOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs FineTuningJobNewParamsHyperparametersNEpochsUnionOptional
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) hyperparameters>)
Integrations param.Field[[]FineTuningJobNewParamsIntegration]Optional
A list of integrations to enable for your fine-tuning job.
Type Wandb
The type of integration to enable. Currently, only “wandb” (Weights and Biases) is supported.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) type>)
Wandb FineTuningJobNewParamsIntegrationWandb
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
Project string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) wandb > (property) project>)
Entity stringOptional
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) wandb > (property) entity>)
Name stringOptional
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) wandb > (property) name>)
Tags []stringOptional
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) wandb > (property) tags>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations > (schema) > (items) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) integrations>)
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) metadata>)
Method param.Field[[FineTuningJobNewParamsMethod](</api/reference/go/resources/fine_tuning/subresources/jobs/methods/create#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema)>)]Optional
The method used for fine-tuning.
Type string
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
const FineTuningJobNewParamsMethodTypeSupervised FineTuningJobNewParamsMethodType = "supervised"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) type > (member) 0>)
const FineTuningJobNewParamsMethodTypeDpo FineTuningJobNewParamsMethodType = "dpo"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) type > (member) 1>)
const FineTuningJobNewParamsMethodTypeReinforcement FineTuningJobNewParamsMethodType = "reinforcement"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) type>)
Dpo [DpoMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>)Optional
Configuration for the DPO fine-tuning method.
Hyperparameters [DpoHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)Optional
The hyperparameters used for the DPO fine-tuning job.
BatchSize DpoHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
Beta DpoHyperparametersBetaUnionRespOptional
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
LearningRateMultiplier DpoHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs DpoHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) dpo>)
Reinforcement [ReinforcementMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)Optional
Configuration for the reinforcement fine-tuning method.
Grader ReinforcementMethodGraderUnion
The grader used for the fine-tuning job.
One of the following:
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
ReasoningEffort [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)Optional
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
const ReasoningEffortNone [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
const ReasoningEffortMinimal [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
const ReasoningEffortLow [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
const ReasoningEffortMedium [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
const ReasoningEffortHigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
const ReasoningEffortXhigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
type MultiGrader struct{…}
A MultiGrader object combines the output of multiple graders to produce a single score.
CalculateOutput string
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
Graders MultiGraderGradersUnion
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
ReasoningEffort [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)Optional
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
const ReasoningEffortNone [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
const ReasoningEffortMinimal [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
const ReasoningEffortLow [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
const ReasoningEffortMedium [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
const ReasoningEffortHigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
const ReasoningEffortXhigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
type LabelModelGrader struct{…}
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
Input []LabelModelGraderInput
Content LabelModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type LabelModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type LabelModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const LabelModelGraderInputRoleUser LabelModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const LabelModelGraderInputRoleAssistant LabelModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const LabelModelGraderInputRoleSystem LabelModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const LabelModelGraderInputRoleDeveloper LabelModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
Labels []string
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
Model string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
PassingLabels []string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
Type LabelModel
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
Type Multi
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
Hyperparameters [ReinforcementHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)Optional
The hyperparameters used for the reinforcement fine-tuning job.
BatchSize ReinforcementHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
ComputeMultiplier ReinforcementHyperparametersComputeMultiplierUnionRespOptional
Multiplier on amount of compute used for exploring search space during training.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
EvalInterval ReinforcementHyperparametersEvalIntervalUnionRespOptional
The number of training steps between evaluation runs.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
EvalSamples ReinforcementHyperparametersEvalSamplesUnionRespOptional
Number of evaluation samples to generate per training step.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
LearningRateMultiplier ReinforcementHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs ReinforcementHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
ReasoningEffort ReinforcementHyperparametersReasoningEffortOptional
Level of reasoning effort.
One of the following:
const ReinforcementHyperparametersReasoningEffortDefault ReinforcementHyperparametersReasoningEffort = "default"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
const ReinforcementHyperparametersReasoningEffortLow ReinforcementHyperparametersReasoningEffort = "low"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
const ReinforcementHyperparametersReasoningEffortMedium ReinforcementHyperparametersReasoningEffort = "medium"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
const ReinforcementHyperparametersReasoningEffortHigh ReinforcementHyperparametersReasoningEffort = "high"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) reinforcement>)
Supervised [SupervisedMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)Optional
Configuration for the supervised fine-tuning method.
Hyperparameters [SupervisedHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)Optional
The hyperparameters used for the fine-tuning job.
BatchSize SupervisedHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
LearningRateMultiplier SupervisedHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs SupervisedHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method > (schema) > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) method>)
Seed param.Field[int64]Optional
The seed controls the reproducibility of the job. Passing in the same seed and job parameters should produce the same results, but may differ in rare cases.
If a seed is not specified, one will be generated for you.
minimum0
maximum2147483647
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) seed>)
Suffix param.Field[string]Optional
A string of up to 64 characters that will be added to your fine-tuned model name.
For example, a `suffix` of “custom-model-name” would produce a model name like `ft:gpt-4o-mini:openai:custom-model-name:7p4lURel`.
minLength1
maxLength64
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) suffix>)
ValidationFile param.Field[string]Optional
The ID of an uploaded file that contains validation data.
If you provide this file, the data is used to generate validation
metrics periodically during fine-tuning. These metrics can be viewed in
the fine-tuning results file.
The same data should not be present in both train and validation files.
Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.
See the [fine-tuning guide](https://platform.openai.com/docs/guides/model-optimization) for more details.
[](<#(resource) fine_tuning.jobs > (method) create > (params) default > (param) validation_file>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) default>)
##### ReturnsExpand Collapse
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
Project string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
Entity stringOptional
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
Name stringOptional
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
Tags []stringOptional
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
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
Hyperparameters [DpoHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)Optional
The hyperparameters used for the DPO fine-tuning job.
BatchSize DpoHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
Beta DpoHyperparametersBetaUnionRespOptional
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
LearningRateMultiplier DpoHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs DpoHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
Reinforcement [ReinforcementMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)Optional
Configuration for the reinforcement fine-tuning method.
Grader ReinforcementMethodGraderUnion
The grader used for the fine-tuning job.
One of the following:
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
ReasoningEffort [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)Optional
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
const ReasoningEffortNone [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
const ReasoningEffortMinimal [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
const ReasoningEffortLow [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
const ReasoningEffortMedium [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
const ReasoningEffortHigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
const ReasoningEffortXhigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
type MultiGrader struct{…}
A MultiGrader object combines the output of multiple graders to produce a single score.
CalculateOutput string
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
Graders MultiGraderGradersUnion
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
ReasoningEffort [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)Optional
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
const ReasoningEffortNone [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "none"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
const ReasoningEffortMinimal [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "minimal"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
const ReasoningEffortLow [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "low"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
const ReasoningEffortMedium [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "medium"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
const ReasoningEffortHigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "high"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
const ReasoningEffortXhigh [ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) = "xhigh"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
type LabelModelGrader struct{…}
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
Input []LabelModelGraderInput
Content LabelModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type LabelModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type LabelModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const LabelModelGraderInputRoleUser LabelModelGraderInputRole = "user"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const LabelModelGraderInputRoleAssistant LabelModelGraderInputRole = "assistant"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const LabelModelGraderInputRoleSystem LabelModelGraderInputRole = "system"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const LabelModelGraderInputRoleDeveloper LabelModelGraderInputRole = "developer"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
Labels []string
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
Model string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
PassingLabels []string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
Type LabelModel
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
Name string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
Type Multi
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
Hyperparameters [ReinforcementHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)Optional
The hyperparameters used for the reinforcement fine-tuning job.
BatchSize ReinforcementHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
ComputeMultiplier ReinforcementHyperparametersComputeMultiplierUnionRespOptional
Multiplier on amount of compute used for exploring search space during training.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
EvalInterval ReinforcementHyperparametersEvalIntervalUnionRespOptional
The number of training steps between evaluation runs.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
EvalSamples ReinforcementHyperparametersEvalSamplesUnionRespOptional
Number of evaluation samples to generate per training step.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
LearningRateMultiplier ReinforcementHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs ReinforcementHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
ReasoningEffort ReinforcementHyperparametersReasoningEffortOptional
Level of reasoning effort.
One of the following:
const ReinforcementHyperparametersReasoningEffortDefault ReinforcementHyperparametersReasoningEffort = "default"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
const ReinforcementHyperparametersReasoningEffortLow ReinforcementHyperparametersReasoningEffort = "low"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
const ReinforcementHyperparametersReasoningEffortMedium ReinforcementHyperparametersReasoningEffort = "medium"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
const ReinforcementHyperparametersReasoningEffortHigh ReinforcementHyperparametersReasoningEffort = "high"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
Supervised [SupervisedMethod](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)Optional
Configuration for the supervised fine-tuning method.
Hyperparameters [SupervisedHyperparametersResp](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)Optional
The hyperparameters used for the fine-tuning job.
BatchSize SupervisedHyperparametersBatchSizeUnionRespOptional
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
LearningRateMultiplier SupervisedHyperparametersLearningRateMultiplierUnionRespOptional
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
float64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
NEpochs SupervisedHyperparametersNEpochsUnionRespOptional
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
type Auto string
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
int64
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
### Create fine-tuning job
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
fineTuningJob, err := client.FineTuning.Jobs.New(context.TODO(), openai.FineTuningJobNewParams{
Model: openai.FineTuningJobNewParamsModelGPT4oMini,
TrainingFile: "file-abc123",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", fineTuningJob.ID)
}
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
"status": "queued",
"validation\_file": null,
"training\_file": "file-abc123",
"method": {
"type": "supervised",
"supervised": {
"hyperparameters": {
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": "auto",
}
}
},
"metadata": null
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
"validation\_file": null,
"training\_file": "file-abc123",
"method": {
"type": "supervised",
"supervised": {
"hyperparameters": {
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": "auto",
}
}
},
"metadata": null
}
`
```