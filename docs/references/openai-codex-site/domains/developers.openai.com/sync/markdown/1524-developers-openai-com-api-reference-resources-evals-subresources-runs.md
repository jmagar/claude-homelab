Runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Evals](/api/reference/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Runs
Manage and run evals in the OpenAI platform.
##### [Get eval runs](/api/reference/resources/evals/subresources/runs/methods/list)
GET/evals/{eval\_id}/runs
##### [Create eval run](/api/reference/resources/evals/subresources/runs/methods/create)
POST/evals/{eval\_id}/runs
##### [Get an eval run](/api/reference/resources/evals/subresources/runs/methods/retrieve)
GET/evals/{eval\_id}/runs/{run\_id}
##### [Cancel eval run](/api/reference/resources/evals/subresources/runs/methods/cancel)
POST/evals/{eval\_id}/runs/{run\_id}
##### [Delete eval run](/api/reference/resources/evals/subresources/runs/methods/delete)
DELETE/evals/{eval\_id}/runs/{run\_id}
##### ModelsExpand Collapse
CreateEvalCompletionsRunDataSource object { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletionsRunDataSource object { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit: optional number
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model: optional string
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
TemplateInputMessages object { template, type }
template: array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReferenceInputMessages object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools: optional array of [ChatCompletionFunctionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type }
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
CreateEvalJSONLRunDataSource object { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: object { content, type } or object { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
type: "jsonl"
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
EvalAPIError object { code, message }
An object representing an error response from the Eval API.
code: string
The error code.
[](<#(resource) evals.runs > (model) eval_api_error > (schema) > (property) code>)
message: string
The error message.
[](<#(resource) evals.runs > (model) eval_api_error > (schema) > (property) message>)
[](<#(resource) evals.runs > (model) eval_api_error > (schema)>)
RunListResponse object { id, created\_at, data\_source, 11 more }
A schema representing an evaluation run.
id: string
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) created_at>)
data\_source: [CreateEvalJSONLRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>) { source, type } or [CreateEvalCompletionsRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>) { source, type, input\_messages, 2 more } or object { source, type, input\_messages, 2 more }
Information about the run’s data source.
One of the following:
CreateEvalJSONLRunDataSource object { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: object { content, type } or object { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
type: "jsonl"
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
CreateEvalCompletionsRunDataSource object { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletionsRunDataSource object { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit: optional number
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model: optional string
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
TemplateInputMessages object { template, type }
template: array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReferenceInputMessages object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools: optional array of [ChatCompletionFunctionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type }
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
ResponsesRunDataSource object { source, type, input\_messages, 2 more }
A ResponsesRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 8 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
EvalResponsesSource object { type, created\_after, created\_before, 8 more }
A EvalResponsesSource object describing a run data source configuration.
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
instructions\_search: optional string
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
metadata: optional unknown
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
model: optional string
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
temperature: optional number
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
tools: optional array of string
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
top\_p: optional number
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
users: optional array of string
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) source>)
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
InputMessagesTemplate object { template, type }
template: array of object { content, role } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
ChatMessage object { content, role }
content: string
The content of the message.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
role: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
InputMessagesItemReference object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, seed, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
text: optional object { format }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](/docs/guides/text)
* [Structured Outputs](/docs/guides/structured-outputs)
format: optional [ResponseFormatTextConfig](</api/reference/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
tools: optional array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](/docs/guides/tools-web-search)
or [file search](/docs/guides/tools-file-search). Learn more about
[built-in tools](/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](/docs/guides/function-calling).
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) data_source>)
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) error>)
eval\_id: string
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) eval_id>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) metadata>)
model: string
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) model>)
name: string
The name of the evaluation run.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) name>)
object: "eval.run"
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) object>)
per\_model\_usage: array of object { cached\_tokens, completion\_tokens, invocation\_count, 3 more }
Usage statistics for each model during the evaluation run.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) completion_tokens>)
invocation\_count: number
The number of invocations.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) invocation_count>)
model\_name: string
The name of the model.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) model_name>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage > (items) > (property) total_tokens>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_model_usage>)
per\_testing\_criteria\_results: array of object { failed, passed, testing\_criteria }
Results per testing criteria applied during the evaluation run.
failed: number
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_testing_criteria_results > (items) > (property) failed>)
passed: number
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_testing_criteria_results > (items) > (property) passed>)
testing\_criteria: string
A description of the testing criteria.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_testing_criteria_results > (items) > (property) testing_criteria>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) per_testing_criteria_results>)
report\_url: string
The URL to the rendered evaluation run report on the UI dashboard.
formaturi
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) report_url>)
result\_counts: object { errored, failed, passed, total }
Counters summarizing the outcomes of the evaluation run.
errored: number
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) result_counts > (property) errored>)
failed: number
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) result_counts > (property) failed>)
passed: number
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) result_counts > (property) passed>)
total: number
Total number of executed output items.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) result_counts > (property) total>)
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) result_counts>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs > (model) run_list_response > (schema) > (property) status>)
[](<#(resource) evals.runs > (model) run_list_response > (schema)>)
RunCreateResponse object { id, created\_at, data\_source, 11 more }
A schema representing an evaluation run.
id: string
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) created_at>)
data\_source: [CreateEvalJSONLRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>) { source, type } or [CreateEvalCompletionsRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>) { source, type, input\_messages, 2 more } or object { source, type, input\_messages, 2 more }
Information about the run’s data source.
One of the following:
CreateEvalJSONLRunDataSource object { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: object { content, type } or object { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
type: "jsonl"
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
CreateEvalCompletionsRunDataSource object { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletionsRunDataSource object { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit: optional number
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model: optional string
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
TemplateInputMessages object { template, type }
template: array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReferenceInputMessages object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools: optional array of [ChatCompletionFunctionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type }
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
ResponsesRunDataSource object { source, type, input\_messages, 2 more }
A ResponsesRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 8 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
EvalResponsesSource object { type, created\_after, created\_before, 8 more }
A EvalResponsesSource object describing a run data source configuration.
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
instructions\_search: optional string
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
metadata: optional unknown
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
model: optional string
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
temperature: optional number
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
tools: optional array of string
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
top\_p: optional number
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
users: optional array of string
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) source>)
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
InputMessagesTemplate object { template, type }
template: array of object { content, role } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
ChatMessage object { content, role }
content: string
The content of the message.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
role: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
InputMessagesItemReference object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, seed, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
text: optional object { format }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](/docs/guides/text)
* [Structured Outputs](/docs/guides/structured-outputs)
format: optional [ResponseFormatTextConfig](</api/reference/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
tools: optional array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](/docs/guides/tools-web-search)
or [file search](/docs/guides/tools-file-search). Learn more about
[built-in tools](/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](/docs/guides/function-calling).
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) data_source>)
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) error>)
eval\_id: string
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) eval_id>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) metadata>)
model: string
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) model>)
name: string
The name of the evaluation run.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) name>)
object: "eval.run"
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) object>)
per\_model\_usage: array of object { cached\_tokens, completion\_tokens, invocation\_count, 3 more }
Usage statistics for each model during the evaluation run.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) completion_tokens>)
invocation\_count: number
The number of invocations.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) invocation_count>)
model\_name: string
The name of the model.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) model_name>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage > (items) > (property) total_tokens>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_model_usage>)
per\_testing\_criteria\_results: array of object { failed, passed, testing\_criteria }
Results per testing criteria applied during the evaluation run.
failed: number
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_testing_criteria_results > (items) > (property) failed>)
passed: number
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_testing_criteria_results > (items) > (property) passed>)
testing\_criteria: string
A description of the testing criteria.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_testing_criteria_results > (items) > (property) testing_criteria>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) per_testing_criteria_results>)
report\_url: string
The URL to the rendered evaluation run report on the UI dashboard.
formaturi
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) report_url>)
result\_counts: object { errored, failed, passed, total }
Counters summarizing the outcomes of the evaluation run.
errored: number
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) result_counts > (property) errored>)
failed: number
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) result_counts > (property) failed>)
passed: number
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) result_counts > (property) passed>)
total: number
Total number of executed output items.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) result_counts > (property) total>)
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) result_counts>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs > (model) run_create_response > (schema) > (property) status>)
[](<#(resource) evals.runs > (model) run_create_response > (schema)>)
RunRetrieveResponse object { id, created\_at, data\_source, 11 more }
A schema representing an evaluation run.
id: string
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) created_at>)
data\_source: [CreateEvalJSONLRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>) { source, type } or [CreateEvalCompletionsRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>) { source, type, input\_messages, 2 more } or object { source, type, input\_messages, 2 more }
Information about the run’s data source.
One of the following:
CreateEvalJSONLRunDataSource object { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: object { content, type } or object { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
type: "jsonl"
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
CreateEvalCompletionsRunDataSource object { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletionsRunDataSource object { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit: optional number
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model: optional string
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
TemplateInputMessages object { template, type }
template: array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReferenceInputMessages object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools: optional array of [ChatCompletionFunctionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type }
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
ResponsesRunDataSource object { source, type, input\_messages, 2 more }
A ResponsesRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 8 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
EvalResponsesSource object { type, created\_after, created\_before, 8 more }
A EvalResponsesSource object describing a run data source configuration.
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
instructions\_search: optional string
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
metadata: optional unknown
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
model: optional string
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
temperature: optional number
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
tools: optional array of string
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
top\_p: optional number
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
users: optional array of string
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source>)
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
InputMessagesTemplate object { template, type }
template: array of object { content, role } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
ChatMessage object { content, role }
content: string
The content of the message.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
role: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
InputMessagesItemReference object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, seed, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
text: optional object { format }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](/docs/guides/text)
* [Structured Outputs](/docs/guides/structured-outputs)
format: optional [ResponseFormatTextConfig](</api/reference/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
tools: optional array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](/docs/guides/tools-web-search)
or [file search](/docs/guides/tools-file-search). Learn more about
[built-in tools](/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](/docs/guides/function-calling).
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source>)
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) error>)
eval\_id: string
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) eval_id>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) metadata>)
model: string
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) model>)
name: string
The name of the evaluation run.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) name>)
object: "eval.run"
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) object>)
per\_model\_usage: array of object { cached\_tokens, completion\_tokens, invocation\_count, 3 more }
Usage statistics for each model during the evaluation run.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) completion_tokens>)
invocation\_count: number
The number of invocations.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) invocation_count>)
model\_name: string
The name of the model.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) model_name>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage > (items) > (property) total_tokens>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_model_usage>)
per\_testing\_criteria\_results: array of object { failed, passed, testing\_criteria }
Results per testing criteria applied during the evaluation run.
failed: number
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_testing_criteria_results > (items) > (property) failed>)
passed: number
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_testing_criteria_results > (items) > (property) passed>)
testing\_criteria: string
A description of the testing criteria.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_testing_criteria_results > (items) > (property) testing_criteria>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) per_testing_criteria_results>)
report\_url: string
The URL to the rendered evaluation run report on the UI dashboard.
formaturi
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) report_url>)
result\_counts: object { errored, failed, passed, total }
Counters summarizing the outcomes of the evaluation run.
errored: number
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) result_counts > (property) errored>)
failed: number
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) result_counts > (property) failed>)
passed: number
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) result_counts > (property) passed>)
total: number
Total number of executed output items.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) result_counts > (property) total>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) result_counts>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) status>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema)>)
RunCancelResponse object { id, created\_at, data\_source, 11 more }
A schema representing an evaluation run.
id: string
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) created_at>)
data\_source: [CreateEvalJSONLRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>) { source, type } or [CreateEvalCompletionsRunDataSource](</api/reference/resources/evals#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>) { source, type, input\_messages, 2 more } or object { source, type, input\_messages, 2 more }
Information about the run’s data source.
One of the following:
CreateEvalJSONLRunDataSource object { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: object { content, type } or object { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source>)
type: "jsonl"
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>)
CreateEvalCompletionsRunDataSource object { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletionsRunDataSource object { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit: optional number
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model: optional string
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
TemplateInputMessages object { template, type }
template: array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReferenceInputMessages object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
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
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools: optional array of [ChatCompletionFunctionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type }
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
ResponsesRunDataSource object { source, type, input\_messages, 2 more }
A ResponsesRunDataSource object describing a model sampling configuration.
source: object { content, type } or object { id, type } or object { type, created\_after, created\_before, 8 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
EvalJSONLFileContentSource object { content, type }
content: array of object { item, sample }
The content of the jsonl file.
item: map[unknown]
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample: optional map[unknown]
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
EvalJSONLFileIDSource object { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
EvalResponsesSource object { type, created\_after, created\_before, 8 more }
A EvalResponsesSource object describing a run data source configuration.
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
created\_after: optional number
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
created\_before: optional number
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
instructions\_search: optional string
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
metadata: optional unknown
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
model: optional string
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
temperature: optional number
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
tools: optional array of string
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
top\_p: optional number
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
users: optional array of string
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) source>)
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) type>)
input\_messages: optional object { template, type } or object { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
InputMessagesTemplate object { template, type }
template: array of object { content, role } or object { content, role, type }
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
ChatMessage object { content, role }
content: string
The content of the message.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
role: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
EvalMessageObject object { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or object { text, type } or 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
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
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage object { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail: optional string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
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
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 0>)
"assistant"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 1>)
"system"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 2>)
"developer"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role > (member) 3>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) role>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
InputMessagesItemReference object { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
model: optional string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) model>)
sampling\_params: optional object { max\_completion\_tokens, reasoning\_effort, seed, 4 more }
max\_completion\_tokens: optional number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
seed: optional number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
temperature: optional number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
text: optional object { format }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](/docs/guides/text)
* [Structured Outputs](/docs/guides/structured-outputs)
format: optional [ResponseFormatTextConfig](</api/reference/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
tools: optional array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
The two categories of tools you can provide the model are:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](/docs/guides/tools-web-search)
or [file search](/docs/guides/tools-file-search). Learn more about
[built-in tools](/docs/guides/tools).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code. Learn more about
[function calling](/docs/guides/function-calling).
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
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
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
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
"connector\_dropbox"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools > (items) > (variant) 14>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
top\_p: optional number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) data_source>)
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) error>)
eval\_id: string
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) eval_id>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) metadata>)
model: string
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) model>)
name: string
The name of the evaluation run.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) name>)
object: "eval.run"
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) object>)
per\_model\_usage: array of object { cached\_tokens, completion\_tokens, invocation\_count, 3 more }
Usage statistics for each model during the evaluation run.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) completion_tokens>)
invocation\_count: number
The number of invocations.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) invocation_count>)
model\_name: string
The name of the model.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) model_name>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage > (items) > (property) total_tokens>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_model_usage>)
per\_testing\_criteria\_results: array of object { failed, passed, testing\_criteria }
Results per testing criteria applied during the evaluation run.
failed: number
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_testing_criteria_results > (items) > (property) failed>)
passed: number
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_testing_criteria_results > (items) > (property) passed>)
testing\_criteria: string
A description of the testing criteria.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_testing_criteria_results > (items) > (property) testing_criteria>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) per_testing_criteria_results>)
report\_url: string
The URL to the rendered evaluation run report on the UI dashboard.
formaturi
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) report_url>)
result\_counts: object { errored, failed, passed, total }
Counters summarizing the outcomes of the evaluation run.
errored: number
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) result_counts > (property) errored>)
failed: number
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) result_counts > (property) failed>)
passed: number
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) result_counts > (property) passed>)
total: number
Total number of executed output items.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) result_counts > (property) total>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) result_counts>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs > (model) run_cancel_response > (schema) > (property) status>)
[](<#(resource) evals.runs > (model) run_cancel_response > (schema)>)
RunDeleteResponse object { deleted, object, run\_id }
deleted: optional boolean
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) deleted>)
object: optional string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) object>)
run\_id: optional string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) run_id>)
[](<#(resource) evals.runs > (model) run_delete_response > (schema)>)
#### RunsOutput Items
Manage and run evals in the OpenAI platform.
##### [Get eval run output items](/api/reference/resources/evals/subresources/runs/subresources/output_items/methods/list)
GET/evals/{eval\_id}/runs/{run\_id}/output\_items
##### [Get an output item of an eval run](/api/reference/resources/evals/subresources/runs/subresources/output_items/methods/retrieve)
GET/evals/{eval\_id}/runs/{run\_id}/output\_items/{output\_item\_id}
##### ModelsExpand Collapse
OutputItemListResponse object { id, created\_at, datasource\_item, 7 more }
A schema representing an evaluation run output item.
id: string
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) created_at>)
datasource\_item: map[unknown]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item>)
datasource\_item\_id: number
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item_id>)
eval\_id: string
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) eval_id>)
object: "eval.run.output\_item"
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) object>)
results: array of object { name, passed, score, 2 more }
A list of grader results for this output item.
name: string
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) name>)
passed: boolean
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) passed>)
score: number
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) score>)
sample: optional map[unknown]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) sample>)
type: optional string
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results>)
run\_id: string
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) run_id>)
sample: object { error, finish\_reason, input, 7 more }
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) error>)
finish\_reason: string
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) finish_reason>)
input: array of object { content, role }
An array of input messages.
content: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: string
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: number
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: string
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) model>)
output: array of object { content, role }
An array of output messages.
content: optional string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role: optional string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output>)
seed: number
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) seed>)
temperature: number
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) temperature>)
top\_p: number
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) top_p>)
usage: object { cached\_tokens, completion\_tokens, prompt\_tokens, total\_tokens }
Token usage details for the sample.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema)>)
OutputItemRetrieveResponse object { id, created\_at, datasource\_item, 7 more }
A schema representing an evaluation run output item.
id: string
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) created_at>)
datasource\_item: map[unknown]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item>)
datasource\_item\_id: number
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item_id>)
eval\_id: string
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) eval_id>)
object: "eval.run.output\_item"
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) object>)
results: array of object { name, passed, score, 2 more }
A list of grader results for this output item.
name: string
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) name>)
passed: boolean
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) passed>)
score: number
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) score>)
sample: optional map[unknown]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) sample>)
type: optional string
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results>)
run\_id: string
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) run_id>)
sample: object { error, finish\_reason, input, 7 more }
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) error>)
finish\_reason: string
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) finish_reason>)
input: array of object { content, role }
An array of input messages.
content: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: string
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: number
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: string
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) model>)
output: array of object { content, role }
An array of output messages.
content: optional string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role: optional string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output>)
seed: number
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) seed>)
temperature: number
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) temperature>)
top\_p: number
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) top_p>)
usage: object { cached\_tokens, completion\_tokens, prompt\_tokens, total\_tokens }
Token usage details for the sample.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema)>)