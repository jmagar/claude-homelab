Get an eval run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Evals](/api/reference/typescript/resources/evals)
[Runs](/api/reference/typescript/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get an eval run
client.evals.runs.retrieve(stringrunID, RunRetrieveParams { eval\_id } params, RequestOptionsoptions?): [RunRetrieveResponse](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) run_retrieve_response > (schema)>) { id, created\_at, data\_source, 11 more }
GET/evals/{eval\_id}/runs/{run\_id}
Get an evaluation run by ID.
##### ParametersExpand Collapse
runID: string
[](<#(resource) evals.runs > (method) retrieve > (params) default > (param) run_id > (schema)>)
params: RunRetrieveParams { eval\_id }
eval\_id: string
The ID of the evaluation to retrieve runs for.
[](<#(resource) evals.runs > (method) retrieve > (params) default > (param) eval_id>)
[](<#(resource) evals.runs > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
RunRetrieveResponse { id, created\_at, data\_source, 11 more }
A schema representing an evaluation run.
id: string
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) created_at>)
data\_source: [CreateEvalJSONLRunDataSource](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema)>) { source, type } | [CreateEvalCompletionsRunDataSource](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>) { source, type, input\_messages, 2 more } | Responses { source, type, input\_messages, 2 more }
Information about the run’s data source.
One of the following:
CreateEvalJSONLRunDataSource { source, type }
A JsonlRunDataSource object with that specifies a JSONL file that matches the eval
source: FileContent { content, type } | FileID { id, type }
Determines what populates the `item` namespace in the data source.
One of the following:
FileContent { content, type }
content: Array\<Content\>
The content of the jsonl file.
item: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample?: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_jsonl_run_data_source > (schema) > (property) source > (variant) 0>)
FileID { id, type }
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
CreateEvalCompletionsRunDataSource { source, type, input\_messages, 2 more }
A CompletionsRunDataSource object describing a model sampling configuration.
source: FileContent { content, type } | FileID { id, type } | StoredCompletions { type, created\_after, created\_before, 3 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
FileContent { content, type }
content: Array\<Content\>
The content of the jsonl file.
item: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample?: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 0>)
FileID { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 1>)
StoredCompletions { type, created\_after, created\_before, 3 more }
A StoredCompletionsRunDataSource configuration describing a set of filters
type: "stored\_completions"
The type of source. Always `stored\_completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) type>)
created\_after?: number | null
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_after>)
created\_before?: number | null
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) created_before>)
limit?: number | null
An optional maximum number of items to return.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) limit>)
metadata?: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) metadata>)
model?: string | null
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2 > (property) model>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) source>)
type: "completions"
The type of run data source. Always `completions`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) type>)
input\_messages?: Template { template, type } | ItemReference { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
Template { template, type }
template: Array\<[EasyInputMessage](</api/reference/typescript/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } | EvalItem { content, role, type } \>
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
EasyInputMessage { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string | [ResponseInputMessageContentList](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
string
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = Array\<[ResponseInputContent](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_content > (schema)>)\>
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" | "assistant" | "system" | "developer"
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
phase?: "commentary" | "final\_answer" | null
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type?: "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
EvalItem { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string | [ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText { text, type } | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail?: string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" | "wav"
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
GraderInputs = Array\<string | [ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText { text, type } | 2 more\>
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail?: string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" | "wav"
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
role: "user" | "assistant" | "system" | "developer"
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
type?: "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 0>)
ItemReference { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) input_messages>)
model?: string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) model>)
sampling\_params?: SamplingParams { max\_completion\_tokens, reasoning\_effort, response\_format, 4 more }
max\_completion\_tokens?: number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort?: [ReasoningEffort](</api/reference/typescript/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) | null
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
"none"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) reasoning_effort>)
response\_format?: [ResponseFormatText](</api/reference/typescript/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } | [ResponseFormatJSONSchema](</api/reference/typescript/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } | [ResponseFormatJSONObject](</api/reference/typescript/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) response_format>)
seed?: number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) seed>)
temperature?: number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) temperature>)
tools?: Array\<[ChatCompletionFunctionTool](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type } \>
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) tools>)
top\_p?: number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema) > (property) sampling_params>)
[](<#(resource) evals.runs > (model) create_eval_completions_run_data_source > (schema)>)
Responses { source, type, input\_messages, 2 more }
A ResponsesRunDataSource object describing a model sampling configuration.
source: FileContent { content, type } | FileID { id, type } | Responses { type, created\_after, created\_before, 8 more }
Determines what populates the `item` namespace in this run’s data source.
One of the following:
FileContent { content, type }
content: Array\<Content\>
The content of the jsonl file.
item: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) item>)
sample?: Record\<string, unknown\>
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content > (items) > (property) sample>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) content>)
type: "file\_content"
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 0>)
FileID { id, type }
id: string
The identifier of the file.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) id>)
type: "file\_id"
The type of jsonl source. Always `file\_id`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 1>)
Responses { type, created\_after, created\_before, 8 more }
A EvalResponsesSource object describing a run data source configuration.
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) type>)
created\_after?: number | null
Only include items created after this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_after>)
created\_before?: number | null
Only include items created before this timestamp (inclusive). This is a query parameter used to select responses.
minimum0
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) created_before>)
instructions\_search?: string | null
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) instructions_search>)
metadata?: unknown
Metadata filter for the responses. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) metadata>)
model?: string | null
The name of the model to find responses for. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) model>)
reasoning\_effort?: [ReasoningEffort](</api/reference/typescript/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) | null
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
"none"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) reasoning_effort>)
temperature?: number | null
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) temperature>)
tools?: Array\<string\> | null
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) tools>)
top\_p?: number | null
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) top_p>)
users?: Array\<string\> | null
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2 > (property) users>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) source>)
type: "responses"
The type of run data source. Always `responses`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) type>)
input\_messages?: Template { template, type } | ItemReference { item\_reference, type }
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
One of the following:
Template { template, type }
template: Array\<ChatMessage { content, role } | EvalItem { content, role, type } \>
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
One of the following:
ChatMessage { content, role }
content: string
The content of the message.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) content>)
role: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0 > (property) role>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 0>)
EvalItem { content, role, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string | [ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText { text, type } | 3 more
Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.
One of the following:
string
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 0>)
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 2>)
InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) type>)
detail?: string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3 > (property) detail>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) content > (variant) 3>)
ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" | "wav"
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
GraderInputs = Array\<string | [ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | OutputText { text, type } | 2 more\>
A list of inputs, each of which may be either an input text, output text, input
image, or input audio object.
One of the following:
string
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 0>)
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
OutputText { text, type }
A text output from the model.
text: string
The text output from the model.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2 > (property) type>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 2>)
InputImage { image\_url, type, detail }
An image input block used within EvalItem content arrays.
image\_url: string
The URL of the image input.
formaturi
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) image_url>)
type: "input\_image"
The type of the image input. Always `input\_image`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) type>)
detail?: string
The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3 > (property) detail>)
[](<#(resource) graders.grader_models > (model) grader_inputs > (schema) > (items) > (variant) 3>)
ResponseInputAudio { input\_audio, type }
An audio input to the model.
input\_audio: InputAudio { data, format }
data: string
Base64-encoded audio data.
[](<#(resource) responses > (model) response_input_audio > (schema) > (property) input_audio > (property) data>)
format: "mp3" | "wav"
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
role: "user" | "assistant" | "system" | "developer"
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
type?: "message"
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template > (items) > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) template>)
type: "template"
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 0>)
ItemReference { item\_reference, type }
item\_reference: string
A reference to a variable in the `item` namespace. Ie, “item.name”
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) item_reference>)
type: "item\_reference"
The type of input messages. Always `item\_reference`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1 > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages > (variant) 1>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) input_messages>)
model?: string
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) model>)
sampling\_params?: SamplingParams { max\_completion\_tokens, reasoning\_effort, seed, 4 more }
max\_completion\_tokens?: number
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) max_completion_tokens>)
reasoning\_effort?: [ReasoningEffort](</api/reference/typescript/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) | null
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
"none"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) reasoning_effort>)
seed?: number
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) seed>)
temperature?: number
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) temperature>)
text?: Text { format }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
format?: [ResponseFormatTextConfig](</api/reference/typescript/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
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
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatTextJSONSchemaConfig { name, schema, type, 2 more }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) name>)
schema: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) type>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) description>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) strict>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format + (resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text > (property) format>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) text>)
tools?: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
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
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
data: string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
media\_type: "application/zip"
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
type: "base64"
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) tools>)
top\_p?: number
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params > (property) top_p>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2 > (property) sampling_params>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source > (variant) 2>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) data_source>)
error: [EvalAPIError](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
code: string
The error code.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) code>)
message: string
The error message.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) message>)
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) error>)
eval\_id: string
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (model) run_retrieve_response > (schema) > (property) eval_id>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
per\_model\_usage: Array\<PerModelUsage\>
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
per\_testing\_criteria\_results: Array\<PerTestingCriteriaResult\>
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
result\_counts: ResultCounts { errored, failed, passed, total }
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
### Get an eval run
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
const run = await openai.evals.runs.retrieve(
"evalrun\_67abd54d60ec8190832b46859da808f7",
{ eval\_id: "eval\_67abd54d9b0081909a86353f6fb9317a" }
);
console.log(run);
`
```
```
`{
"object": "eval.run",
"id": "evalrun\_67abd54d60ec8190832b46859da808f7",
"eval\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"report\_url": "https://platform.openai.com/evaluations/eval\_67abd54d9b0081909a86353f6fb9317a?run\_id=evalrun\_67abd54d60ec8190832b46859da808f7",
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
},
{
"item": {
"input": "Central Bank Increases Interest Rates Amid Inflation Concerns",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "International Summit Addresses Climate Change Strategies",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Major Retailer Reports Record-Breaking Holiday Sales",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "National Team Qualifies for World Championship Finals",
"ground\_truth": "Sports"
}
},
{
"item": {
"input": "Stock Markets Rally After Positive Economic Data Released",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "Global Manufacturer Announces Merger with Competitor",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "Breakthrough in Renewable Energy Technology Unveiled",
"ground\_truth": "Technology"
}
},
{
"item": {
"input": "World Leaders Sign Historic Climate Agreement",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Professional Athlete Sets New Record in Championship Event",
"ground\_truth": "Sports"
}
},
{
"item": {
"input": "Financial Institutions Adapt to New Regulatory Requirements",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "Tech Conference Showcases Advances in Artificial Intelligence",
"ground\_truth": "Technology"
}
},
{
"item": {
"input": "Global Markets Respond to Oil Price Fluctuations",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "International Cooperation Strengthened Through New Treaty",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Sports League Announces Revised Schedule for Upcoming Season",
"ground\_truth": "Sports"
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
"id": "evalrun\_67abd54d60ec8190832b46859da808f7",
"eval\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"report\_url": "https://platform.openai.com/evaluations/eval\_67abd54d9b0081909a86353f6fb9317a?run\_id=evalrun\_67abd54d60ec8190832b46859da808f7",
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
},
{
"item": {
"input": "Central Bank Increases Interest Rates Amid Inflation Concerns",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "International Summit Addresses Climate Change Strategies",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Major Retailer Reports Record-Breaking Holiday Sales",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "National Team Qualifies for World Championship Finals",
"ground\_truth": "Sports"
}
},
{
"item": {
"input": "Stock Markets Rally After Positive Economic Data Released",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "Global Manufacturer Announces Merger with Competitor",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "Breakthrough in Renewable Energy Technology Unveiled",
"ground\_truth": "Technology"
}
},
{
"item": {
"input": "World Leaders Sign Historic Climate Agreement",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Professional Athlete Sets New Record in Championship Event",
"ground\_truth": "Sports"
}
},
{
"item": {
"input": "Financial Institutions Adapt to New Regulatory Requirements",
"ground\_truth": "Business"
}
},
{
"item": {
"input": "Tech Conference Showcases Advances in Artificial Intelligence",
"ground\_truth": "Technology"
}
},
{
"item": {
"input": "Global Markets Respond to Oil Price Fluctuations",
"ground\_truth": "Markets"
}
},
{
"item": {
"input": "International Cooperation Strengthened Through New Treaty",
"ground\_truth": "World"
}
},
{
"item": {
"input": "Sports League Announces Revised Schedule for Upcoming Season",
"ground\_truth": "Sports"
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