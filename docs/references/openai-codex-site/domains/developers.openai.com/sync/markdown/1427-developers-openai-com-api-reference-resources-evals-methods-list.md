List evals | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Evals](/api/reference/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List evals
GET/evals
List evaluations for a project.
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last eval from the previous pagination request.
[](<#(resource) evals > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of evals to retrieve.
[](<#(resource) evals > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for evals by timestamp. Use `asc` for ascending order or `desc` for descending order.
One of the following:
"asc"
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema)>)
order\_by: optional "created\_at" or "updated\_at"
Evals can be ordered by creation time or last updated time. Use
`created\_at` for creation time or `updated\_at` for last updated time.
One of the following:
"created\_at"
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema) > (member) 0>)
"updated\_at"
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema) > (member) 1>)
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, data\_source\_config, 4 more }
An array of eval objects.
id: string
Unique identifier for the evaluation.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the eval was created.
formatunixtime
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) created_at>)
data\_source\_config: [EvalCustomDataSourceConfig](</api/reference/resources/evals#(resource) evals > (model) eval_custom_data_source_config > (schema)>) { schema, type } or object { schema, type, metadata } or [EvalStoredCompletionsDataSourceConfig](</api/reference/resources/evals#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>) { schema, type, metadata }
Configuration of data sources used in runs of the evaluation.
One of the following:
EvalCustomDataSourceConfig object { schema, type }
A CustomDataSourceConfig which specifies the schema of your `item` and optionally `sample` namespaces.
The response schema defines the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
schema: map[unknown]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) schema>)
type: "custom"
The type of data source. Always `custom`.
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) type>)
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema)>)
LogsDataSourceConfig object { schema, type, metadata }
A LogsDataSourceConfig which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
The schema returned by this data source config is used to defined what variables are available in your evals.
`item` and `sample` are both defined when using this data source config.
schema: map[unknown]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) data_source_config > (variant) 1 > (property) schema>)
type: "logs"
The type of data source. Always `logs`.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) data_source_config > (variant) 1>)
EvalStoredCompletionsDataSourceConfig object { schema, type, metadata }
Deprecated in favor of LogsDataSourceConfig.
schema: map[unknown]
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) schema>)
type: "stored\_completions"
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) type>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) metadata>)
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) data_source_config>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) metadata>)
name: string
The name of the evaluation.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) name>)
object: "eval"
The object type.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) object>)
testing\_criteria: array of [LabelModelGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) label_model_grader > (schema)>) { input, labels, model, 3 more } or [StringCheckGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) string_check_grader > (schema)>) { input, name, operation, 2 more } or [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more } or 2 more
A list of testing criteria.
One of the following:
LabelModelGrader object { input, labels, model, 3 more }
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
input: array of object { content, role, type }
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
GraderInputs = array of string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 2 more
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText object { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio object { input\_audio, type }
An audio input to the model.
input\_audio: object { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" or "wav"
The format of the audio data. Currently supported formats are `mp3` and
`wav`.
One of the following:
"mp3"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"wav"
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the input item. Always `input\_audio`.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_audio > (schema)>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema)>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
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
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input > (items) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) input>)
labels: array of string
The labels to assign to each item in the evaluation.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) labels>)
model: string
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) model>)
name: string
The name of the grader.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) name>)
passing\_labels: array of string
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) passing_labels>)
type: "label\_model"
The object type, which is always `label\_model`.
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) label_model_grader > (schema)>)
StringCheckGrader object { input, name, operation, 2 more }
A StringCheckGrader object that performs a string comparison between input and reference using a specified operation.
input: string
The input text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) input>)
name: string
The name of the grader.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) name>)
operation: "eq" or "ne" or "like" or "ilike"
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
reference: string
The reference text. This may include template strings.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) reference>)
type: "string\_check"
The object type, which is always `string\_check`.
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema) > (property) type>)
[](<#(resource) graders.grader_models > (model) string_check_grader > (schema)>)
TextSimilarityGrader = [TextSimilarityGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) text_similarity_grader > (schema)>) { evaluation\_metric, input, name, 2 more }
A TextSimilarityGrader object which grades text based on similarity metrics.
pass\_threshold: number
The threshold for the score.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 2>)
PythonGrader = [PythonGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) python_grader > (schema)>) { name, source, type, image\_tag }
A PythonGrader object that runs a python script on the input.
pass\_threshold: optional number
The threshold for the score.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 3>)
ScoreModelGrader = [ScoreModelGrader](</api/reference/resources/graders#(resource) graders.grader_models > (model) score_model_grader > (schema)>) { input, model, name, 3 more }
A ScoreModelGrader object that uses a model to assign a score to the input.
pass\_threshold: optional number
The threshold for the score.
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (model) eval_list_response > (schema) > (property) testing_criteria>)
[](<#(resource) evals > (method) list > (network schema) > (property) data>)
first\_id: string
The identifier of the first eval in the data array.
[](<#(resource) evals > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
Indicates whether there are more evals available.
[](<#(resource) evals > (method) list > (network schema) > (property) has_more>)
last\_id: string
The identifier of the last eval in the data array.
[](<#(resource) evals > (method) list > (network schema) > (property) last_id>)
object: "list"
The type of this object. It is always set to “list”.
[](<#(resource) evals > (method) list > (network schema) > (property) object>)
### List evals
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
`curl https://api.openai.com/v1/evals?limit=1 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "list",
"data": [
{
"id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"object": "eval",
"data\_source\_config": {
"type": "stored\_completions",
"metadata": {
"usecase": "push\_notifications\_summarizer"
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
}
},
"testing\_criteria": [
{
"name": "Push Notification Summary Grader",
"id": "Push Notification Summary Grader-9b876f24-4762-4be9-aff4-db7a9b31c673",
"type": "label\_model",
"model": "o3-mini",
"input": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "\\nLabel the following push notification summary as either correct or incorrect.\\nThe push notification and the summary will be provided below.\\nA good push notificiation summary is concise and snappy.\\nIf it is good, then label it as correct, if not, then incorrect.\\n"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "\\nPush notifications: {{item.input}}\\nSummary: {{sample.output\_text}}\\n"
}
}
],
"passing\_labels": [
"correct"
],
"labels": [
"correct",
"incorrect"
],
"sampling\_params": null
}
],
"name": "Push Notification Summary Grader",
"created\_at": 1739314509,
"metadata": {
"description": "A stored completions eval for push notification summaries"
}
}
],
"first\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"last\_id": "eval\_67aa884cf6688190b58f657d4441c8b7",
"has\_more": true
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"object": "eval",
"data\_source\_config": {
"type": "stored\_completions",
"metadata": {
"usecase": "push\_notifications\_summarizer"
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
}
},
"testing\_criteria": [
{
"name": "Push Notification Summary Grader",
"id": "Push Notification Summary Grader-9b876f24-4762-4be9-aff4-db7a9b31c673",
"type": "label\_model",
"model": "o3-mini",
"input": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "\\nLabel the following push notification summary as either correct or incorrect.\\nThe push notification and the summary will be provided below.\\nA good push notificiation summary is concise and snappy.\\nIf it is good, then label it as correct, if not, then incorrect.\\n"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "\\nPush notifications: {{item.input}}\\nSummary: {{sample.output\_text}}\\n"
}
}
],
"passing\_labels": [
"correct"
],
"labels": [
"correct",
"incorrect"
],
"sampling\_params": null
}
],
"name": "Push Notification Summary Grader",
"created\_at": 1739314509,
"metadata": {
"description": "A stored completions eval for push notification summaries"
}
}
],
"first\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"last\_id": "eval\_67aa884cf6688190b58f657d4441c8b7",
"has\_more": true
}
`
```