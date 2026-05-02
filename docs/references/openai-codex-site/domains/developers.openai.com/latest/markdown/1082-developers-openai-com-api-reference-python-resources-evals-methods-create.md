Create eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Evals](/api/reference/python/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create eval
evals.create(EvalCreateParams\*\*kwargs) -\> [EvalCreateResponse](</api/reference/python/resources/evals#(resource) evals > (model) eval_create_response > (schema)>)
POST/evals
Create the structure of an evaluation that can be used to test a model’s performance.
An evaluation is a set of testing criteria and the config for a data source, which dictates the schema of the data used in the evaluation. After creating an evaluation, you can run it on different models and model parameters. We support several types of graders and datasources.
For more information, see the [Evals guide](https://platform.openai.com/docs/guides/evals).
##### ParametersExpand Collapse
data\_source\_config: [DataSourceConfig](</api/reference/python/resources/evals/methods/create#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema)>)
The configuration for the data source used for the evaluation runs. Dictates the schema of the data used in the evaluation.
One of the following:
class DataSourceConfigCustom: …
A CustomDataSourceConfig object that defines the schema for the data source used for the evaluation runs.
This schema is used to define the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
item\_schema: Dict[str, object]
The json schema for each row in the data source.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 0 > (property) item_schema>)
type: Literal["custom"]
The type of data source. Always `custom`.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 0 > (property) type>)
include\_sample\_schema: Optional[bool]
Whether the eval should expect you to populate the sample namespace (ie, by generating responses off of your data source)
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 0 > (property) include_sample_schema>)
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 0>)
class DataSourceConfigLogs: …
A data source config which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
type: Literal["logs"]
The type of data source. Always `logs`.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 1 > (property) type>)
metadata: Optional[Dict[str, object]]
Metadata filters for the logs data source.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 1>)
class DataSourceConfigStoredCompletions: …
Deprecated in favor of LogsDataSourceConfig.
type: Literal["stored\_completions"]
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 2 > (property) type>)
metadata: Optional[Dict[str, object]]
Metadata filters for the stored completions data source.
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 2 > (property) metadata>)
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema) > (variant) 2>)
[](<#(resource) evals > (method) create > (params) default > (param) data_source_config > (schema)>)
testing\_criteria: Iterable[TestingCriterion]
A list of graders for all eval runs in this group. Graders can reference variables in the data source using double curly braces notation, like `{{item.variable\_name}}`. To reference the model’s output, use the `sample` namespace (ie, `{{sample.output\_text}}`).
One of the following:
class TestingCriterionLabelModel: …
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: Iterable[TestingCriterionLabelModelInput]
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class TestingCriterionLabelModelInputSimpleInputMessage: …
content: str
The content of the message.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 0 > (property) content>)
role: str
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 0>)
class TestingCriterionLabelModelInputEvalItem: …
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: TestingCriterionLabelModelInputEvalItemContent
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
str
A text input to the model.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 0>)
class ResponseInputText: …
A text input to the model.
text: str
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: Literal["input\_text"]
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class TestingCriterionLabelModelInputEvalItemContentOutputText: …
A text output from the model.
text: str
The text output from the model.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: Literal["output\_text"]
The type of the output text. Always `output\_text`.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2>)
class TestingCriterionLabelModelInputEvalItemContentInputImage: …
An image input block used within EvalItem content arrays.
image\_url: str
The URL of the image input.
formaturi
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: Literal["input\_image"]
The type of the image input. Always `input\_image`.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: Optional[str]
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3>)
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
Sequence[GraderInputsParamItem]
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
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content>)
role: Literal["user", "assistant", "system", "developer"]
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role>)
type: Optional[Literal["message"]]
The type of the message input. Always `message`.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input > (items) > (variant) 1>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) input>)
labels: Sequence[str]
The labels to classify to each item in the evaluation.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) labels>)
model: str
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) model>)
name: str
The name of the grader.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) name>)
passing\_labels: Sequence[str]
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) passing_labels>)
type: Literal["label\_model"]
The object type, which is always `label\_model`.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 0>)
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
class TestingCriterionTextSimilarity: …
A TextSimilarityGrader object which grades text based on similarity metrics.
pass\_threshold: float
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 2>)
class TestingCriterionPython: …
A PythonGrader object that runs a python script on the input.
pass\_threshold: Optional[float]
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 3>)
class TestingCriterionScoreModel: …
A ScoreModelGrader object that uses a model to assign a score to the input.
pass\_threshold: Optional[float]
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema) > (items) > (variant) 4>)
[](<#(resource) evals > (method) create > (params) default > (param) testing_criteria > (schema)>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (method) create > (params) default > (param) metadata > (schema)>)
name: Optional[str]
The name of the evaluation.
[](<#(resource) evals > (method) create > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class EvalCreateResponse: …
An Eval object with a data source config and testing criteria.
An Eval represents a task to be done for your LLM integration.
Like:
* Improve the quality of my chatbot
* See how well my chatbot handles customer support
* Check if o4-mini is better at my usecase than gpt-4o
id: str
Unique identifier for the evaluation.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the eval was created.
formatunixtime
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) created_at>)
data\_source\_config: DataSourceConfig
Configuration of data sources used in runs of the evaluation.
One of the following:
class EvalCustomDataSourceConfig: …
A CustomDataSourceConfig which specifies the schema of your `item` and optionally `sample` namespaces.
The response schema defines the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
schema: Dict[str, object]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) schema>)
type: Literal["custom"]
The type of data source. Always `custom`.
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) type>)
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema)>)
class DataSourceConfigLogs: …
A LogsDataSourceConfig which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
The schema returned by this data source config is used to defined what variables are available in your evals.
`item` and `sample` are both defined when using this data source config.
schema: Dict[str, object]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) data_source_config > (variant) 1 > (property) schema>)
type: Literal["logs"]
The type of data source. Always `logs`.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) data_source_config > (variant) 1>)
class EvalStoredCompletionsDataSourceConfig: …
Deprecated in favor of LogsDataSourceConfig.
schema: Dict[str, object]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) schema>)
type: Literal["stored\_completions"]
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) type>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) metadata>)
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) data_source_config>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) metadata>)
name: str
The name of the evaluation.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) name>)
object: Literal["eval"]
The object type.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) object>)
testing\_criteria: List[TestingCriterion]
A list of testing criteria.
One of the following:
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
class TestingCriterionEvalGraderTextSimilarity: …
A TextSimilarityGrader object which grades text based on similarity metrics.
pass\_threshold: float
The threshold for the score.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 2>)
class TestingCriterionEvalGraderPython: …
A PythonGrader object that runs a python script on the input.
pass\_threshold: Optional[float]
The threshold for the score.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 3>)
class TestingCriterionEvalGraderScoreModel: …
A ScoreModelGrader object that uses a model to assign a score to the input.
pass\_threshold: Optional[float]
The threshold for the score.
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (model) eval_create_response > (schema) > (property) testing_criteria>)
[](<#(resource) evals > (model) eval_create_response > (schema)>)
### Create eval
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
eval\_obj = client.evals.create(
name="Sentiment",
data\_source\_config={
"type": "stored\_completions",
"metadata": {"usecase": "chatbot"}
},
testing\_criteria=[
{
"type": "label\_model",
"model": "o3-mini",
"input": [
{"role": "developer", "content": "Classify the sentiment of the following statement as one of 'positive', 'neutral', or 'negative'"},
{"role": "user", "content": "Statement: {{item.input}}"}
],
"passing\_labels": ["positive"],
"labels": ["positive", "neutral", "negative"],
"name": "Example label grader"
}
]
)
print(eval\_obj)
`
```
```
`{
"object": "eval",
"id": "eval\_67b7fa9a81a88190ab4aa417e397ea21",
"data\_source\_config": {
"type": "stored\_completions",
"metadata": {
"usecase": "chatbot"
},
"schema": {
"type": "object",
"properties": {
"item": {
"type": "object"
},
"sample": {
"type": "object"
}
},
"required": [
"item",
"sample"
]
},
"testing\_criteria": [
{
"name": "Example label grader",
"type": "label\_model",
"model": "o3-mini",
"input": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "Classify the sentiment of the following statement as one of positive, neutral, or negative"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Statement: {{item.input}}"
}
}
],
"passing\_labels": [
"positive"
],
"labels": [
"positive",
"neutral",
"negative"
]
}
],
"name": "Sentiment",
"created\_at": 1740110490,
"metadata": {
"description": "An eval for sentiment analysis"
}
}
`
```
##### Returns Examples
```
`{
"object": "eval",
"id": "eval\_67b7fa9a81a88190ab4aa417e397ea21",
"data\_source\_config": {
"type": "stored\_completions",
"metadata": {
"usecase": "chatbot"
},
"schema": {
"type": "object",
"properties": {
"item": {
"type": "object"
},
"sample": {
"type": "object"
}
},
"required": [
"item",
"sample"
]
},
"testing\_criteria": [
{
"name": "Example label grader",
"type": "label\_model",
"model": "o3-mini",
"input": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "Classify the sentiment of the following statement as one of positive, neutral, or negative"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "Statement: {{item.input}}"
}
}
],
"passing\_labels": [
"positive"
],
"labels": [
"positive",
"neutral",
"negative"
]
}
],
"name": "Sentiment",
"created\_at": 1740110490,
"metadata": {
"description": "An eval for sentiment analysis"
}
}
`
```