Graders | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Graders
#### GradersGrader Models
##### ModelsExpand Collapse
List[GraderInputItem]
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
class LabelModelGrader: …
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: List[Input]
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: List[str]
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: str
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: List[str]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: Literal["label\_model"]
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
class MultiGrader: …
A MultiGrader object combines the output of multiple graders to produce a single score.
calculate\_output: str
A formula to calculate the output based on grader results.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) calculate_output>)
graders: Graders
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
One of the following:
class StringCheckGrader: …
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: str
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: Literal["eq", "ne", "like", "ilike"]
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: str
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: Literal["string\_check"]
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader: …
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: Literal["cosine", "fuzzy\_match", "bleu", 8 more]
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: str
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: str
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: Literal["text\_similarity"]
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)
class PythonGrader: …
A PythonGrader object that runs a python script on the input.
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: str
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: Literal["python"]
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: Optional[str]
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader: …
A ScoreModelGrader object that uses a model to assign a score to the input.
input: List[Input]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: str
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: Literal["score\_model"]
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Optional[List[float]]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: Optional[SamplingParams]
The sampling parameters for the model.
max\_completions\_tokens: Optional[int]
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Optional[int]
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Optional[float]
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Optional[float]
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class LabelModelGrader: …
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: List[Input]
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: List[str]
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: str
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: List[str]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: Literal["label\_model"]
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) graders>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) name>)
type: Literal["multi"]
The object type, which is always `multi`.
[](<#(resource) graders.grader_models > (model) multi_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) multi_grader > (schema)>)
class PythonGrader: …
A PythonGrader object that runs a python script on the input.
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) name>)
source: str
The source code of the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) source>)
type: Literal["python"]
The object type, which is always `python`.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) type>)
image\_tag: Optional[str]
The image tag to use for the python script.
[](<#(resource) graders.grader_models > (model) python_grader > (schema) > (property) image_tag>)
[](<#(resource) graders.grader_models > (model) python_grader > (schema)>)
class ScoreModelGrader: …
A ScoreModelGrader object that uses a model to assign a score to the input.
input: List[Input]
The input messages evaluated by the grader. Supports text, output text, input image, and input audio content blocks, and may include template strings.
content: InputContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class InputContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
class InputContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
List[GraderInputItem]
One of the following:
str
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class GraderInputItemOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
class GraderInputItemInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
class ResponseInputAudio: …
An audio input to the model.
input\_audio: InputAudio
data: str
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: Literal["mp3", "wav"]
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: Literal["input\_audio"]
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 5>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 1>)
"system"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 2>)
"developer"
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role > (member) 3>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) input>)
model: str
The model to use for the evaluation.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) model>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) name>)
type: Literal["score\_model"]
The object type, which is always `score\_model`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) type>)
range: Optional[List[float]]
The range of the score. Defaults to `[0, 1]`.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) range>)
sampling\_params: Optional[SamplingParams]
The sampling parameters for the model.
max\_completions\_tokens: Optional[int]
The maximum number of tokens the grader model may generate in its response.
minimum1
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) max_completions_tokens>)
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
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) reasoning_effort>)
seed: Optional[int]
A seed value to initialize the randomness, during sampling.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) seed>)
temperature: Optional[float]
A higher temperature increases randomness in the outputs.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) temperature>)
top\_p: Optional[float]
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema) > (property) sampling_params>)
[](<#(resource) graders.grader_models > (model) score_model_grader > (schema)>)
class StringCheckGrader: …
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: str
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: Literal["eq", "ne", "like", "ilike"]
The string check operation to perform. One of `eq`, `ne`, `like`, or `ilike`.
One of the following:
"eq"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 0>)
"ne"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 1>)
"like"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 2>)
"ilike"
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation > (member) 3>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) operation>)
reference: str
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: Literal["string\_check"]
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
class TextSimilarityGrader: …
A TextSimilarityGrader object which grades text based on similarity metrics.
evaluation\_metric: Literal["cosine", "fuzzy\_match", "bleu", 8 more]
The evaluation metric to use. One of `cosine`, `fuzzy\_match`, `bleu`,
`gleu`, `meteor`, `rouge\_1`, `rouge\_2`, `rouge\_3`, `rouge\_4`, `rouge\_5`,
or `rouge\_l`.
One of the following:
"cosine"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 0>)
"fuzzy\_match"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 1>)
"bleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 2>)
"gleu"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 3>)
"meteor"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 4>)
"rouge\_1"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 5>)
"rouge\_2"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 6>)
"rouge\_3"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 7>)
"rouge\_4"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 8>)
"rouge\_5"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 9>)
"rouge\_l"
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric > (member) 10>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) evaluation_metric>)
input: str
The text being graded.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) input>)
name: str
The name of the grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) name>)
reference: str
The text being graded against.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) reference>)
type: Literal["text\_similarity"]
The type of grader.
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>)