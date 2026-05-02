Run grader | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Fine Tuning](/api/reference/go/resources/fine_tuning)
[Alpha](/api/reference/go/resources/fine_tuning/subresources/alpha)
[Graders](/api/reference/go/resources/fine_tuning/subresources/alpha/subresources/graders)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Run grader
client.FineTuning.Alpha.Graders.Run(ctx, body) (\*[FineTuningAlphaGraderRunResponse](</api/reference/go/resources/fine_tuning#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema)>), error)
POST/fine\_tuning/alpha/graders/run
Run a grader.
##### ParametersExpand Collapse
body FineTuningAlphaGraderRunParams
Grader param.Field[[FineTuningAlphaGraderRunParamsGraderUnion](</api/reference/go/resources/fine_tuning/subresources/alpha/subresources/graders/methods/run#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) grader > (schema)>)]
The grader used for the fine-tuning job.
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
type MultiGrader struct{…}
A MultiGrader object combines the output of multiple graders to produce a single score.
CalculateOutput string
A formula to calculate the output based on grader results.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
Graders MultiGraderGradersUnion
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
type StringCheckGrader struct{…}
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
Input string
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
Operation StringCheckGraderOperation
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
const StringCheckGraderOperationEq StringCheckGraderOperation = "eq"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
const StringCheckGraderOperationNe StringCheckGraderOperation = "ne"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
const StringCheckGraderOperationLike StringCheckGraderOperation = "like"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
const StringCheckGraderOperationIlike StringCheckGraderOperation = "ilike"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
Reference string
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
Type StringCheck
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
type TextSimilarityGrader struct{…}
A TextSimilarityGrader object which grades text based on similarity metrics.
EvaluationMetric TextSimilarityGraderEvaluationMetric
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
const TextSimilarityGraderEvaluationMetricCosine TextSimilarityGraderEvaluationMetric = "cosine"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
const TextSimilarityGraderEvaluationMetricFuzzyMatch TextSimilarityGraderEvaluationMetric = "fuzzy\_match"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
const TextSimilarityGraderEvaluationMetricBleu TextSimilarityGraderEvaluationMetric = "bleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
const TextSimilarityGraderEvaluationMetricGleu TextSimilarityGraderEvaluationMetric = "gleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
const TextSimilarityGraderEvaluationMetricMeteor TextSimilarityGraderEvaluationMetric = "meteor"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
const TextSimilarityGraderEvaluationMetricRouge1 TextSimilarityGraderEvaluationMetric = "rouge\_1"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
const TextSimilarityGraderEvaluationMetricRouge2 TextSimilarityGraderEvaluationMetric = "rouge\_2"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
const TextSimilarityGraderEvaluationMetricRouge3 TextSimilarityGraderEvaluationMetric = "rouge\_3"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
const TextSimilarityGraderEvaluationMetricRouge4 TextSimilarityGraderEvaluationMetric = "rouge\_4"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
const TextSimilarityGraderEvaluationMetricRouge5 TextSimilarityGraderEvaluationMetric = "rouge\_5"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
const TextSimilarityGraderEvaluationMetricRougeL TextSimilarityGraderEvaluationMetric = "rouge\_l"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
Input string
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
Reference string
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
Type TextSimilarity
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
type PythonGrader struct{…}
A PythonGrader object that runs a python script on the input.
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
Source string
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
Type Python
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
ImageTag stringOptional
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
type ScoreModelGrader struct{…}
A ScoreModelGrader object that uses a model to assign a score to the input.
Input []ScoreModelGraderInput
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
Content ScoreModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type ScoreModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type ScoreModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const ScoreModelGraderInputRoleUser ScoreModelGraderInputRole = "user"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const ScoreModelGraderInputRoleAssistant ScoreModelGraderInputRole = "assistant"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const ScoreModelGraderInputRoleSystem ScoreModelGraderInputRole = "system"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const ScoreModelGraderInputRoleDeveloper ScoreModelGraderInputRole = "developer"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
Model string
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
Type ScoreModel
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
Range []float64Optional
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
SamplingParams ScoreModelGraderSamplingParamsOptional
The sampling parameters for the model.
MaxCompletionsTokens int64Optional
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
Seed int64Optional
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
Temperature float64Optional
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
TopP float64Optional
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
type LabelModelGrader struct{…}
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
Input []LabelModelGraderInput
Content LabelModelGraderInputContentUnion
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type LabelModelGraderInputContentOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
type LabelModelGraderInputContentInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
type GraderInputs []GraderInputUnion
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type GraderInputOutputText struct{…}
A text output from the model.
Text string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
type GraderInputInputImage struct{…}
An image input block used within EvalItem content arrays.
ImageURL string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
Type InputImage
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
Detail stringOptional
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
type ResponseInputAudio struct{…}
An audio input to the model.
InputAudio ResponseInputAudioInputAudio
Data string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
const ResponseInputAudioInputAudioFormatMP3 ResponseInputAudioInputAudioFormat = "mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ResponseInputAudioInputAudioFormatWAV ResponseInputAudioInputAudioFormat = "wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
Role string
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
const LabelModelGraderInputRoleUser LabelModelGraderInputRole = "user"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
const LabelModelGraderInputRoleAssistant LabelModelGraderInputRole = "assistant"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
const LabelModelGraderInputRoleSystem LabelModelGraderInputRole = "system"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
const LabelModelGraderInputRoleDeveloper LabelModelGraderInputRole = "developer"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
Type stringOptional
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
Labels []string
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
Model string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
PassingLabels []string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
Type LabelModel
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
Name string
The name of the grader.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
Type Multi
The object type, which is always `multi`.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema)>)
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) grader>)
ModelSample param.Field[string]
The model sample to be evaluated. This value will be used to populate
the `sample` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
The `output\_json` variable will be populated if the model sample is a
valid JSON string.
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) model_sample>)
Item param.Field[[any](</api/reference/go/resources/fine_tuning/subresources/alpha/subresources/graders/methods/run#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) item > (schema)>)]Optional
The dataset item provided to the grader. This will be used to populate
the `item` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) item>)
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default>)
##### ReturnsExpand Collapse
type FineTuningAlphaGraderRunResponse struct{…}
Metadata FineTuningAlphaGraderRunResponseMetadata
Errors FineTuningAlphaGraderRunResponseMetadataErrors
FormulaParseError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) formula_parse_error>)
InvalidVariableError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) invalid_variable_error>)
ModelGraderParseError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_parse_error>)
ModelGraderRefusalError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_refusal_error>)
ModelGraderServerError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error>)
ModelGraderServerErrorDetails string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error_details>)
OtherError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) other_error>)
PythonGraderRuntimeError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error>)
PythonGraderRuntimeErrorDetails string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error_details>)
PythonGraderServerError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error>)
PythonGraderServerErrorType string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error_type>)
SampleParseError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) sample_parse_error>)
TruncatedObservationError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) truncated_observation_error>)
UnresponsiveRewardError bool
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors > (property) unresponsive_reward_error>)
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) errors>)
ExecutionTime float64
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) execution_time>)
Name string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) name>)
SampledModelName string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) sampled_model_name>)
Scores map[string, any]
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) scores>)
TokenUsage int64
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) token_usage>)
Type string
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata > (property) type>)
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) metadata>)
ModelGraderTokenUsagePerModel map[string, any]
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) model_grader_token_usage_per_model>)
Reward float64
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) reward>)
SubRewards map[string, any]
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema) > (property) sub_rewards>)
[](<#(resource) fine_tuning.alpha.graders > (model) FineTuningAlphaGraderRunResponse > (schema)>)
### Run grader
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
response, err := client.FineTuning.Alpha.Graders.Run(context.TODO(), openai.FineTuningAlphaGraderRunParams{
Grader: openai.FineTuningAlphaGraderRunParamsGraderUnion{
OfStringCheck: &openai.StringCheckGraderParam{
Input: "input",
Name: "name",
Operation: openai.StringCheckGraderOperationEq,
Reference: "reference",
},
},
ModelSample: "model\_sample",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", response.Metadata)
}
`
```
200 example
```
`{
"metadata": {
"errors": {
"formula\_parse\_error": true,
"invalid\_variable\_error": true,
"model\_grader\_parse\_error": true,
"model\_grader\_refusal\_error": true,
"model\_grader\_server\_error": true,
"model\_grader\_server\_error\_details": "model\_grader\_server\_error\_details",
"other\_error": true,
"python\_grader\_runtime\_error": true,
"python\_grader\_runtime\_error\_details": "python\_grader\_runtime\_error\_details",
"python\_grader\_server\_error": true,
"python\_grader\_server\_error\_type": "python\_grader\_server\_error\_type",
"sample\_parse\_error": true,
"truncated\_observation\_error": true,
"unresponsive\_reward\_error": true
},
"execution\_time": 0,
"name": "name",
"sampled\_model\_name": "sampled\_model\_name",
"scores": {
"foo": "bar"
},
"token\_usage": 0,
"type": "type"
},
"model\_grader\_token\_usage\_per\_model": {
"foo": "bar"
},
"reward": 0,
"sub\_rewards": {
"foo": "bar"
}
}`
```
##### Returns Examples
200 example
```
`{
"metadata": {
"errors": {
"formula\_parse\_error": true,
"invalid\_variable\_error": true,
"model\_grader\_parse\_error": true,
"model\_grader\_refusal\_error": true,
"model\_grader\_server\_error": true,
"model\_grader\_server\_error\_details": "model\_grader\_server\_error\_details",
"other\_error": true,
"python\_grader\_runtime\_error": true,
"python\_grader\_runtime\_error\_details": "python\_grader\_runtime\_error\_details",
"python\_grader\_server\_error": true,
"python\_grader\_server\_error\_type": "python\_grader\_server\_error\_type",
"sample\_parse\_error": true,
"truncated\_observation\_error": true,
"unresponsive\_reward\_error": true
},
"execution\_time": 0,
"name": "name",
"sampled\_model\_name": "sampled\_model\_name",
"scores": {
"foo": "bar"
},
"token\_usage": 0,
"type": "type"
},
"model\_grader\_token\_usage\_per\_model": {
"foo": "bar"
},
"reward": 0,
"sub\_rewards": {
"foo": "bar"
}
}`
```