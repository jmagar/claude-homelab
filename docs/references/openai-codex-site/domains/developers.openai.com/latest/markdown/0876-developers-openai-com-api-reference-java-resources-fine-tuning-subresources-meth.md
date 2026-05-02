Methods | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Methods
##### ModelsExpand Collapse
class DpoHyperparameters:
The hyperparameters used for the DPO fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) batch_size>)
Optional\<Beta\> beta
The beta value for the DPO method. A higher beta value will increase the weight of the penalty between the policy and reference model.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) beta>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)
class DpoMethod:
Configuration for the DPO fine-tuning method.
Optional\<[DpoHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) dpo_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the DPO fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) dpo_method > (schema)>)
class ReinforcementHyperparameters:
The hyperparameters used for the reinforcement fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) batch_size>)
Optional\<ComputeMultiplier\> computeMultiplier
Multiplier on amount of compute used for exploring search space during training.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) compute_multiplier>)
Optional\<EvalInterval\> evalInterval
The number of training steps between evaluation runs.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_interval>)
Optional\<EvalSamples\> evalSamples
Number of evaluation samples to generate per training step.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) eval_samples>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) n_epochs>)
Optional\<ReasoningEffort\> reasoningEffort
Level of reasoning effort.
One of the following:
DEFAULT("default")
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 0>)
LOW("low")
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 1>)
MEDIUM("medium")
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 2>)
HIGH("high")
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort > (member) 3>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema) > (property) reasoning_effort>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)
class ReinforcementMethod:
Configuration for the reinforcement fine-tuning method.
Grader grader
The grader used for the fine-tuning job.
One of the following:
class StringCheckGrader:
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
String input
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation operation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
EQ("eq")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
NE("ne")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
LIKE("like")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
ILIKE("ilike")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
String reference
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
JsonValue; type "string\_check"constant"string\_check"constant
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader:
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric evaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
COSINE("cosine")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
FUZZY\_MATCH("fuzzy\_match")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
BLEU("bleu")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
GLEU("gleu")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
METEOR("meteor")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
ROUGE\_1("rouge\_1")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
ROUGE\_2("rouge\_2")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
ROUGE\_3("rouge\_3")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
ROUGE\_4("rouge\_4")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
ROUGE\_5("rouge\_5")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
ROUGE\_L("rouge\_l")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
String input
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
String reference
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
JsonValue; type "text\_similarity"constant"text\_similarity"constant
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader:
A PythonGrader object that runs a python script on the input.
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
String source
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
JsonValue; type "python"constant"python"constant
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
Optional\<String\> imageTag
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader:
A ScoreModelGrader object that uses a model to assign a score to the input.
List\<Input\> input
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
String model
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
JsonValue; type "score\_model"constant"score\_model"constant
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Optional\<List\<Double\>\> range
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
Optional\<SamplingParams\> samplingParams
The sampling parameters for the model.
Optional\<Long\> maxCompletionsTokens
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class MultiGrader:
A MultiGrader object combines the output of multiple graders to produce a single score.
String calculateOutput
A formula to calculate the output based on grader results.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
Graders graders
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader:
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
String input
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation operation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
EQ("eq")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
NE("ne")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
LIKE("like")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
ILIKE("ilike")
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
String reference
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
JsonValue; type "string\_check"constant"string\_check"constant
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader:
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric evaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
COSINE("cosine")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
FUZZY\_MATCH("fuzzy\_match")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
BLEU("bleu")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
GLEU("gleu")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
METEOR("meteor")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
ROUGE\_1("rouge\_1")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
ROUGE\_2("rouge\_2")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
ROUGE\_3("rouge\_3")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
ROUGE\_4("rouge\_4")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
ROUGE\_5("rouge\_5")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
ROUGE\_L("rouge\_l")
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
String input
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
String reference
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
JsonValue; type "text\_similarity"constant"text\_similarity"constant
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader:
A PythonGrader object that runs a python script on the input.
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
String source
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
JsonValue; type "python"constant"python"constant
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
Optional\<String\> imageTag
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader:
A ScoreModelGrader object that uses a model to assign a score to the input.
List\<Input\> input
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
String model
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
JsonValue; type "score\_model"constant"score\_model"constant
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Optional\<List\<Double\>\> range
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
Optional\<SamplingParams\> samplingParams
The sampling parameters for the model.
Optional\<Long\> maxCompletionsTokens
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader:
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
List\<Input\> input
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class OutputText:
A text output from the model.
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List\<[EvalContentItem](</api/reference/java/resources/graders#(resource) graders.grader_models > (model) eval_content_item > (schema)>)\>
One of the following:
String
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 0>)
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText
String text
The text output from the model.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 2>)
InputImage
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) eval_content_item > (schema) > (variant) 3>)
class ResponseInputAudio:
An audio input to the model.
InputAudio inputAudio
String data
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
MP3("mp3")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
WAV("wav")
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
List\<String\> labels
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
String model
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
List\<String\> passingLabels
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
JsonValue; type "label\_model"constant"label\_model"constant
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
String name
The name of the grader.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
JsonValue; type "multi"constant"multi"constant
The object type, which is always `multi`.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) grader>)
Optional\<[ReinforcementHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) reinforcement_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the reinforcement fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) reinforcement_method > (schema)>)
class SupervisedHyperparameters:
The hyperparameters used for the fine-tuning job.
Optional\<BatchSize\> batchSize
Number of examples in each batch. A larger batch size means that model parameters are updated less frequently, but with lower variance.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) batch_size>)
Optional\<LearningRateMultiplier\> learningRateMultiplier
Scaling factor for the learning rate. A smaller learning rate may be useful to avoid overfitting.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 0>)
double
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) learning_rate_multiplier>)
Optional\<NEpochs\> nEpochs
The number of epochs to train the model for. An epoch refers to one full cycle through the training dataset.
One of the following:
JsonValue;
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 0>)
long
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs > (variant) 1>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema) > (property) n_epochs>)
[](<#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)
class SupervisedMethod:
Configuration for the supervised fine-tuning method.
Optional\<[SupervisedHyperparameters](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.methods > (model) supervised_hyperparameters > (schema)>)\> hyperparameters
The hyperparameters used for the fine-tuning job.
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema) > (property) hyperparameters>)
[](<#(resource) fine_tuning.methods > (model) supervised_method > (schema)>)