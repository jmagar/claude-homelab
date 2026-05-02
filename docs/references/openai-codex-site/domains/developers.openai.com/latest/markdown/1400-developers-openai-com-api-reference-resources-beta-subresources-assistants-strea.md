Assistants streaming events | OpenAI API Reference
[Skip to content](#_top)
Represents an event emitted when streaming a Run.
Each event in a server-sent events stream has an `event` and `data` property:
```
`event: thread.created
data: {"id": "thread\_123", "object": "thread", ...}`
```
We emit events whenever a new object is created, transitions to a new state, or is being
streamed in parts (deltas). For example, we emit `thread.run.created` when a new run
is created, `thread.run.completed` when a run completes, and so on. When an Assistant chooses
to create a message during a run, we emit a `thread.message.created event`, a
`thread.message.in\_progress` event, many `thread.message.delta` events, and finally a
`thread.message.completed` event.
We may add additional events over time, so we recommend handling unknown events gracefully
in your code. See the [Assistants API quickstart](/docs/assistants/overview) to learn how to
integrate the Assistants API with streaming.
object { data, event, enabled }
Occurs when a new [thread](/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](/docs/api-reference/messages).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: "thread"
The object type, which is always `thread`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: object { code\_interpreter, file\_search }
A set of resources that are made available to the assistant's tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled: optional boolean
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
object { data, event }
Occurs when a new [run](/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.run.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.run.queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: "thread.run.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: "thread.run.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: "thread.run.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: "thread.run.cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: "thread.run.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
object { data, event }
Occurs when a [run](/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: "thread.run.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
event: "thread.run.step.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
event: "thread.run.step.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
object { data, event }
Occurs when parts of a [run step](/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: object { step\_details }
The delta containing the fields that have changed on the run step.
step\_details: optional [RunStepDeltaMessageDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>) { type, message\_creation } or [ToolCallDeltaObject](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>) { type, tool\_calls }
The details of the run step.
One of the following:
RunStepDeltaMessageDelta object { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation: optional object { message\_id }
message\_id: optional string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
ToolCallDeltaObject object { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls: optional array of [CodeInterpreterToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>) { index, type, id, code\_interpreter } or [FileSearchToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>) { file\_search, index, type, id } or [FunctionToolCallDelta](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>) { index, type, id, function }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta object { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter: optional object { input, outputs }
The Code Interpreter tool call definition.
input: optional string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs: optional array of [CodeInterpreterLogs](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } or [CodeInterpreterOutputImage](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs object { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs: optional string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage object { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image: optional object { file\_id }
file\_id: optional string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta object { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta object { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id: optional string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function: optional object { arguments, name, output }
The definition of the function that was called.
arguments: optional string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name: optional string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output: optional string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta > (property) step_details>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: "thread.run.step.delta"
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: "thread.run.step.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
event: "thread.run.step.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
event: "thread.run.step.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
event: "thread.run.step.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
object { data, event }
Occurs when a [run step](/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: object { code, message }
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" or "cancelled" or "failed" or 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } or [ToolCallsStepDetails](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails object { message\_creation, type }
Details of the message creation by the run step.
message\_creation: object { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails object { tool\_calls, type }
Details of the tool call.
tool\_calls: array of [CodeInterpreterToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } or [FileSearchToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } or [FunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall object { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: object { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: array of object { logs, type } or object { image, type }
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogOutput object { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
CodeInterpreterImageOutput object { image, type }
image: object { file\_id }
file\_id: string
The [file](/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall object { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: object { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options: optional object { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results: optional array of object { file\_id, file\_name, score, content }
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content: optional array of object { text, type }
The content of the result that was found. The content is only included if requested via the include query parameter.
text: optional string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type: optional "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall object { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: object { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string
The output of the function. This will be `null` if the outputs have not been [submitted](/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" or "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run step. This value will be `null` while the run step's status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
event: "thread.run.step.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string
If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: array of object { file\_id, tools }
A list of files attached to the message, and the tools they were added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } or [RefusalContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: array of [FileCitationAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } or [FilePathAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
One of the following:
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file\_search" tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that's generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: number
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: number
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: object { reason }
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" or "max\_tokens" or "run\_cancelled" or 2 more
The reason the message is incomplete.
One of the following:
"content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
"run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
"run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
"run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" or "incomplete" or "completed"
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: string
The [thread](/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: "thread.message.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string
If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: array of object { file\_id, tools }
A list of files attached to the message, and the tools they were added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } or [RefusalContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: array of [FileCitationAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } or [FilePathAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
One of the following:
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file\_search" tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that's generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: number
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: number
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: object { reason }
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" or "max\_tokens" or "run\_cancelled" or 2 more
The reason the message is incomplete.
One of the following:
"content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
"run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
"run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
"run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" or "incomplete" or "completed"
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: string
The [thread](/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: "thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
object { data, event }
Occurs when parts of a [Message](/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
id: string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) { content, role }
The delta containing the fields that have changed on the Message.
content: optional array of [ImageFileDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>) { index, type, image\_file } or [TextDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_delta_block > (schema)>) { index, type, text } or [RefusalDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>) { index, type, refusal } or [ImageURLDeltaBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>) { index, type, image\_url }
The content of the message in array of text and/or images.
One of the following:
ImageFileDeltaBlock object { index, type, image\_file }
References an image [File](/docs/api-reference/files) in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: optional [ImageFileDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id: optional string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
TextDeltaBlock object { index, type, text }
The text content that is part of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: optional [TextDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
annotations: optional array of [FileCitationDeltaAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>) { index, type, end\_index, 3 more } or [FilePathDeltaAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>) { index, type, end\_index, 3 more }
One of the following:
FileCitationDeltaAnnotation object { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file\_search" tool to search files.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: optional object { file\_id, quote }
file\_id: optional string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: optional string
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
FilePathDeltaAnnotation object { index, type, end\_index, 3 more }
A URL for the file that's generated when the assistant used the `code\_interpreter` tool to generate a file.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: optional object { file\_id }
file\_id: optional string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: optional number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: optional string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value: optional string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema)>)
RefusalDeltaBlock object { index, type, refusal }
The refusal content that is part of a message.
index: number
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: optional string
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
ImageURLDeltaBlock object { index, type, image\_url }
References an image URL in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: "image\_url"
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: optional [ImageURLDelta](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url: optional string
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role: optional "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
object: "thread.message.delta"
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
event: "thread.message.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string
If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: array of object { file\_id, tools }
A list of files attached to the message, and the tools they were added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } or [RefusalContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: array of [FileCitationAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } or [FilePathAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
One of the following:
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file\_search" tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that's generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: number
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: number
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: object { reason }
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" or "max\_tokens" or "run\_cancelled" or 2 more
The reason the message is incomplete.
One of the following:
"content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
"run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
"run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
"run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" or "incomplete" or "completed"
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: string
The [thread](/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: "thread.message.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
object { data, event }
Occurs when a [message](/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string
If applicable, the ID of the [assistant](/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: array of object { file\_id, tools }
A list of files attached to the message, and the tools they were added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } or [RefusalContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlock object { text, type }
The text content that is part of a message.
text: [Text](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: array of [FileCitationAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } or [FilePathAnnotation](</api/reference/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
One of the following:
FileCitationAnnotation object { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file\_search" tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: object { file\_id }
file\_id: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
FilePathAnnotation object { end\_index, file\_path, start\_index, 2 more }
A URL for the file that's generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: object { file\_id }
file\_id: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
RefusalContentBlock object { refusal, type }
The refusal content generated by the assistant.
refusal: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: number
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: number
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: object { reason }
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" or "max\_tokens" or "run\_cancelled" or 2 more
The reason the message is incomplete.
One of the following:
"content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
"run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
"run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
"run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" or "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string
The ID of the [run](/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" or "incomplete" or "completed"
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
"in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: string
The [thread](/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: "thread.message.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
ErrorEvent object { data, event }
Occurs when an [error](/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/resources/$shared#(resource) $shared > (model) error_object > (schema)>) { code, message, param, type }
code: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) code>)
message: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) message>)
param: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) param>)
type: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: "error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
DoneEvent object { data, event }
Occurs when a stream ends.
data: "[DONE]"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24 > (property) data>)
event: "done"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 24>)
OBJECT### event
```
`{}`
```