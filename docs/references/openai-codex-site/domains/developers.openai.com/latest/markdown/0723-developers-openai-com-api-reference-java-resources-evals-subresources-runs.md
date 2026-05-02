Runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Runs
Manage and run evals in the OpenAI platform.
##### [Get eval runs](/api/reference/java/resources/evals/subresources/runs/methods/list)
RunListPage evals().runs().list(RunListParamsparams = RunListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/evals/{eval\_id}/runs
##### [Create eval run](/api/reference/java/resources/evals/subresources/runs/methods/create)
[RunCreateResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunCreateResponse > (schema)>) evals().runs().create(RunCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/evals/{eval\_id}/runs
##### [Get an eval run](/api/reference/java/resources/evals/subresources/runs/methods/retrieve)
[RunRetrieveResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunRetrieveResponse > (schema)>) evals().runs().retrieve(RunRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/evals/{eval\_id}/runs/{run\_id}
##### [Cancel eval run](/api/reference/java/resources/evals/subresources/runs/methods/cancel)
[RunCancelResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunCancelResponse > (schema)>) evals().runs().cancel(RunCancelParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/evals/{eval\_id}/runs/{run\_id}
##### [Delete eval run](/api/reference/java/resources/evals/subresources/runs/methods/delete)
[RunDeleteResponse](</api/reference/java/resources/evals#(resource) evals.runs > (model) RunDeleteResponse > (schema)>) evals().runs().delete(RunDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/evals/{eval\_id}/runs/{run\_id}
##### ModelsExpand Collapse
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
class EvalApiError:
An object representing an error response from the Eval API.
String code
The error code.
[](<#(resource) evals.runs > (model) eval_api_error > (schema) > (property) code>)
String message
The error message.
[](<#(resource) evals.runs > (model) eval_api_error > (schema) > (property) message>)
[](<#(resource) evals.runs > (model) eval_api_error > (schema)>)
#### RunsOutput Items
Manage and run evals in the OpenAI platform.
##### [Get eval run output items](/api/reference/java/resources/evals/subresources/runs/subresources/output_items/methods/list)
OutputItemListPage evals().runs().outputItems().list(OutputItemListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/evals/{eval\_id}/runs/{run\_id}/output\_items
##### [Get an output item of an eval run](/api/reference/java/resources/evals/subresources/runs/subresources/output_items/methods/retrieve)
[OutputItemRetrieveResponse](</api/reference/java/resources/evals#(resource) evals.runs.output_items > (model) OutputItemRetrieveResponse > (schema)>) evals().runs().outputItems().retrieve(OutputItemRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/evals/{eval\_id}/runs/{run\_id}/output\_items/{output\_item\_id}