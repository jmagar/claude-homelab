List evals | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List evals
EvalListPage evals().list(EvalListParamsparams = EvalListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/evals
List evaluations for a project.
##### ParametersExpand Collapse
EvalListParams params
Optional\<String\> after
Identifier for the last eval from the previous pagination request.
[](<#(resource) evals > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of evals to retrieve.
[](<#(resource) evals > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/evals/methods/list#(resource) evals > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for evals by timestamp. Use `asc` for ascending order or `desc` for descending order.
ASC("asc")
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) evals > (method) list > (params) default > (param) order > (schema)>)
Optional\<[OrderBy](</api/reference/java/resources/evals/methods/list#(resource) evals > (method) list > (params) default > (param) order_by > (schema)>)\> orderBy
Evals can be ordered by creation time or last updated time. Use
`created\_at` for creation time or `updated\_at` for last updated time.
CREATED\_AT("created\_at")
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema) > (member) 0>)
UPDATED\_AT("updated\_at")
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema) > (member) 1>)
[](<#(resource) evals > (method) list > (params) default > (param) order_by > (schema)>)
[](<#(resource) evals > (method) list > (params) default>)
##### ReturnsExpand Collapse
class EvalListResponse:
An Eval object with a data source config and testing criteria.
An Eval represents a task to be done for your LLM integration.
Like:
* Improve the quality of my chatbot
* See how well my chatbot handles customer support
* Check if o4-mini is better at my usecase than gpt-4o
String id
Unique identifier for the evaluation.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the eval was created.
formatunixtime
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) created_at>)
DataSourceConfig dataSourceConfig
Configuration of data sources used in runs of the evaluation.
One of the following:
class EvalCustomDataSourceConfig:
A CustomDataSourceConfig which specifies the schema of your `item` and optionally `sample` namespaces.
The response schema defines the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
Schema schema
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) schema>)
JsonValue; type "custom"constant"custom"constant
The type of data source. Always `custom`.
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema) > (property) type>)
[](<#(resource) evals > (model) eval_custom_data_source_config > (schema)>)
class Logs:
A LogsDataSourceConfig which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
The schema returned by this data source config is used to defined what variables are available in your evals.
`item` and `sample` are both defined when using this data source config.
Schema schema
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) data_source_config > (variant) 1 > (property) schema>)
JsonValue; type "logs"constant"logs"constant
The type of data source. Always `logs`.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) data_source_config > (variant) 1>)
class EvalStoredCompletionsDataSourceConfig:
Deprecated in favor of LogsDataSourceConfig.
Schema schema
The json schema for the run data source items.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) schema>)
JsonValue; type "stored\_completions"constant"stored\_completions"constant
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) type>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema) > (property) metadata>)
[](<#(resource) evals > (model) eval_stored_completions_data_source_config > (schema)>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) data_source_config>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) metadata>)
String name
The name of the evaluation.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) name>)
JsonValue; object\_ "eval"constant"eval"constant
The object type.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) object>)
List\<TestingCriterion\> testingCriteria
A list of testing criteria.
One of the following:
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
class EvalGraderTextSimilarity:
A TextSimilarityGrader object which grades text based on similarity metrics.
double passThreshold
The threshold for the score.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 2>)
class EvalGraderPython:
A PythonGrader object that runs a python script on the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 3>)
class EvalGraderScoreModel:
A ScoreModelGrader object that uses a model to assign a score to the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (model) EvalListResponse > (schema) > (property) testing_criteria>)
[](<#(resource) evals > (model) EvalListResponse > (schema)>)
### List evals
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
import com.openai.models.evals.EvalListPage;
import com.openai.models.evals.EvalListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
EvalListPage page = client.evals().list();
}
}`
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