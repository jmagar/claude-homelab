Create eval run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
[Runs](/api/reference/java/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create eval run
[RunCreateResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunCreateResponse > (schema)>) evals().runs().create(RunCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/evals/{eval\_id}/runs
Kicks off a new run for a given evaluation, specifying the data source, and what model configuration to use to test. The datasource will be validated against the schema specified in the config of the evaluation.
##### ParametersExpand Collapse
RunCreateParams params
Optional\<String\> evalId
[](<#(resource) evals.runs > (method) create > (params) default > (param) eval_id > (schema)>)
DataSource dataSource
Details about the run’s data source.
class CreateEvalJsonlRunDataSource:
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
Source source
Determines what populates the `item` namespace in the data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
JsonValue; type "jsonl"constant"jsonl"constant
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
class CreateEvalCompletionsRunDataSource:
A CompletionsRunDataSource object describing a model sampling configuration.
Source source
Determines what populates the `item` namespace in this run’s data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
class StoredCompletions:
A StoredCompletionsRunDataSource configuration describing a set of filters
JsonValue; type "stored\_completions"constant"stored\_completions"constant
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
Optional\<Long\> createdAfter
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
Optional\<Long\> createdBefore
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
Optional\<Long\> limit
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
Optional\<String\> model
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
Type type
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
Optional\<InputMessages\> inputMessages
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
class Template:
List\<InnerTemplate\> template
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class EasyInputMessage:
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
Content content
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
String
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
List\<[ResponseInputContent](</api/reference/java/resources/responses#(resource) responses > (model) response_input_content > (schema)>)\>
One of the following:
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage:
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail detail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile:
A file input to the model.
JsonValue; type "input\_file"constant"input\_file"constant
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Optional\<Detail\> detail
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
Optional\<String\> fileData
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
Optional\<String\> fileUrl
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Optional\<String\> filename
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
Optional\<Phase\> phase
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
COMMENTARY("commentary")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
FINAL\_ANSWER("final\_answer")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
JsonValue; type "template"constant"template"constant
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
class ItemReference:
String itemReference
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
JsonValue; type "item\_reference"constant"item\_reference"constant
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
Optional\<String\> model
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
Optional\<SamplingParams\> samplingParams
Optional\<Long\> maxCompletionTokens
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<ResponseFormat\> responseFormat
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
Optional\<List\<[ChatCompletionFunctionTool](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)\>\> tools
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
class CreateEvalResponsesRunDataSource:
A ResponsesRunDataSource object describing a model sampling configuration.
Source source
Determines what populates the `item` namespace in this run’s data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
class Responses:
A EvalResponsesSource object describing a run data source configuration.
JsonValue; type "responses"constant"responses"constant
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
Optional\<Long\> createdAfter
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
Optional\<Long\> createdBefore
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
Optional\<String\> instructionsSearch
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
Optional\<JsonValue\> metadata
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
Optional\<String\> model
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
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
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
Optional\<Double\> temperature
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
Optional\<List\<String\>\> tools
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
Optional\<Double\> topP
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
Optional\<List\<String\>\> users
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) source>)
Type type
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) type>)
Optional\<InputMessages\> inputMessages
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
class Template:
List\<InnerTemplate\> template
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class ChatMessage:
String content
The content of the message.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
String role
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
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
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
JsonValue; type "template"constant"template"constant
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
class ItemReference:
String itemReference
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
JsonValue; type "item\_reference"constant"item\_reference"constant
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
Optional\<String\> model
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) model>)
Optional\<SamplingParams\> samplingParams
Optional\<Long\> maxCompletionTokens
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
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
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
Optional\<Text\> text
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
Optional\<[ResponseFormatTextConfig](</api/reference/java/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)\> format
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatTextJsonSchemaConfig:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) name>)
Schema schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) type>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) description>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) strict>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
Optional\<List\<[Tool](</api/reference/java/resources/responses#(resource) responses > (model) tool > (schema)>)\>\> tools
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search). Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](https://platform.openai.com/docs/guides/function-calling).
One of the following:
class FunctionTool:
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
String name
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
Optional\<Parameters\> parameters
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
JsonValue; type "function"constant"function"constant
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
class FileSearchTool:
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
JsonValue; type "file\_search"constant"file\_search"constant
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
List\<String\> vectorStoreIds
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
Optional\<Filters\> filters
A filter to apply.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
class CompoundFilter:
Combine multiple filters using `and` or `or`.
List\<Filter\> filters
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
JsonValue
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type type
Type of operation: `and` or `or`.
One of the following:
AND("and")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
OR("or")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
Optional\<Long\> maxNumResults
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
Ranking options for search.
Optional\<HybridSearch\> hybridSearch
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
double embeddingWeight
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
double textWeight
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
Optional\<Ranker\> ranker
The ranker to use for the file search.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_11\_15("default-2024-11-15")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
Optional\<Double\> scoreThreshold
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
class ComputerTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
JsonValue; type "computer"constant"computer"constant
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
class ComputerUsePreviewTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
long displayHeight
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
long displayWidth
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
Environment environment
The type of computer environment to control.
One of the following:
WINDOWS("windows")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
MAC("mac")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
LINUX("linux")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
UBUNTU("ubuntu")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
BROWSER("browser")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
JsonValue; type "computer\_use\_preview"constant"computer\_use\_preview"constant
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
class WebSearchTool:
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
WEB\_SEARCH("web\_search")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_2025\_08\_26("web\_search\_2025\_08\_26")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
Optional\<Filters\> filters
Filters for the search.
Optional\<List\<String\>\> allowedDomains
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The approximate location of the user.
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
Optional\<Type\> type
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp
String serverLabel
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
JsonValue; type "mcp"constant"mcp"constant
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
Optional\<AllowedTools\> allowedTools
List of allowed tool names or a filter object.
One of the following:
List\<String\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
class McpToolFilter:
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
Optional\<String\> authorization
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
Optional\<ConnectorId\> connectorId
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
CONNECTOR\_DROPBOX("connector\_dropbox")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
CONNECTOR\_GMAIL("connector\_gmail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
CONNECTOR\_GOOGLECALENDAR("connector\_googlecalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
CONNECTOR\_GOOGLEDRIVE("connector\_googledrive")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
CONNECTOR\_MICROSOFTTEAMS("connector\_microsoftteams")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
CONNECTOR\_OUTLOOKCALENDAR("connector\_outlookcalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
CONNECTOR\_OUTLOOKEMAIL("connector\_outlookemail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
CONNECTOR\_SHAREPOINT("connector\_sharepoint")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
Optional\<Boolean\> deferLoading
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
Optional\<Headers\> headers
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
Optional\<RequireApproval\> requireApproval
Specify which of the MCP server’s tools require approval.
One of the following:
class McpToolApprovalFilter:
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
Optional\<Always\> always
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
Optional\<Never\> never
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
enum McpToolApprovalSetting:
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
ALWAYS("always")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
NEVER("never")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
Optional\<String\> serverDescription
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
Optional\<String\> serverUrl
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter
Container container
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
String
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
class CodeInterpreterToolAuto:
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
JsonValue; type "auto"constant"auto"constant
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the code interpreter container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration
JsonValue; type "image\_generation"constant"image\_generation"constant
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
Optional\<Action\> action
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
GENERATE("generate")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
EDIT("edit")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
Optional\<Background\> background
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
Optional\<InputFidelity\> inputFidelity
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
Optional\<InputImageMask\> inputImageMask
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
Optional\<String\> fileId
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
Optional\<String\> imageUrl
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
Optional\<Model\> model
The image generation model to use. Default: `gpt-image-1`.
One of the following:
GPT\_IMAGE\_1("gpt-image-1")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
GPT\_IMAGE\_1\_MINI("gpt-image-1-mini")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
GPT\_IMAGE\_1\_5("gpt-image-1.5")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
Optional\<Moderation\> moderation
Moderation level for the generated image. Default: `auto`.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
Optional\<Long\> outputCompression
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
Optional\<OutputFormat\> outputFormat
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
PNG("png")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
Optional\<Long\> partialImages
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
Optional\<Quality\> quality
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
Optional\<Size\> size
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
JsonValue;
JsonValue; type "local\_shell"constant"local\_shell"constant
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
class FunctionShellTool:
A tool that allows the model to execute shell commands.
JsonValue; type "shell"constant"shell"constant
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
Optional\<Environment\> environment
One of the following:
class ContainerAuto:
JsonValue; type "container\_auto"constant"container\_auto"constant
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
Optional\<List\<Skill\>\> skills
An optional list of skills referenced by id or inline data.
One of the following:
class SkillReference:
String skillId
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
JsonValue; type "skill\_reference"constant"skill\_reference"constant
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Optional\<String\> version
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
class InlineSkill:
String description
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
[InlineSkillSource](</api/reference/java/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) source
Inline skill payload
String data
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
JsonValue; mediaType "application/zip"constant"application/zip"constant
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
JsonValue; type "base64"constant"base64"constant
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
JsonValue; type "inline"constant"inline"constant
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
class LocalEnvironment:
JsonValue; type "local"constant"local"constant
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
Optional\<List\<[LocalSkill](</api/reference/java/resources/responses#(resource) responses > (model) local_skill > (schema)>)\>\> skills
An optional list of skills.
String description
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
String path
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
class ContainerReference:
String containerId
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
JsonValue; type "container\_reference"constant"container\_reference"constant
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
class NamespaceTool:
Groups function/custom tools under a shared namespace.
String description
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
String name
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
List\<Tool\> tools
The function/custom tools available inside this namespace.
One of the following:
class Function:
String name
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
JsonValue; type "function"constant"function"constant
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
Optional\<String\> description
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
Optional\<JsonValue\> parameters
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
Optional\<Boolean\> strict
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
JsonValue; type "namespace"constant"namespace"constant
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
class ToolSearchTool:
Hosted or BYOT tool search configuration for deferred tools.
JsonValue; type "tool\_search"constant"tool\_search"constant
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
Optional\<String\> description
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
Optional\<Execution\> execution
Whether tool search is executed by the server or by the client.
One of the following:
SERVER("server")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
CLIENT("client")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
Optional\<JsonValue\> parameters
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
class WebSearchPreviewTool:
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
WEB\_SEARCH\_PREVIEW("web\_search\_preview")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_PREVIEW\_2025\_03\_11("web\_search\_preview\_2025\_03\_11")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
Optional\<List\<SearchContentType\>\> searchContentTypes
One of the following:
TEXT("text")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The user’s location.
JsonValue; type "approximate"constant"approximate"constant
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
class ApplyPatchTool:
Allows the assistant to create, delete, or update files using unified diffs.
JsonValue; type "apply\_patch"constant"apply\_patch"constant
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) data_source>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) metadata>)
Optional\<String\> name
The name of the run.
[](<#(resource) evals.runs > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) evals.runs > (method) create > (params) default>)
##### ReturnsExpand Collapse
class RunCreateResponse:
A schema representing an evaluation run.
String id
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) created_at>)
DataSource dataSource
Information about the run’s data source.
One of the following:
class CreateEvalJsonlRunDataSource:
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
Source source
Determines what populates the `item` namespace in the data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
JsonValue; type "jsonl"constant"jsonl"constant
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
class CreateEvalCompletionsRunDataSource:
A CompletionsRunDataSource object describing a model sampling configuration.
Source source
Determines what populates the `item` namespace in this run’s data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
class StoredCompletions:
A StoredCompletionsRunDataSource configuration describing a set of filters
JsonValue; type "stored\_completions"constant"stored\_completions"constant
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
Optional\<Long\> createdAfter
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
Optional\<Long\> createdBefore
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
Optional\<Long\> limit
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
Optional\<String\> model
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
Type type
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
Optional\<InputMessages\> inputMessages
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
class Template:
List\<InnerTemplate\> template
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class EasyInputMessage:
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
Content content
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
String
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
List\<[ResponseInputContent](</api/reference/java/resources/responses#(resource) responses > (model) response_input_content > (schema)>)\>
One of the following:
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage:
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail detail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile:
A file input to the model.
JsonValue; type "input\_file"constant"input\_file"constant
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Optional\<Detail\> detail
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
Optional\<String\> fileData
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
Optional\<String\> fileUrl
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Optional\<String\> filename
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
Optional\<Phase\> phase
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
COMMENTARY("commentary")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
FINAL\_ANSWER("final\_answer")
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
JsonValue; type "template"constant"template"constant
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
class ItemReference:
String itemReference
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
JsonValue; type "item\_reference"constant"item\_reference"constant
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
Optional\<String\> model
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
Optional\<SamplingParams\> samplingParams
Optional\<Long\> maxCompletionTokens
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort>)
Optional\<ResponseFormat\> responseFormat
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
Optional\<List\<[ChatCompletionFunctionTool](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)\>\> tools
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
class Responses:
A ResponsesRunDataSource object describing a model sampling configuration.
Source source
Determines what populates the `item` namespace in this run’s data source.
One of the following:
class FileContent:
List\<Content\> content
The content of the jsonl file.
Item item
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
Optional\<Sample\> sample
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
JsonValue; type "file\_content"constant"file\_content"constant
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
class FileId:
String id
The identifier of the file.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
JsonValue; type "file\_id"constant"file\_id"constant
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
class InnerResponses:
A EvalResponsesSource object describing a run data source configuration.
JsonValue; type "responses"constant"responses"constant
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
Optional\<Long\> createdAfter
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
Optional\<Long\> createdBefore
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
Optional\<String\> instructionsSearch
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
Optional\<JsonValue\> metadata
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
Optional\<String\> model
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
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
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
Optional\<Double\> temperature
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
Optional\<List\<String\>\> tools
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
Optional\<Double\> topP
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
Optional\<List\<String\>\> users
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) source>)
JsonValue; type "responses"constant"responses"constant
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) type>)
Optional\<InputMessages\> inputMessages
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
class Template:
List\<InnerTemplate\> template
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
class ChatMessage:
String content
The content of the message.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
String role
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
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
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
class InputImage:
An image input block used within EvalItem content arrays.
String imageUrl
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
Optional\<String\> detail
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 5>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
Role role
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
USER("user")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
SYSTEM("system")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
DEVELOPER("developer")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
Optional\<Type\> type
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
JsonValue; type "template"constant"template"constant
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
class ItemReference:
String itemReference
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
JsonValue; type "item\_reference"constant"item\_reference"constant
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
Optional\<String\> model
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) model>)
Optional\<SamplingParams\> samplingParams
Optional\<Long\> maxCompletionTokens
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
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
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
MINIMAL("minimal")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
LOW("low")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
MEDIUM("medium")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
HIGH("high")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
XHIGH("xhigh")
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
Optional\<Long\> seed
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
Optional\<Double\> temperature
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
Optional\<Text\> text
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
Optional\<[ResponseFormatTextConfig](</api/reference/java/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)\> format
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatTextJsonSchemaConfig:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) name>)
Schema schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) type>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) description>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) strict>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
Optional\<List\<[Tool](</api/reference/java/resources/responses#(resource) responses > (model) tool > (schema)>)\>\> tools
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search). Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](https://platform.openai.com/docs/guides/function-calling).
One of the following:
class FunctionTool:
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
String name
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
Optional\<Parameters\> parameters
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
JsonValue; type "function"constant"function"constant
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
class FileSearchTool:
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
JsonValue; type "file\_search"constant"file\_search"constant
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
List\<String\> vectorStoreIds
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
Optional\<Filters\> filters
A filter to apply.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
class CompoundFilter:
Combine multiple filters using `and` or `or`.
List\<Filter\> filters
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
JsonValue
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type type
Type of operation: `and` or `or`.
One of the following:
AND("and")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
OR("or")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
Optional\<Long\> maxNumResults
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
Ranking options for search.
Optional\<HybridSearch\> hybridSearch
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
double embeddingWeight
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
double textWeight
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
Optional\<Ranker\> ranker
The ranker to use for the file search.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_11\_15("default-2024-11-15")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
Optional\<Double\> scoreThreshold
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
class ComputerTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
JsonValue; type "computer"constant"computer"constant
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
class ComputerUsePreviewTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
long displayHeight
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
long displayWidth
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
Environment environment
The type of computer environment to control.
One of the following:
WINDOWS("windows")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
MAC("mac")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
LINUX("linux")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
UBUNTU("ubuntu")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
BROWSER("browser")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
JsonValue; type "computer\_use\_preview"constant"computer\_use\_preview"constant
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
class WebSearchTool:
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
WEB\_SEARCH("web\_search")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_2025\_08\_26("web\_search\_2025\_08\_26")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
Optional\<Filters\> filters
Filters for the search.
Optional\<List\<String\>\> allowedDomains
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The approximate location of the user.
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
Optional\<Type\> type
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp
String serverLabel
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
JsonValue; type "mcp"constant"mcp"constant
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
Optional\<AllowedTools\> allowedTools
List of allowed tool names or a filter object.
One of the following:
List\<String\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
class McpToolFilter:
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
Optional\<String\> authorization
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
Optional\<ConnectorId\> connectorId
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
CONNECTOR\_DROPBOX("connector\_dropbox")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
CONNECTOR\_GMAIL("connector\_gmail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
CONNECTOR\_GOOGLECALENDAR("connector\_googlecalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
CONNECTOR\_GOOGLEDRIVE("connector\_googledrive")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
CONNECTOR\_MICROSOFTTEAMS("connector\_microsoftteams")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
CONNECTOR\_OUTLOOKCALENDAR("connector\_outlookcalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
CONNECTOR\_OUTLOOKEMAIL("connector\_outlookemail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
CONNECTOR\_SHAREPOINT("connector\_sharepoint")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
Optional\<Boolean\> deferLoading
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
Optional\<Headers\> headers
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
Optional\<RequireApproval\> requireApproval
Specify which of the MCP server’s tools require approval.
One of the following:
class McpToolApprovalFilter:
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
Optional\<Always\> always
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
Optional\<Never\> never
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
enum McpToolApprovalSetting:
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
ALWAYS("always")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
NEVER("never")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
Optional\<String\> serverDescription
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
Optional\<String\> serverUrl
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter
Container container
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
String
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
class CodeInterpreterToolAuto:
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
JsonValue; type "auto"constant"auto"constant
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the code interpreter container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration
JsonValue; type "image\_generation"constant"image\_generation"constant
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
Optional\<Action\> action
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
GENERATE("generate")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
EDIT("edit")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
Optional\<Background\> background
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
Optional\<InputFidelity\> inputFidelity
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
Optional\<InputImageMask\> inputImageMask
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
Optional\<String\> fileId
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
Optional\<String\> imageUrl
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
Optional\<Model\> model
The image generation model to use. Default: `gpt-image-1`.
One of the following:
GPT\_IMAGE\_1("gpt-image-1")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
GPT\_IMAGE\_1\_MINI("gpt-image-1-mini")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
GPT\_IMAGE\_1\_5("gpt-image-1.5")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
Optional\<Moderation\> moderation
Moderation level for the generated image. Default: `auto`.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
Optional\<Long\> outputCompression
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
Optional\<OutputFormat\> outputFormat
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
PNG("png")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
Optional\<Long\> partialImages
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
Optional\<Quality\> quality
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
Optional\<Size\> size
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
JsonValue;
JsonValue; type "local\_shell"constant"local\_shell"constant
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
class FunctionShellTool:
A tool that allows the model to execute shell commands.
JsonValue; type "shell"constant"shell"constant
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
Optional\<Environment\> environment
One of the following:
class ContainerAuto:
JsonValue; type "container\_auto"constant"container\_auto"constant
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
Optional\<List\<Skill\>\> skills
An optional list of skills referenced by id or inline data.
One of the following:
class SkillReference:
String skillId
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
JsonValue; type "skill\_reference"constant"skill\_reference"constant
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Optional\<String\> version
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
class InlineSkill:
String description
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
[InlineSkillSource](</api/reference/java/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) source
Inline skill payload
String data
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
JsonValue; mediaType "application/zip"constant"application/zip"constant
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
JsonValue; type "base64"constant"base64"constant
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
JsonValue; type "inline"constant"inline"constant
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
class LocalEnvironment:
JsonValue; type "local"constant"local"constant
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
Optional\<List\<[LocalSkill](</api/reference/java/resources/responses#(resource) responses > (model) local_skill > (schema)>)\>\> skills
An optional list of skills.
String description
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
String path
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
class ContainerReference:
String containerId
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
JsonValue; type "container\_reference"constant"container\_reference"constant
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
class NamespaceTool:
Groups function/custom tools under a shared namespace.
String description
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
String name
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
List\<Tool\> tools
The function/custom tools available inside this namespace.
One of the following:
class Function:
String name
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
JsonValue; type "function"constant"function"constant
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
Optional\<String\> description
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
Optional\<JsonValue\> parameters
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
Optional\<Boolean\> strict
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
JsonValue; type "namespace"constant"namespace"constant
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
class ToolSearchTool:
Hosted or BYOT tool search configuration for deferred tools.
JsonValue; type "tool\_search"constant"tool\_search"constant
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
Optional\<String\> description
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
Optional\<Execution\> execution
Whether tool search is executed by the server or by the client.
One of the following:
SERVER("server")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
CLIENT("client")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
Optional\<JsonValue\> parameters
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
class WebSearchPreviewTool:
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
WEB\_SEARCH\_PREVIEW("web\_search\_preview")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_PREVIEW\_2025\_03\_11("web\_search\_preview\_2025\_03\_11")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
Optional\<List\<SearchContentType\>\> searchContentTypes
One of the following:
TEXT("text")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The user’s location.
JsonValue; type "approximate"constant"approximate"constant
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
class ApplyPatchTool:
Allows the assistant to create, delete, or update files using unified diffs.
JsonValue; type "apply\_patch"constant"apply\_patch"constant
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
Optional\<Double\> topP
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) data_source>)
[EvalApiError](</api/reference/java/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) error
An object representing an error response from the Eval API.
String code
The error code.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) code>)
String message
The error message.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) message>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) error>)
String evalId
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) eval_id>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) metadata>)
String model
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) model>)
String name
The name of the evaluation run.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) name>)
JsonValue; object\_ "eval.run"constant"eval.run"constant
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) object>)
List\<PerModelUsage\> perModelUsage
Usage statistics for each model during the evaluation run.
long cachedTokens
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) cached_tokens>)
long completionTokens
The number of completion tokens generated.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) completion_tokens>)
long invocationCount
The number of invocations.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) invocation_count>)
String modelName
The name of the model.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) model_name>)
long promptTokens
The number of prompt tokens used.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) prompt_tokens>)
long totalTokens
The total number of tokens used.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage > (items) > (property) total_tokens>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_model_usage>)
List\<PerTestingCriteriaResult\> perTestingCriteriaResults
Results per testing criteria applied during the evaluation run.
long failed
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_testing_criteria_results > (items) > (property) failed>)
long passed
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_testing_criteria_results > (items) > (property) passed>)
String testingCriteria
A description of the testing criteria.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_testing_criteria_results > (items) > (property) testing_criteria>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) per_testing_criteria_results>)
String reportUrl
The URL to the rendered evaluation run report on the UI dashboard.
formaturi
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) report_url>)
ResultCounts resultCounts
Counters summarizing the outcomes of the evaluation run.
long errored
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) result_counts > (property) errored>)
long failed
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) result_counts > (property) failed>)
long passed
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) result_counts > (property) passed>)
long total
Total number of executed output items.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) result_counts > (property) total>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) result_counts>)
String status
The status of the evaluation run.
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema) > (property) status>)
[](<#(resource) evals.runs > (model) RunCreateResponse > (schema)>)
### Create eval run
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
import com.openai.models.evals.runs.CreateEvalJsonlRunDataSource;
import com.openai.models.evals.runs.RunCreateParams;
import com.openai.models.evals.runs.RunCreateResponse;
import java.util.List;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RunCreateParams params = RunCreateParams.builder()
.evalId("eval\_id")
.dataSource(CreateEvalJsonlRunDataSource.builder()
.fileContentSource(List.of(CreateEvalJsonlRunDataSource.Source.FileContent.Content.builder()
.item(CreateEvalJsonlRunDataSource.Source.FileContent.Content.Item.builder()
.putAdditionalProperty("foo", JsonValue.from("bar"))
.build())
.build()))
.build())
.build();
RunCreateResponse run = client.evals().runs().create(params);
}
}`
```
```
`{
"object": "eval.run",
"id": "evalrun\_67e57965b480819094274e3a32235e4c",
"eval\_id": "eval\_67e579652b548190aaa83ada4b125f47",
"report\_url": "https://platform.openai.com/evaluations/eval\_67e579652b548190aaa83ada4b125f47&run\_id=evalrun\_67e57965b480819094274e3a32235e4c",
"status": "queued",
"model": "gpt-4o-mini",
"name": "gpt-4o-mini",
"created\_at": 1743092069,
"result\_counts": {
"total": 0,
"errored": 0,
"failed": 0,
"passed": 0
},
"per\_model\_usage": null,
"per\_testing\_criteria\_results": null,
"data\_source": {
"type": "completions",
"source": {
"type": "file\_content",
"content": [
{
"item": {
"input": "Tech Company Launches Advanced Artificial Intelligence Platform",
"ground\_truth": "Technology"
}
}
]
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "Categorize a given news headline into one of the following topics: Technology, Markets, World, Business, or Sports.\\n\\n# Steps\\n\\n1. Analyze the content of the news headline to understand its primary focus.\\n2. Extract the subject matter, identifying any key indicators or keywords.\\n3. Use the identified indicators to determine the most suitable category out of the five options: Technology, Markets, World, Business, or Sports.\\n4. Ensure only one category is selected per headline.\\n\\n# Output Format\\n\\nRespond with the chosen category as a single word. For instance: \\"Technology\\", \\"Markets\\", \\"World\\", \\"Business\\", or \\"Sports\\".\\n\\n# Examples\\n\\n\*\*Input\*\*: \\"Apple Unveils New iPhone Model, Featuring Advanced AI Features\\" \\n\*\*Output\*\*: \\"Technology\\"\\n\\n\*\*Input\*\*: \\"Global Stocks Mixed as Investors Await Central Bank Decisions\\" \\n\*\*Output\*\*: \\"Markets\\"\\n\\n\*\*Input\*\*: \\"War in Ukraine: Latest Updates on Negotiation Status\\" \\n\*\*Output\*\*: \\"World\\"\\n\\n\*\*Input\*\*: \\"Microsoft in Talks to Acquire Gaming Company for $2 Billion\\" \\n\*\*Output\*\*: \\"Business\\"\\n\\n\*\*Input\*\*: \\"Manchester United Secures Win in Premier League Football Match\\" \\n\*\*Output\*\*: \\"Sports\\" \\n\\n# Notes\\n\\n- If the headline appears to fit into more than one category, choose the most dominant theme.\\n- Keywords or phrases such as \\"stocks\\", \\"company acquisition\\", \\"match\\", or technological brands can be good indicators for classification.\\n"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "{{item.input}}"
}
}
]
},
"model": "gpt-4o-mini",
"sampling\_params": {
"seed": 42,
"temperature": 1.0,
"top\_p": 1.0,
"max\_completions\_tokens": 2048
}
},
"error": null,
"metadata": {}
}
`
```
##### Returns Examples
```
`{
"object": "eval.run",
"id": "evalrun\_67e57965b480819094274e3a32235e4c",
"eval\_id": "eval\_67e579652b548190aaa83ada4b125f47",
"report\_url": "https://platform.openai.com/evaluations/eval\_67e579652b548190aaa83ada4b125f47&run\_id=evalrun\_67e57965b480819094274e3a32235e4c",
"status": "queued",
"model": "gpt-4o-mini",
"name": "gpt-4o-mini",
"created\_at": 1743092069,
"result\_counts": {
"total": 0,
"errored": 0,
"failed": 0,
"passed": 0
},
"per\_model\_usage": null,
"per\_testing\_criteria\_results": null,
"data\_source": {
"type": "completions",
"source": {
"type": "file\_content",
"content": [
{
"item": {
"input": "Tech Company Launches Advanced Artificial Intelligence Platform",
"ground\_truth": "Technology"
}
}
]
},
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "developer",
"content": {
"type": "input\_text",
"text": "Categorize a given news headline into one of the following topics: Technology, Markets, World, Business, or Sports.\\n\\n# Steps\\n\\n1. Analyze the content of the news headline to understand its primary focus.\\n2. Extract the subject matter, identifying any key indicators or keywords.\\n3. Use the identified indicators to determine the most suitable category out of the five options: Technology, Markets, World, Business, or Sports.\\n4. Ensure only one category is selected per headline.\\n\\n# Output Format\\n\\nRespond with the chosen category as a single word. For instance: \\"Technology\\", \\"Markets\\", \\"World\\", \\"Business\\", or \\"Sports\\".\\n\\n# Examples\\n\\n\*\*Input\*\*: \\"Apple Unveils New iPhone Model, Featuring Advanced AI Features\\" \\n\*\*Output\*\*: \\"Technology\\"\\n\\n\*\*Input\*\*: \\"Global Stocks Mixed as Investors Await Central Bank Decisions\\" \\n\*\*Output\*\*: \\"Markets\\"\\n\\n\*\*Input\*\*: \\"War in Ukraine: Latest Updates on Negotiation Status\\" \\n\*\*Output\*\*: \\"World\\"\\n\\n\*\*Input\*\*: \\"Microsoft in Talks to Acquire Gaming Company for $2 Billion\\" \\n\*\*Output\*\*: \\"Business\\"\\n\\n\*\*Input\*\*: \\"Manchester United Secures Win in Premier League Football Match\\" \\n\*\*Output\*\*: \\"Sports\\" \\n\\n# Notes\\n\\n- If the headline appears to fit into more than one category, choose the most dominant theme.\\n- Keywords or phrases such as \\"stocks\\", \\"company acquisition\\", \\"match\\", or technological brands can be good indicators for classification.\\n"
}
},
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": "{{item.input}}"
}
}
]
},
"model": "gpt-4o-mini",
"sampling\_params": {
"seed": 42,
"temperature": 1.0,
"top\_p": 1.0,
"max\_completions\_tokens": 2048
}
},
"error": null,
"metadata": {}
}
`
```