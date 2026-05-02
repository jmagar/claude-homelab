Run grader | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Fine Tuning](/api/reference/java/resources/fine_tuning)
[Alpha](/api/reference/java/resources/fine_tuning/subresources/alpha)
[Graders](/api/reference/java/resources/fine_tuning/subresources/alpha/subresources/graders)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Run grader
[GraderRunResponse](</api/reference/java/resources/fine_tuning#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema)>) fineTuning().alpha().graders().run(GraderRunParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/fine\_tuning/alpha/graders/run
Run a grader.
##### ParametersExpand Collapse
GraderRunParams params
Grader grader
The grader used for the fine-tuning job.
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
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) body > (schema) > (property) grader>)
String modelSample
The model sample to be evaluated. This value will be used to populate
the `sample` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
The `output\_json` variable will be populated if the model sample is a
valid JSON string.
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) body > (schema) > (property) model_sample>)
Optional\<JsonValue\> item
The dataset item provided to the grader. This will be used to populate
the `item` namespace. See [the guide](https://platform.openai.com/docs/guides/graders) for more details.
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default > (param) body > (schema) > (property) item>)
[](<#(resource) fine_tuning.alpha.graders > (method) run > (params) default>)
##### ReturnsExpand Collapse
class GraderRunResponse:
Metadata metadata
Errors errors
boolean formulaParseError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) formula_parse_error>)
boolean invalidVariableError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) invalid_variable_error>)
boolean modelGraderParseError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_parse_error>)
boolean modelGraderRefusalError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_refusal_error>)
boolean modelGraderServerError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error>)
Optional\<String\> modelGraderServerErrorDetails
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) model_grader_server_error_details>)
boolean otherError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) other_error>)
boolean pythonGraderRuntimeError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error>)
Optional\<String\> pythonGraderRuntimeErrorDetails
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_runtime_error_details>)
boolean pythonGraderServerError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error>)
Optional\<String\> pythonGraderServerErrorType
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) python_grader_server_error_type>)
boolean sampleParseError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) sample_parse_error>)
boolean truncatedObservationError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) truncated_observation_error>)
boolean unresponsiveRewardError
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors > (property) unresponsive_reward_error>)
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) errors>)
double executionTime
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) execution_time>)
String name
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) name>)
Optional\<String\> sampledModelName
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) sampled_model_name>)
Scores scores
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) scores>)
Optional\<Long\> tokenUsage
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) token_usage>)
String type
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata > (property) type>)
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) metadata>)
ModelGraderTokenUsagePerModel modelGraderTokenUsagePerModel
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) model_grader_token_usage_per_model>)
double reward
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) reward>)
SubRewards subRewards
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema) > (property) sub_rewards>)
[](<#(resource) fine_tuning.alpha.graders > (model) GraderRunResponse > (schema)>)
### Run grader
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
import com.openai.models.finetuning.alpha.graders.GraderRunParams;
import com.openai.models.finetuning.alpha.graders.GraderRunResponse;
import com.openai.models.graders.gradermodels.StringCheckGrader;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GraderRunParams params = GraderRunParams.builder()
.grader(StringCheckGrader.builder()
.input("input")
.name("name")
.operation(StringCheckGrader.Operation.EQ)
.reference("reference")
.build())
.modelSample("model\_sample")
.build();
GraderRunResponse response = client.fineTuning().alpha().graders().run(params);
}
}`
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