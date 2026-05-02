Fine Tuning | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fine Tuning
#### Fine TuningMethods
##### ModelsExpand Collapse
class DpoHyperparameters { batch\_size, beta, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the DPO fine-tuning job.
batch\_size: :auto | Integer
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
BatchSize = :auto
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
beta: :auto | Float
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
Beta = :auto
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
learning\_rate\_multiplier: :auto | Float
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
LearningRateMultiplier = :auto
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: :auto | Integer
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
NEpochs = :auto
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)
class DpoMethod { hyperparameters }
Configuration for the DPO fine-tuning method.
hyperparameters: [DpoHyperparameters](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>) { batch\_size, beta, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the DPO fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema)>)
class ReinforcementHyperparameters { batch\_size, compute\_multiplier, eval\_interval, 4 more }
The hyperparameters used for the reinforcement fine-tuning job.
batch\_size: :auto | Integer
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
BatchSize = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
compute\_multiplier: :auto | Float
Multiplier on amount of compute used for exploring search space during training.
One of the following:
ComputeMultiplier = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
eval\_interval: :auto | Integer
The number of training steps between evaluation runs.
One of the following:
EvalInterval = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
eval\_samples: :auto | Integer
Number of evaluation samples to generate per training step.
One of the following:
EvalSamples = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
learning\_rate\_multiplier: :auto | Float
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
LearningRateMultiplier = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: :auto | Integer
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
NEpochs = :auto
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
reasoning\_effort: :default | :low | :medium | :high
Level of reasoning effort.
One of the following:
:default
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
:low
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
:medium
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
:high
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)
class ReinforcementMethod { grader, hyperparameters }
Configuration for the reinforcement fine-tuning method.
grader: [StringCheckGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } | [TextSimilarityGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } | [PythonGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } | 2 more
The grader used for the fine-tuning job.
One of the following:
class StringCheckGrader { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: String
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: :eq | :ne | :like | :ilike
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
:eq
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
:ne
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
:like
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
:ilike
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: String
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: :string\_check
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: :cosine | :fuzzy\_match | :bleu | 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
:cosine
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
:fuzzy\_match
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
:bleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
:gleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
:meteor
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
:rouge\_1
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
:rouge\_2
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
:rouge\_3
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
:rouge\_4
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
:rouge\_5
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
:rouge\_l
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: String
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: String
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: :text\_similarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: String
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: :python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: String
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: Array[Input{ content, role, type}]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: String
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: :score\_model
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Array[Float]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: SamplingParams{ max\_completions\_tokens, reasoning\_effort, seed, 2 more}
The sampling parameters for the model.
max\_completions\_tokens: Integer
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: [ReasoningEffort](</api/reference/ruby/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Integer
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Float
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Float
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class MultiGrader { calculate\_output, graders, name, type }
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: String
A formula to calculate the output based on grader results.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: [StringCheckGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } | [TextSimilarityGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } | [PythonGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } | 2 more
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: String
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: :eq | :ne | :like | :ilike
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
:eq
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
:ne
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
:like
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
:ilike
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: String
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: :string\_check
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: :cosine | :fuzzy\_match | :bleu | 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
:cosine
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
:fuzzy\_match
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
:bleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
:gleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
:meteor
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
:rouge\_1
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
:rouge\_2
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
:rouge\_3
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
:rouge\_4
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
:rouge\_5
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
:rouge\_l
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: String
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: String
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: :text\_similarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: String
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: :python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: String
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: Array[Input{ content, role, type}]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: String
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: :score\_model
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Array[Float]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: SamplingParams{ max\_completions\_tokens, reasoning\_effort, seed, 2 more}
The sampling parameters for the model.
max\_completions\_tokens: Integer
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: [ReasoningEffort](</api/reference/ruby/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Integer
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Float
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Float
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader { input, labels, model, 3 more }
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: Array[Input{ content, role, type}]
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: Array[String]
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: String
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: Array[String]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: :label\_model
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: :multi
The object type, which is always `multi`.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
hyperparameters: [ReinforcementHyperparameters](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>) { batch\_size, compute\_multiplier, eval\_interval, 4 more }
The hyperparameters used for the reinforcement fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)
class SupervisedHyperparameters { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job.
batch\_size: :auto | Integer
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
BatchSize = :auto
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
learning\_rate\_multiplier: :auto | Float
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
LearningRateMultiplier = :auto
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
n\_epochs: :auto | Integer
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
NEpochs = :auto
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)
class SupervisedMethod { hyperparameters }
Configuration for the supervised fine-tuning method.
hyperparameters: [SupervisedHyperparameters](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>) { batch\_size, learning\_rate\_multiplier, n\_epochs }
The hyperparameters used for the fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)
#### Fine TuningJobs
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [Create fine-tuning job](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/create)
fine\_tuning.jobs.create(\*\*kwargs) -\> [FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs
##### [List fine-tuning jobs](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/list)
fine\_tuning.jobs.list(\*\*kwargs) -\> CursorPage\<[FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more } \>
GET/fine\_tuning/jobs
##### [Retrieve fine-tuning job](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/retrieve)
fine\_tuning.jobs.retrieve(fine\_tuning\_job\_id) -\> [FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}
##### [List fine-tuning events](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/list_events)
fine\_tuning.jobs.list\_events(fine\_tuning\_job\_id, \*\*kwargs) -\> CursorPage\<[FineTuningJobEvent](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>) { id, created\_at, level, 4 more } \>
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/events
##### [Cancel fine-tuning](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/cancel)
fine\_tuning.jobs.cancel(fine\_tuning\_job\_id) -\> [FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/cancel
##### [Pause fine-tuning](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/pause)
fine\_tuning.jobs.pause(fine\_tuning\_job\_id) -\> [FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/pause
##### [Resume fine-tuning](/api/reference/ruby/resources/fine_tuning/subresources/jobs/methods/resume)
fine\_tuning.jobs.resume(fine\_tuning\_job\_id) -\> [FineTuningJob](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>) { id, created\_at, error, 16 more }
POST/fine\_tuning/jobs/{fine\_tuning\_job\_id}/resume
##### ModelsExpand Collapse
class FineTuningJob { id, created\_at, error, 16 more }
The `fine\_tuning.job` object represents a fine-tuning job that has been created through the API.
id: String
The object identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) created_at>)
error: Error{ code, message, param}
For fine-tuning jobs that have `failed`, this will contain more information on the cause of the failure.
code: String
A machine-readable error code.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) code>)
message: String
A human-readable error message.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) message>)
param: String
The parameter that was invalid, usually `training\_file` or `validation\_file`. This field will be null if the failure was not parameter-specific.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error > (property) param>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) error>)
fine\_tuned\_model: String
The name of the fine-tuned model that is being created. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) fine_tuned_model>)
finished\_at: Integer
The Unix timestamp (in seconds) for when the fine-tuning job was finished. The value will be null if the fine-tuning job is still running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) finished_at>)
hyperparameters: Hyperparameters{ batch\_size, learning\_rate\_multiplier, n\_epochs}
The hyperparameters used for the fine-tuning job. This value will only be returned when running `supervised` jobs.
batch\_size: :auto | Integer
Number of examples in each batch. A larger batch size means that model parameters
are updated less frequently, but with lower variance.
One of the following:
BatchSize = :auto
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) batch_size>)
learning\_rate\_multiplier: :auto | Float
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid
overfitting.
One of the following:
LearningRateMultiplier = :auto
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 0>)
Float = Float
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) learning_rate_multiplier>)
n\_epochs: :auto | Integer
The number of epochs to train the model for. An epoch refers to one full cycle
through the training dataset.
One of the following:
NEpochs = :auto
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 0>)
Integer = Integer
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters > (property) n_epochs>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) hyperparameters>)
model: String
The base model that is being fine-tuned.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) model>)
object: :"fine\_tuning.job"
The object type, which is always “fine\_tuning.job”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) object>)
organization\_id: String
The organization that owns the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) organization_id>)
result\_files: Array[String]
The compiled results file ID(s) for the fine-tuning job. You can retrieve the results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) result_files>)
seed: Integer
The seed used for the fine-tuning job.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) seed>)
status: :validating\_files | :queued | :running | 3 more
The current status of the fine-tuning job, which can be either `validating\_files`, `queued`, `running`, `succeeded`, `failed`, or `cancelled`.
One of the following:
:validating\_files
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 0>)
:queued
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 1>)
:running
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 2>)
:succeeded
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 3>)
:failed
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 4>)
:cancelled
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status > (member) 5>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) status>)
trained\_tokens: Integer
The total number of billable tokens processed by this fine-tuning job. The value will be null if the fine-tuning job is still running.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) trained_tokens>)
training\_file: String
The file ID used for training. You can retrieve the training data with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) training_file>)
validation\_file: String
The file ID used for validation. You can retrieve the validation results with the [Files API](https://platform.openai.com/docs/api-reference/files/retrieve-contents).
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) validation_file>)
estimated\_finish: Integer
The Unix timestamp (in seconds) for when the fine-tuning job is estimated to finish. The value will be null if the fine-tuning job is not running.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) estimated_finish>)
integrations: Array[[FineTuningJobWandbIntegrationObject](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>) { type, wandb } ]
A list of integrations to enable for this fine-tuning job.
type: :wandb
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) integrations>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) metadata>)
method\_: Method{ type, dpo, reinforcement, supervised}
The method used for fine-tuning.
type: :supervised | :dpo | :reinforcement
The type of method. Is either `supervised`, `dpo`, or `reinforcement`.
One of the following:
:supervised
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 0>)
:dpo
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 1>)
:reinforcement
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) type>)
dpo: [DpoMethod](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_method > (schema)>) { hyperparameters }
Configuration for the DPO fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) dpo>)
reinforcement: [ReinforcementMethod](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>) { grader, hyperparameters }
Configuration for the reinforcement fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) reinforcement>)
supervised: [SupervisedMethod](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_method > (schema)>) { hyperparameters }
Configuration for the supervised fine-tuning method.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method > (property) supervised>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema) > (property) method>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job > (schema)>)
class FineTuningJobEvent { id, created\_at, level, 4 more }
Fine-tuning job event object
id: String
The object identifier.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the fine-tuning job was created.
formatunixtime
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) created_at>)
level: :info | :warn | :error
The log level of the event.
One of the following:
:info
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 0>)
:warn
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 1>)
:error
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level > (member) 2>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) level>)
message: String
The message of the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) message>)
object: :"fine\_tuning.job.event"
The object type, which is always “fine\_tuning.job.event”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) object>)
data: untyped
The data associated with the event.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) data>)
type: :message | :metrics
The type of event.
One of the following:
:message
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 0>)
:metrics
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type > (member) 1>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema) > (property) type>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_event > (schema)>)
class FineTuningJobWandbIntegration { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
project: String
The name of the project that the new run will be created under.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) project>)
entity: String
The entity to use for the run. This allows you to set the team or username of the WandB user that you would
like associated with the run. If not set, the default entity for the registered WandB API key is used.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) entity>)
name: String
A display name to set for the run. If not set, we will use the Job ID as the name.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) name>)
tags: Array[String]
A list of tags to be attached to the newly created run. These tags are passed through directly to WandB. Some
default tags are generated by OpenAI: “openai/finetune”, “openai/{base-model}”, “openai/{ftjob-abcdef}”.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema) > (property) tags>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>)
class FineTuningJobWandbIntegrationObject { type, wandb }
type: :wandb
The type of the integration being enabled for the fine-tuning job
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) type>)
wandb: [FineTuningJobWandbIntegration](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration > (schema)>) { project, entity, name, tags }
The settings for your integration with Weights and Biases. This payload specifies the project that
metrics will be sent to. Optionally, you can set an explicit display name for your run, add tags
to your run, and set a default entity (team, username, etc) to be associated with your run.
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema) > (property) wandb>)
[](<#(resource) fine_tuning.jobs > (model) fine_tuning_job_wandb_integration_object > (schema)>)
#### Fine TuningJobsCheckpoints
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List fine-tuning checkpoints](/api/reference/ruby/resources/fine_tuning/subresources/jobs/subresources/checkpoints/methods/list)
fine\_tuning.jobs.checkpoints.list(fine\_tuning\_job\_id, \*\*kwargs) -\> CursorPage\<[FineTuningJobCheckpoint](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>) { id, created\_at, fine\_tuned\_model\_checkpoint, 4 more } \>
GET/fine\_tuning/jobs/{fine\_tuning\_job\_id}/checkpoints
##### ModelsExpand Collapse
class FineTuningJobCheckpoint { id, created\_at, fine\_tuned\_model\_checkpoint, 4 more }
The `fine\_tuning.job.checkpoint` object represents a model checkpoint for a fine-tuning job that is ready to use.
id: String
The checkpoint identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the checkpoint was created.
formatunixtime
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) created_at>)
fine\_tuned\_model\_checkpoint: String
The name of the fine-tuned checkpoint model that is created.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuned_model_checkpoint>)
fine\_tuning\_job\_id: String
The name of the fine-tuning job that this checkpoint was created from.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) fine_tuning_job_id>)
metrics: Metrics{ full\_valid\_loss, full\_valid\_mean\_token\_accuracy, step, 4 more}
Metrics at the step number during the fine-tuning job.
full\_valid\_loss: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_loss>)
full\_valid\_mean\_token\_accuracy: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) full_valid_mean_token_accuracy>)
step: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) step>)
train\_loss: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_loss>)
train\_mean\_token\_accuracy: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) train_mean_token_accuracy>)
valid\_loss: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_loss>)
valid\_mean\_token\_accuracy: Float
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics > (property) valid_mean_token_accuracy>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) metrics>)
object: :"fine\_tuning.job.checkpoint"
The object type, which is always “fine\_tuning.job.checkpoint”.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) object>)
step\_number: Integer
The step number that the checkpoint was created at.
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema) > (property) step_number>)
[](<#(resource) fine_tuning.jobs.checkpoints > (model) fine_tuning_job_checkpoint > (schema)>)
#### Fine TuningCheckpoints
#### Fine TuningCheckpointsPermissions
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [List checkpoint permissions](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/retrieve)
Deprecated
fine\_tuning.checkpoints.permissions.retrieve(fine\_tuned\_model\_checkpoint, \*\*kwargs) -\> [PermissionRetrieveResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>) { data, has\_more, object, 2 more }
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [List checkpoint permissions](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/list)
fine\_tuning.checkpoints.permissions.list(fine\_tuned\_model\_checkpoint, \*\*kwargs) -\> ConversationCursorPage\<[PermissionListResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>) { id, created\_at, object, project\_id } \>
GET/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Create checkpoint permissions](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/create)
fine\_tuning.checkpoints.permissions.create(fine\_tuned\_model\_checkpoint, \*\*kwargs) -\> Page\<[PermissionCreateResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>) { id, created\_at, object, project\_id } \>
POST/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions
##### [Delete checkpoint permission](/api/reference/ruby/resources/fine_tuning/subresources/checkpoints/subresources/permissions/methods/delete)
fine\_tuning.checkpoints.permissions.delete(permission\_id, \*\*kwargs) -\> [PermissionDeleteResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>) { id, deleted, object }
DELETE/fine\_tuning/checkpoints/{fine\_tuned\_model\_checkpoint}/permissions/{permission\_id}
##### ModelsExpand Collapse
class PermissionRetrieveResponse { data, has\_more, object, 2 more }
data: Array[Data{ id, created\_at, object, project\_id}]
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) created_at>)
object: :"checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data > (items) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) has_more>)
object: :list
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) object>)
first\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) first_id>)
last\_id: String
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema) > (property) last_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_retrieve_response > (schema)>)
class PermissionListResponse { id, created\_at, object, project\_id }
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) created_at>)
object: :"checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_list_response > (schema)>)
class PermissionCreateResponse { id, created\_at, object, project\_id }
The `checkpoint.permission` object represents a permission for a fine-tuned model checkpoint.
id: String
The permission identifier, which can be referenced in the API endpoints.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the permission was created.
formatunixtime
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) created_at>)
object: :"checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) object>)
project\_id: String
The project identifier that the permission is for.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema) > (property) project_id>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_create_response > (schema)>)
class PermissionDeleteResponse { id, deleted, object }
id: String
The ID of the fine-tuned model checkpoint permission that was deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) id>)
deleted: bool
Whether the fine-tuned model checkpoint permission was successfully deleted.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) deleted>)
object: :"checkpoint.permission"
The object type, which is always “checkpoint.permission”.
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema) > (property) object>)
[](<#(resource) fine_tuning.checkpoints.permissions > (model) permission_delete_response > (schema)>)
#### Fine TuningAlpha
#### Fine TuningAlphaGraders
Manage fine-tuning jobs to tailor a model to your specific training data.
##### [Run grader](/api/reference/ruby/resources/fine_tuning/subresources/alpha/subresources/graders/methods/run)
fine\_tuning.alpha.graders.run(\*\*kwargs) -\> [GraderRunResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema)>) { metadata, model\_grader\_token\_usage\_per\_model, reward, sub\_rewards }
POST/fine\_tuning/alpha/graders/run
##### [Validate grader](/api/reference/ruby/resources/fine_tuning/subresources/alpha/subresources/graders/methods/validate)
fine\_tuning.alpha.graders.validate(\*\*kwargs) -\> [GraderValidateResponse](</api/reference/ruby/resources/fine_tuning#(resource) fine_tuning.alpha.graders > (model) grader_validate_response > (schema)>) { grader }
POST/fine\_tuning/alpha/graders/validate
##### ModelsExpand Collapse
class GraderRunResponse { metadata, model\_grader\_token\_usage\_per\_model, reward, sub\_rewards }
metadata: Metadata{ errors, execution\_time, name, 4 more}
errors: Errors{ formula\_parse\_error, invalid\_variable\_error, model\_grader\_parse\_error, 11 more}
formula\_parse\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) formula_parse_error>)
invalid\_variable\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) invalid_variable_error>)
model\_grader\_parse\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) model_grader_parse_error>)
model\_grader\_refusal\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) model_grader_refusal_error>)
model\_grader\_server\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error>)
model\_grader\_server\_error\_details: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error_details>)
other\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) other_error>)
python\_grader\_runtime\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error>)
python\_grader\_runtime\_error\_details: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error_details>)
python\_grader\_server\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error>)
python\_grader\_server\_error\_type: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error_type>)
sample\_parse\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) sample_parse_error>)
truncated\_observation\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) truncated_observation_error>)
unresponsive\_reward\_error: bool
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors > (property) unresponsive_reward_error>)
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) errors>)
execution\_time: Float
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) execution_time>)
name: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) name>)
sampled\_model\_name: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) sampled_model_name>)
scores: Hash[Symbol, untyped]
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) scores>)
token\_usage: Integer
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) token_usage>)
type: String
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata > (property) type>)
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) metadata>)
model\_grader\_token\_usage\_per\_model: Hash[Symbol, untyped]
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) model_grader_token_usage_per_model>)
reward: Float
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) reward>)
sub\_rewards: Hash[Symbol, untyped]
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema) > (property) sub_rewards>)
[](<#(resource) fine_tuning.alpha.graders > (model) grader_run_response > (schema)>)
class GraderValidateResponse { grader }
grader: [StringCheckGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } | [TextSimilarityGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } | [PythonGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } | 2 more
The grader used for the fine-tuning job.
One of the following:
class StringCheckGrader { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: String
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: :eq | :ne | :like | :ilike
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
:eq
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
:ne
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
:like
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
:ilike
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: String
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: :string\_check
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: :cosine | :fuzzy\_match | :bleu | 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
:cosine
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
:fuzzy\_match
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
:bleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
:gleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
:meteor
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
:rouge\_1
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
:rouge\_2
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
:rouge\_3
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
:rouge\_4
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
:rouge\_5
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
:rouge\_l
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: String
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: String
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: :text\_similarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: String
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: :python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: String
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: Array[Input{ content, role, type}]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: String
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: :score\_model
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Array[Float]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: SamplingParams{ max\_completions\_tokens, reasoning\_effort, seed, 2 more}
The sampling parameters for the model.
max\_completions\_tokens: Integer
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: [ReasoningEffort](</api/reference/ruby/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Integer
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Float
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Float
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class MultiGrader { calculate\_output, graders, name, type }
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: String
A formula to calculate the output based on grader results.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: [StringCheckGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } | [TextSimilarityGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } | [PythonGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag } | 2 more
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: String
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: :eq | :ne | :like | :ilike
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
:eq
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
:ne
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
:like
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
:ilike
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: String
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: :string\_check
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: :cosine | :fuzzy\_match | :bleu | 8 more
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
:cosine
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
:fuzzy\_match
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
:bleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
:gleu
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
:meteor
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
:rouge\_1
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
:rouge\_2
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
:rouge\_3
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
:rouge\_4
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
:rouge\_5
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
:rouge\_l
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: String
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: String
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: :text\_similarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: String
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: :python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: String
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
input: Array[Input{ content, role, type}]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: String
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: :score\_model
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Array[Float]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: SamplingParams{ max\_completions\_tokens, reasoning\_effort, seed, 2 more}
The sampling parameters for the model.
max\_completions\_tokens: Integer
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
reasoning\_effort: [ReasoningEffort](</api/reference/ruby/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Integer
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Float
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Float
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader { input, labels, model, 3 more }
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: Array[Input{ content, role, type}]
content: String | [ResponseInputText](</api/reference/ruby/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText{ text, type} | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = Array[[GraderInputItem](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
String = String
A text input to the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText { text, type }
A text input to the model.
text: String
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: :input\_text
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText { text, type }
A text output from the model.
text: String
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
type: :output\_text
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
class InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: String
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
type: :input\_image
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio{ data, format\_}
data: String
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :mp3 | :wav
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
:mp3
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:wav
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: :user | :assistant | :system | :developer
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
:user
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
:assistant
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
:system
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
:developer
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: :message
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: Array[String]
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: String
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: Array[String]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: :label\_model
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: String
The name of the grader.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: :multi
The object type, which is always `multi`.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.alpha.graders > (model) grader_validate_response > (schema) > (property) grader>)
[](<#(resource) fine_tuning.alpha.graders > (model) grader_validate_response > (schema)>)