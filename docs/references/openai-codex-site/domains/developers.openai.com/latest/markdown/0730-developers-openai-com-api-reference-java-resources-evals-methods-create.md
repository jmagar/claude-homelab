Create eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create eval
[EvalCreateResponse](</api/reference/java/resources/evals#(resource) evals > (model) EvalCreateResponse > (schema)>) evals().create(EvalCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/evals
Create the structure of an evaluation that can be used to test a model’s performance.
An evaluation is a set of testing criteria and the config for a data source, which dictates the schema of the data used in the evaluation. After creating an evaluation, you can run it on different models and model parameters. We support several types of graders and datasources.
For more information, see the [Evals guide](https://platform.openai.com/docs/guides/evals).
##### ParametersExpand Collapse
EvalCreateParams params
DataSourceConfig dataSourceConfig
The configuration for the data source used for the evaluation runs. Dictates the schema of the data used in the evaluation.
class Custom:
A CustomDataSourceConfig object that defines the schema for the data source used for the evaluation runs.
This schema is used to define the shape of the data that will be:
* Used to define your testing criteria and
* What data is required when creating a run
ItemSchema itemSchema
The json schema for each row in the data source.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 0 > (property) item_schema>)
JsonValue; type "custom"constant"custom"constant
The type of data source. Always `custom`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 0 > (property) type>)
Optional\<Boolean\> includeSampleSchema
Whether the eval should expect you to populate the sample namespace (ie, by generating responses off of your data source)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 0 > (property) include_sample_schema>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 0>)
class Logs:
A data source config which specifies the metadata property of your logs query.
This is usually metadata like `usecase=chatbot` or `prompt-version=v2`, etc.
JsonValue; type "logs"constant"logs"constant
The type of data source. Always `logs`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
Optional\<Metadata\> metadata
Metadata filters for the logs data source.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 1>)
class StoredCompletions:
Deprecated in favor of LogsDataSourceConfig.
JsonValue; type "stored\_completions"constant"stored\_completions"constant
The type of data source. Always `stored\_completions`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 2 > (property) type>)
Optional\<Metadata\> metadata
Metadata filters for the stored completions data source.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 2 > (property) metadata>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config > (variant) 2>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) data_source_config>)
List\<TestingCriterion\> testingCriteria
A list of graders for all eval runs in this group. Graders can reference variables in the data source using double curly braces notation, like `{{item.variable\_name}}`. To reference the model’s output, use the `sample` namespace (ie, `{{sample.output\_text}}`).
class LabelModel:
A LabelModelGrader object which uses a model to assign labels to each item
in the evaluation.
List\<Input\> input
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class SimpleInputMessage:
String content
The content of the message.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 0 > (property) content>)
String role
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 0>)
class EvalItem:
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
Content content
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
String
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input > (items) > (variant) 1>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) input>)
List\<String\> labels
The labels to classify to each item in the evaluation.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) labels>)
String model
The model to use for the evaluation. Must support structured outputs.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) model>)
String name
The name of the grader.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) name>)
List\<String\> passingLabels
The labels that indicate a passing result. Must be a subset of labels.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) passing_labels>)
JsonValue; type "label\_model"constant"label\_model"constant
The object type, which is always `label\_model`.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0 > (property) type>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 0>)
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
class TextSimilarity:
A TextSimilarityGrader object which grades text based on similarity metrics.
double passThreshold
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 2>)
class Python:
A PythonGrader object that runs a python script on the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 3>)
class ScoreModel:
A ScoreModelGrader object that uses a model to assign a score to the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) testing_criteria>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) metadata>)
Optional\<String\> name
The name of the evaluation.
[](<#(resource) evals > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) evals > (method) create > (params) default>)
##### ReturnsExpand Collapse
class EvalCreateResponse:
An Eval object with a data source config and testing criteria.
An Eval represents a task to be done for your LLM integration.
Like:
* Improve the quality of my chatbot
* See how well my chatbot handles customer support
* Check if o4-mini is better at my usecase than gpt-4o
String id
Unique identifier for the evaluation.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the eval was created.
formatunixtime
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) created_at>)
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
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) data_source_config > (variant) 1 > (property) schema>)
JsonValue; type "logs"constant"logs"constant
The type of data source. Always `logs`.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) data_source_config > (variant) 1 > (property) type>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) data_source_config > (variant) 1 > (property) metadata>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) data_source_config > (variant) 1>)
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
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) data_source_config>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) metadata>)
String name
The name of the evaluation.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) name>)
JsonValue; object\_ "eval"constant"eval"constant
The object type.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) object>)
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
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 2 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 2>)
class EvalGraderPython:
A PythonGrader object that runs a python script on the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 3 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 3>)
class EvalGraderScoreModel:
A ScoreModelGrader object that uses a model to assign a score to the input.
Optional\<Double\> passThreshold
The threshold for the score.
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 4 > (entry) 1 > (property) pass_threshold>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria > (items) > (variant) 4>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema) > (property) testing_criteria>)
[](<#(resource) evals > (model) EvalCreateResponse > (schema)>)
### Create eval
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
import com.openai.core.JsonValue;
import com.openai.models.evals.EvalCreateParams;
import com.openai.models.evals.EvalCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
EvalCreateParams params = EvalCreateParams.builder()
.customDataSourceConfig(EvalCreateParams.DataSourceConfig.Custom.ItemSchema.builder()
.putAdditionalProperty("foo", JsonValue.from("bar"))
.build())
.addTestingCriterion(EvalCreateParams.TestingCriterion.LabelModel.builder()
.addInput(EvalCreateParams.TestingCriterion.LabelModel.Input.SimpleInputMessage.builder()
.content("content")
.role("role")
.build())
.addLabel("string")
.model("model")
.name("name")
.addPassingLabel("string")
.build())
.build();
EvalCreateResponse eval = client.evals().create(params);
}
}`
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