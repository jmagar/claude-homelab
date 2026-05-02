Create fine-tuning job | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Fine Tuning](/api/reference/resources/fine_tuning)
[Jobs](/api/reference/resources/fine_tuning/subresources/jobs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create fine-tuning job
POST/fine\_tuning/jobs
Creates a fine-tuning job which begins the process of creating a new model from a given dataset.
Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.
[Learn more about fine-tuning](/docs/guides/model-optimization)
##### Body ParametersJSONExpand Collapse
model: string or "babbage-002" or "davinci-002" or "gpt-3.5-turbo" or "gpt-4o-mini"
The name of the model to fine-tune. You can select one of the
[supported models](/docs/guides/fine-tuning#which-models-can-be-fine-tuned).
One of the following:
string
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 0>)
"babbage-002" or "davinci-002" or "gpt-3.5-turbo" or "gpt-4o-mini"
The name of the model to fine-tune. You can select one of the
[supported models](/docs/guides/fine-tuning#which-models-can-be-fine-tuned).
One of the following:
"babbage-002"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 0>)
"davinci-002"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 1>)
"gpt-3.5-turbo"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 2>)
"gpt-4o-mini"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema) > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) model > (schema)>)
training\_file: string
The ID of an uploaded file that contains training data.
See [upload file](/docs/api-reference/files/create) for how to upload a file.
Your dataset must be formatted as a JSONL file. Additionally, you must upload your file with the purpose `fine-tune`.
The contents of the file should differ depending on if the model uses the [chat](/docs/api-reference/fine-tuning/chat-input), [completions](/docs/api-reference/fine-tuning/completions-input) format, or if the fine-tuning method uses the [preference](/docs/api-reference/fine-tuning/preference-input) format.
See the [fine-tuning guide](/docs/guides/model-optimization) for more details.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) training_file > (schema)>)
Deprecatedhyperparameters: optional object { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job.
This value is now deprecated in favor of `method`, and should be passed in under the `method` parameter.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) batch_size>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) hyperparameters > (schema)>)
integrations: optional array of object { type, wandb }
A list of integrations to enable for your fine-tuning job.
type: "wandb"
The type of integration to enable. Currently, only “wandb” (Weights and Biases) is supported.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) type>)
wandb: object { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
project: string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) wandb > (property) project>)
entity: optional string
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) wandb > (property) entity>)
name: optional string
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) wandb > (property) name>)
tags: optional array of string
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) wandb > (property) tags>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema) > (items) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) integrations > (schema)>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) metadata > (schema)>)
method: optional object { type, dpo, reinforcement, supervised }
The method used for fine-tuning.
type: "supervised" or "dpo" or "reinforcement"
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
"supervised"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) type > (member) 0>)
"dpo"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) type > (member) 1>)
"reinforcement"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) type>)
dpo: optional [DpoMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>) { hyperparameters }
Configuration for the DPO fine-tuning method.
hyperparameters: optional [DpoHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>) { batch\_size, beta, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the DPO fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
beta: optional "auto" or number
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) dpo>)
reinforcement: optional [ReinforcementMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>) { grader, hyperparameters }
Configuration for the reinforcement fine-tuning method.
grader: [StringCheckGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } or [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } or [PythonGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } or 2 more
The grader used for the fine-tuning job.
One of the following:
StringCheckGrader object { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: "eq" or "ne" or "like" or "ilike"
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: "string\_check"
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
TextSimilarityGrader object { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: "cosine" or "fuzzy\_match" or "bleu" or 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: string
The text being graded.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: "text\_similarity"
The type of grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
PythonGrader object { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: "python"
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: optional string
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
ScoreModelGrader object { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: array of object { content, role, type }
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: "score\_model"
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: optional array of number
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: optional object { max\_completions\_tokens, reasoning\_effort, seed, 2 more }
The sampling parameters for the model.
max\_completions\_tokens: optional number
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
MultiGrader object { calculate\_output, graders, name, type }
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: string
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: [StringCheckGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } or [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } or [PythonGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } or 2 more
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
StringCheckGrader object { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: "eq" or "ne" or "like" or "ilike"
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: "string\_check"
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
TextSimilarityGrader object { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: "cosine" or "fuzzy\_match" or "bleu" or 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: string
The text being graded.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: "text\_similarity"
The type of grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
PythonGrader object { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: "python"
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: optional string
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
ScoreModelGrader object { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: array of object { content, role, type }
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: "score\_model"
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: optional array of number
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: optional object { max\_completions\_tokens, reasoning\_effort, seed, 2 more }
The sampling parameters for the model.
max\_completions\_tokens: optional number
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
LabelModelGrader object { input, labels, model, 3 more }
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: array of object { content, role, type }
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: array of string
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: array of string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: "label\_model"
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: "multi"
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
hyperparameters: optional [ReinforcementHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>) { batch\_size, compute\_multiplier, eval\_interval, 4 more }
The hyperparameters used for the reinforcement fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
compute\_multiplier: optional "auto" or number
Multiplier on amount of compute used for exploring search space during training.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
eval\_interval: optional "auto" or number
The number of training steps between evaluation runs.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
eval\_samples: optional "auto" or number
Number of evaluation samples to generate per training step.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
reasoning\_effort: optional "default" or "low" or "medium" or "high"
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
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) reinforcement>)
supervised: optional [SupervisedMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>) { hyperparameters }
Configuration for the supervised fine-tuning method.
hyperparameters: optional [SupervisedHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>) { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema) > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) method > (schema)>)
seed: optional number
The seed controls the reproducibility of the job. Passing in the same seed and job parameters should produce the same results, but may differ in rare cases.
If a seed is not specified, one will be generated for you.
minimum0
maximum2147483647
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) seed > (schema)>)
suffix: optional string
A string of up to 64 characters that will be added to your fine-tuned model name.
For example, a `suffix` of “custom-model-name” would produce a model name like `ft:gpt-4o-mini:openai:custom-model-name:7p4lURel`.
minLength1
maxLength64
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) suffix > (schema)>)
validation\_file: optional string
The ID of an uploaded file that contains validation data.
If you provide this file, the data is used to generate validation
metrics periodically during fine-tuning. These metrics can be viewed in
the fine-tuning results file.
The same data should not be present in both train and validation files.
Your dataset must be formatted as a JSONL file. You must upload your file with the purpose `fine-tune`.
See the [fine-tuning guide](/docs/guides/model-optimization) for more details.
[](<#(resource) fine_tuning.jobs > (method) create > (params) 0 > (param) validation_file > (schema)>)
##### ReturnsExpand Collapse
FineTuningJob object { id, created\_at, error, 16 more }
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
id: string
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
error: object { code, message, param }
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
code: string
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
message: string
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
param: string
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
fine\_tuned\_model: string
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
finished\_at: number
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
hyperparameters: object { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
"auto"
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
result\_files: array of string
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
seed: number
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
status: "validating\_files" or "queued" or "running" or 3 more
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
trained\_tokens: number
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
training\_file: string
The file ID used for training. You can retrieve the training data with the [Files API](/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
validation\_file: string
The file ID used for validation. You can retrieve the validation results with the [Files API](/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
estimated\_finish: optional number
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
integrations: optional array of [FineTuningJobWandbIntegrationObject](</api/reference/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>) { type, wandb }
A list of integrations to enable for this fine-tuning job.
type: "wandb"
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
project: string
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
entity: optional string
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
name: optional string
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
tags: optional array of string
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb + (resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
method: optional object { type, dpo, reinforcement, supervised }
The method used for fine-tuning.
type: "supervised" or "dpo" or "reinforcement"
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
"supervised"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
"dpo"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
"reinforcement"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
dpo: optional [DpoMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>) { hyperparameters }
Configuration for the DPO fine-tuning method.
hyperparameters: optional [DpoHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>) { batch\_size, beta, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the DPO fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
beta: optional "auto" or number
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo + (resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
reinforcement: optional [ReinforcementMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>) { grader, hyperparameters }
Configuration for the reinforcement fine-tuning method.
grader: [StringCheckGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } or [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } or [PythonGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } or 2 more
The grader used for the fine-tuning job.
One of the following:
StringCheckGrader object { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: "eq" or "ne" or "like" or "ilike"
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
reference: string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: "string\_check"
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
TextSimilarityGrader object { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: "cosine" or "fuzzy\_match" or "bleu" or 8 more
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
input: string
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: "text\_similarity"
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
PythonGrader object { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: "python"
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: optional string
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
ScoreModelGrader object { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: array of object { content, role, type }
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
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
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: "score\_model"
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: optional array of number
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: optional object { max\_completions\_tokens, reasoning\_effort, seed, 2 more }
The sampling parameters for the model.
max\_completions\_tokens: optional number
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
MultiGrader object { calculate\_output, graders, name, type }
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: string
A formula to calculate the output based on grader results.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: [StringCheckGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } or [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } or [PythonGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } or 2 more
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
StringCheckGrader object { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: string
The input text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: "eq" or "ne" or "like" or "ilike"
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
reference: string
The reference text. This may include template strings.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: "string\_check"
The object type, which is always `string\_check`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) string_check_grader > (schema)>)
TextSimilarityGrader object { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: "cosine" or "fuzzy\_match" or "bleu" or 8 more
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
input: string
The text being graded.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: string
The text being graded against.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: "text\_similarity"
The type of grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
PythonGrader object { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: string
The source code of the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: "python"
The object type, which is always `python`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: optional string
The image tag to use for the python script.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) python_grader > (schema)>)
ScoreModelGrader object { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: array of object { content, role, type }
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
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
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: string
The model to use for the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: "score\_model"
The object type, which is always `score\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: optional array of number
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: optional object { max\_completions\_tokens, reasoning\_effort, seed, 2 more }
The sampling parameters for the model.
max\_completions\_tokens: optional number
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) score_model_grader > (schema)>)
LabelModelGrader object { input, labels, model, 3 more }
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: array of object { content, role, type }
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
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
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: array of string
The labels to assign to each item in the evaluation.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: array of string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: "label\_model"
The object type, which is always `label\_model`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: string
The name of the grader.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: "multi"
The object type, which is always `multi`.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement + (resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
hyperparameters: optional [ReinforcementHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>) { batch\_size, compute\_multiplier, eval\_interval, 4 more }
The hyperparameters used for the reinforcement fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
compute\_multiplier: optional "auto" or number
Multiplier on amount of compute used for exploring search space during training.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
eval\_interval: optional "auto" or number
The number of training steps between evaluation runs.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
eval\_samples: optional "auto" or number
Number of evaluation samples to generate per training step.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
reasoning\_effort: optional "default" or "low" or "medium" or "high"
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
supervised: optional [SupervisedMethod](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>) { hyperparameters }
Configuration for the supervised fine-tuning method.
hyperparameters: optional [SupervisedHyperparameters](</api/reference/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>) { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job.
batch\_size: optional "auto" or number
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
learning\_rate\_multiplier: optional "auto" or number
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: optional "auto" or number
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
"auto"
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
number
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters + (resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised + (resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
DefaultEpochsDPOReinforcementValidation fileW&B Integration
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-BK7bzQj3FfZFXr7DbL6xJwfo",
"model": "gpt-4o-mini"
}'
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
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-abc123",
"model": "gpt-4o-mini",
"method": {
"type": "supervised",
"supervised": {
"hyperparameters": {
"n\_epochs": 2
}
}
}
}'
`
```
```
`{
"object": "fine\_tuning.job",
"id": "ftjob-abc123",
"model": "gpt-4o-mini",
"created\_at": 1721764800,
"fine\_tuned\_model": null,
"organization\_id": "org-123",
"result\_files": [],
"status": "queued",
"validation\_file": null,
"training\_file": "file-abc123",
"hyperparameters": {
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": 2
},
"method": {
"type": "supervised",
"supervised": {
"hyperparameters": {
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": 2
}
}
},
"metadata": null,
"error": {
"code": null,
"message": null,
"param": null
},
"finished\_at": null,
"seed": 683058546,
"trained\_tokens": null,
"estimated\_finish": null,
"integrations": [],
"user\_provided\_suffix": null,
"usage\_metrics": null,
"shared\_with\_openai": false
}
`
```
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-abc123",
"validation\_file": "file-abc123",
"model": "gpt-4o-mini",
"method": {
"type": "dpo",
"dpo": {
"hyperparameters": {
"beta": 0.1
}
}
}
}'
`
```
```
`{
"object": "fine\_tuning.job",
"id": "ftjob-abc",
"model": "gpt-4o-mini",
"created\_at": 1746130590,
"fine\_tuned\_model": null,
"organization\_id": "org-abc",
"result\_files": [],
"status": "queued",
"validation\_file": "file-123",
"training\_file": "file-abc",
"method": {
"type": "dpo",
"dpo": {
"hyperparameters": {
"beta": 0.1,
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": "auto"
}
}
},
"metadata": null,
"error": {
"code": null,
"message": null,
"param": null
},
"finished\_at": null,
"hyperparameters": null,
"seed": 1036326793,
"estimated\_finish": null,
"integrations": [],
"user\_provided\_suffix": null,
"usage\_metrics": null,
"shared\_with\_openai": false
}
`
```
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-abc",
"validation\_file": "file-123",
"model": "o4-mini",
"method": {
"type": "reinforcement",
"reinforcement": {
"grader": {
"type": "string\_check",
"name": "Example string check grader",
"input": "{{sample.output\_text}}",
"reference": "{{item.label}}",
"operation": "eq"
},
"hyperparameters": {
"reasoning\_effort": "medium"
}
}
}
}'
`
```
```
`{
"object": "fine\_tuning.job",
"id": "ftjob-abc123",
"model": "o4-mini",
"created\_at": 1721764800,
"finished\_at": null,
"fine\_tuned\_model": null,
"organization\_id": "org-123",
"result\_files": [],
"status": "validating\_files",
"validation\_file": "file-123",
"training\_file": "file-abc",
"trained\_tokens": null,
"error": {},
"user\_provided\_suffix": null,
"seed": 950189191,
"estimated\_finish": null,
"integrations": [],
"method": {
"type": "reinforcement",
"reinforcement": {
"hyperparameters": {
"batch\_size": "auto",
"learning\_rate\_multiplier": "auto",
"n\_epochs": "auto",
"eval\_interval": "auto",
"eval\_samples": "auto",
"compute\_multiplier": "auto",
"reasoning\_effort": "medium"
},
"grader": {
"type": "string\_check",
"name": "Example string check grader",
"input": "{{sample.output\_text}}",
"reference": "{{item.label}}",
"operation": "eq"
},
"response\_format": null
}
},
"metadata": null,
"usage\_metrics": null,
"shared\_with\_openai": false
}
`
```
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-abc123",
"validation\_file": "file-abc123",
"model": "gpt-4o-mini"
}'
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
"validation\_file": "file-abc123",
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
### Create fine-tuning job
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
`curl https://api.openai.com/v1/fine\_tuning/jobs \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"training\_file": "file-abc123",
"validation\_file": "file-abc123",
"model": "gpt-4o-mini",
"integrations": [
{
"type": "wandb",
"wandb": {
"project": "my-wandb-project",
"name": "ft-run-display-name"
"tags": [
"first-experiment", "v2"
]
}
}
]
}'
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
"validation\_file": "file-abc123",
"training\_file": "file-abc123",
"integrations": [
{
"type": "wandb",
"wandb": {
"project": "my-wandb-project",
"entity": None,
"run\_id": "ftjob-abc123"
}
}
],
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