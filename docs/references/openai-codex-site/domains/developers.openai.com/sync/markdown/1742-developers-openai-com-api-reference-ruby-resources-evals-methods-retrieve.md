Get an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Evals](/api/reference/ruby/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get an eval
evals.retrieve(eval\_id) -\> [EvalRetrieveResponse](</api/reference/ruby/resources/evals#(resource) evals > (model) eval_retrieve_response > (schema)>) { id, created\_at, data\_source\_config, 4 more }
GET/evals/{eval\_id}
Get an evaluation by ID.
##### ParametersExpand Collapse
eval\_id: String
[](<#(resource) evals > (method) retrieve > (params) default > (param) eval_id > (schema)>)
##### ReturnsExpand Collapse
class EvalRetrieveResponse { id, created\_at, data\_source\_config, 4 more }
An Eval object with a data source config and testing criteria.
An Eval represents a task to be done for your LLM integration.
Like:
* Improve the quality of my chatbot
* See how well my chatbot handles customer support
* Check if o4-mini is better at my usecase than gpt-4o
id: String
Unique identifier for the evaluation.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the eval was created.
formatunixtime
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) created_at>)
data\_source\_config: [EvalCustomDataSourceConfig](</api/reference/ruby/resources/evals#(resource) evals > (model) eval_custom_data_source_config > (schema)>) { schema, type } | Logs{ schema, type, metadata} | [EvalStoredCompletionsDataSourceConfig](</api/reference/ruby/resources/evals#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>) { schema, type, metadata }
Configuration of data sources used in runs of the evaluation.
One of the following:
class EvalCustomDataSourceConfig { schema, type }
A CustomDataSourceConfig which specifies the schema of your `item` and optionally `sample` namespaces.
The response schema defines the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
schema: Hash[Symbol, untyped]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) schema>)
type: :custom
The type of data source. Always `custom`.
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) type>)
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema)>)
class Logs { schema, type, metadata }
A LogsDataSourceConfig which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
The schema returned by this data source config is used to defined what variables are available in your evals.
`item` and `sample` are both defined when using this data source config.
schema: Hash[Symbol, untyped]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) data_source_config > (variant) 1 > (property) schema>)
type: :logs
The type of data source. Always `logs`.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) data_source_config > (variant) 1>)
class EvalStoredCompletionsDataSourceConfig { schema, type, metadata }
Deprecated in favor of LogsDataSourceConfig.
schema: Hash[Symbol, untyped]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) schema>)
type: :stored\_completions
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) type>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) metadata>)
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) data_source_config>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) metadata>)
name: String
The name of the evaluation.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) name>)
object: :eval
The object type.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) object>)
testing\_criteria: Array[[LabelModelGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) label_model_grader > (schema)>) { input, labels, model, 3 more } | [StringCheckGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } | [TextSimilarityGrader](</api/reference/ruby/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } & { pass\_threshold} | 2 more]
A list of testing criteria.
One of the following:
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
class EvalGraderTextSimilarity { pass\_threshold }
A TextSimilarityGrader object which grades text based on similarity metrics.
pass\_threshold: Float
The threshold for the score.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 2>)
class EvalGraderPython { pass\_threshold }
A PythonGrader object that runs a python script on the input.
pass\_threshold: Float
The threshold for the score.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 3>)
class EvalGraderScoreModel { pass\_threshold }
A ScoreModelGrader object that uses a model to assign a score to the input.
pass\_threshold: Float
The threshold for the score.
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema) > (property) testing_criteria>)
[](<#(resource) evals > (model) eval_retrieve_response > (schema)>)
### Get an eval
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
eval\_ = openai.evals.retrieve("eval\_id")
puts(eval\_)`
```
```
`{
"object": "eval",
"id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"data\_source\_config": {
"type": "custom",
"schema": {
"type": "object",
"properties": {
"item": {
"type": "object",
"properties": {
"input": {
"type": "string"
},
"ground\_truth": {
"type": "string"
}
},
"required": [
"input",
"ground\_truth"
]
}
},
"required": [
"item"
]
}
},
"testing\_criteria": [
{
"name": "String check",
"id": "String check-2eaf2d8d-d649-4335-8148-9535a7ca73c2",
"type": "string\_check",
"input": "{{item.input}}",
"reference": "{{item.ground\_truth}}",
"operation": "eq"
}
],
"name": "External Data Eval",
"created\_at": 1739314509,
"metadata": {},
}
`
```
##### Returns Examples
```
`{
"object": "eval",
"id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"data\_source\_config": {
"type": "custom",
"schema": {
"type": "object",
"properties": {
"item": {
"type": "object",
"properties": {
"input": {
"type": "string"
},
"ground\_truth": {
"type": "string"
}
},
"required": [
"input",
"ground\_truth"
]
}
},
"required": [
"item"
]
}
},
"testing\_criteria": [
{
"name": "String check",
"id": "String check-2eaf2d8d-d649-4335-8148-9535a7ca73c2",
"type": "string\_check",
"input": "{{item.input}}",
"reference": "{{item.ground\_truth}}",
"operation": "eq"
}
],
"name": "External Data Eval",
"created\_at": 1739314509,
"metadata": {},
}
`
```