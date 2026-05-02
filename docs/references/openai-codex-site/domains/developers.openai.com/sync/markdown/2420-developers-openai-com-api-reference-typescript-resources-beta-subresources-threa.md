Submit tool outputs to run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Threads](/api/reference/typescript/resources/beta/subresources/threads)
[Runs](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Submit tool outputs to run
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.beta.threads.runs.submitToolOutputs(stringrunID, RunSubmitToolOutputsParamsparams, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more } | Stream\<[AssistantStreamEvent](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)\>
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
When a run has the `status: "requires\_action"` and `required\_action.type` is `submit\_tool\_outputs`, this endpoint can be used to submit the outputs from the tool calls once they’re all completed. All outputs must be submitted in a single request.
##### ParametersExpand Collapse
runID: string
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) run_id > (schema)>)
RunSubmitToolOutputsParams = RunSubmitToolOutputsParamsNonStreaming { stream } | RunSubmitToolOutputsParamsStreaming { stream }
RunSubmitToolOutputsParamsBase { thread\_id, tool\_outputs, stream }
thread\_id: string
Path param: The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) to which this run belongs.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) thread_id>)
tool\_outputs: Array\<ToolOutput\>
Body param: A list of tools for which the outputs are being submitted.
output?: string
The output of the tool call to be submitted to continue the run.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) tool_outputs > (schema) > (items) > (property) output>)
tool\_call\_id?: string
The ID of the tool call in the `required\_action` object within the run object the output is being submitted for.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) tool_outputs > (schema) > (items) > (property) tool_call_id>)
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) tool_outputs>)
stream?: false | null
Body param: If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) stream>)
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs.typescript.base_params>)
RunSubmitToolOutputsParamsNonStreaming extends RunSubmitToolOutputsParamsBase { thread\_id, tool\_outputs, stream } { stream }
stream?: false | null
Body param: If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming > (param) stream>)
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.non_streaming>)
RunSubmitToolOutputsParamsStreaming extends RunSubmitToolOutputsParamsBase { thread\_id, tool\_outputs, stream } { stream }
stream: true
Body param: If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.streaming > (param) stream>)
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs > (params) default.streaming>)
[](<#(resource) beta.threads.runs > (method) submit_tool_outputs.typescript.params>)
##### ReturnsExpand Collapse
Run { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
AssistantStreamEvent = ThreadCreated { data, event, enabled } | ThreadRunCreated { data, event } | ThreadRunQueued { data, event } | 21 more
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
in your code. See the [Assistants API quickstart](https://platform.openai.com/docs/assistants/overview) to learn how to
integrate the Assistants API with streaming.
One of the following:
ThreadCreated { data, event, enabled }
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: "thread"
The object type, which is always `thread`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: ToolResources | null
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter?: CodeInterpreter { file\_ids }
file\_ids?: Array\<string\>
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search?: FileSearch { vector\_store\_ids }
vector\_store\_ids?: Array\<string\>
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: "thread.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled?: boolean
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
ThreadRunCreated { data, event }
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: "thread.run.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
ThreadRunQueued { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: "thread.run.queued"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
ThreadRunInProgress { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: "thread.run.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
ThreadRunRequiresAction { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: "thread.run.requires\_action"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
ThreadRunCompleted { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: "thread.run.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
ThreadRunIncomplete { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: "thread.run.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
ThreadRunFailed { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: "thread.run.failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
ThreadRunCancelling { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: "thread.run.cancelling"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
ThreadRunCancelled { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: "thread.run.cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
ThreadRunExpired { data, event }
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number | null
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: IncompleteDetails | null
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason?: "max\_completion\_tokens" | "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: LastError | null
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt"
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
max\_completion\_tokens: number | null
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number | null
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: RequiredAction | null
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: SubmitToolOutputs { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: Array\<[RequiredActionFunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type } \>
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
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
response\_format: [AssistantResponseFormatOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>) | null
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0 > (member) 0>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
json\_schema: JSONSchema { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema?: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>) | null
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" | "auto" | "required"
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" | "code\_interpreter" | "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function?: [AssistantToolChoiceFunction](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: Array\<[AssistantTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search?: FileSearch { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results?: number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options?: RankingOptions { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker?: "auto" | "default\_2024\_08\_21"
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
FunctionTool { function, type }
function: [FunctionDefinition](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description?: string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters?: [FunctionParameters](</api/reference/typescript/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: TruncationStrategy | null
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" | "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages?: number | null
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: Usage | null
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
temperature?: number | null
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p?: number | null
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: "thread.run.expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
ThreadRunStepCreated { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadRunStepInProgress { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadRunStepDelta { data, event }
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>) { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: [RunStepDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>) { step\_details }
The delta containing the fields that have changed on the run step.
step\_details?: [RunStepDeltaMessageDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>) { type, message\_creation } | [ToolCallDeltaObject](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>) { type, tool\_calls }
The details of the run step.
One of the following:
RunStepDeltaMessageDelta { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation?: MessageCreation { message\_id }
message\_id?: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
ToolCallDeltaObject { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls?: Array\<[ToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter?: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input?: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs?: Array\<[CodeInterpreterLogs](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function?: Function { arguments, name, output }
The definition of the function that was called.
arguments?: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name?: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output?: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: "thread.run.step.delta"
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: "thread.run.step.delta"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
ThreadRunStepCompleted { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadRunStepFailed { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadRunStepCancelled { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadRunStepExpired { data, event }
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
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
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
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
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
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
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
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
results?: Array\<Result\>
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
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
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
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
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
ThreadMessageCreated { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string | null
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array\<Attachment\> | null
A list of files attached to the message, and the tools they were added to.
file\_id?: string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools?: Array\<[CodeInterpreterTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly { type } \>
The tools to add this file to.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
AssistantToolsFileSearchTypeOnly { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array\<[MessageContent](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\>
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail?: "auto" | "low" | "high"
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
ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail?: "auto" | "low" | "high"
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
TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: Array\<[Annotation](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\>
One of the following:
FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation { file\_id }
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
FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath { file\_id }
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
RefusalContentBlock { refusal, type }
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
incomplete\_at: number | null
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails | null
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" | "max\_tokens" | "run\_cancelled" | 2 more
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" | "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string | null
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" | "incomplete" | "completed"
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
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: "thread.message.created"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
ThreadMessageInProgress { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string | null
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array\<Attachment\> | null
A list of files attached to the message, and the tools they were added to.
file\_id?: string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools?: Array\<[CodeInterpreterTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly { type } \>
The tools to add this file to.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
AssistantToolsFileSearchTypeOnly { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array\<[MessageContent](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\>
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail?: "auto" | "low" | "high"
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
ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail?: "auto" | "low" | "high"
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
TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: Array\<[Annotation](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\>
One of the following:
FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation { file\_id }
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
FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath { file\_id }
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
RefusalContentBlock { refusal, type }
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
incomplete\_at: number | null
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails | null
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" | "max\_tokens" | "run\_cancelled" | 2 more
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" | "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string | null
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" | "incomplete" | "completed"
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
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: "thread.message.in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
ThreadMessageDelta { data, event }
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>) { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
id: string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) { content, role }
The delta containing the fields that have changed on the Message.
content?: Array\<[MessageContentDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)\>
The content of the message in array of text and/or images.
One of the following:
ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file?: [ImageFileDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
detail?: "auto" | "low" | "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id?: string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text?: [TextDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
annotations?: Array\<[AnnotationDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)\>
One of the following:
FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: "file\_citation"
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index?: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation?: FileCitation { file\_id, quote }
file\_id?: string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote?: string
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index?: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text?: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: number
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: "file\_path"
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index?: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path?: FilePath { file\_id }
file\_id?: string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index?: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text?: string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value?: string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema)>)
RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: number
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: "refusal"
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal?: string
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: number
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: "image\_url"
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url?: [ImageURLDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
detail?: "auto" | "low" | "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url?: string
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role?: "user" | "assistant"
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
ThreadMessageCompleted { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string | null
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array\<Attachment\> | null
A list of files attached to the message, and the tools they were added to.
file\_id?: string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools?: Array\<[CodeInterpreterTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly { type } \>
The tools to add this file to.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
AssistantToolsFileSearchTypeOnly { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array\<[MessageContent](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\>
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail?: "auto" | "low" | "high"
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
ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail?: "auto" | "low" | "high"
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
TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: Array\<[Annotation](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\>
One of the following:
FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation { file\_id }
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
FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath { file\_id }
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
RefusalContentBlock { refusal, type }
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
incomplete\_at: number | null
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails | null
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" | "max\_tokens" | "run\_cancelled" | 2 more
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" | "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string | null
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" | "incomplete" | "completed"
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
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: "thread.message.completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
ThreadMessageIncomplete { data, event }
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: string | null
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array\<Attachment\> | null
A list of files attached to the message, and the tools they were added to.
file\_id?: string
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools?: Array\<[CodeInterpreterTool](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly { type } \>
The tools to add this file to.
One of the following:
CodeInterpreterTool { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
AssistantToolsFileSearchTypeOnly { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array\<[MessageContent](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\>
The content of the message in array of text and/or images.
One of the following:
ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail?: "auto" | "low" | "high"
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
ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail?: "auto" | "low" | "high"
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
TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: Array\<[Annotation](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\>
One of the following:
FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation { file\_id }
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
FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: number
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath { file\_id }
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
RefusalContentBlock { refusal, type }
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
incomplete\_at: number | null
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails | null
On an incomplete message, details about why the message is incomplete.
reason: "content\_filter" | "max\_tokens" | "run\_cancelled" | 2 more
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
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: "thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: "user" | "assistant"
The entity that produced the message. One of `user` or `assistant`.
One of the following:
"user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: string | null
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: "in\_progress" | "incomplete" | "completed"
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
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: "thread.message.incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
ErrorEvent { data, event }
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/typescript/resources/$shared#(resource) $shared > (model) error_object > (schema)>) { code, message, param, type }
code: string | null
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) code>)
message: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) message>)
param: string | null
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) param>)
type: string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: "error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
DefaultStreaming
### Submit tool outputs to run
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
async function main() {
const run = await openai.beta.threads.runs.submitToolOutputs(
"run\_123",
{
thread\_id: "thread\_123",
tool\_outputs: [
{
tool\_call\_id: "call\_001",
output: "70 degrees and sunny.",
},
],
}
);
console.log(run);
}
main();
`
```
```
`{
"id": "run\_123",
"object": "thread.run",
"created\_at": 1699075592,
"assistant\_id": "asst\_123",
"thread\_id": "thread\_123",
"status": "queued",
"started\_at": 1699075592,
"expires\_at": 1699076192,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": null,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"tools": [
{
"type": "function",
"function": {
"name": "get\_current\_weather",
"description": "Get the current weather in a given location",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA"
},
"unit": {
"type": "string",
"enum": ["celsius", "fahrenheit"]
}
},
"required": ["location"]
}
}
}
],
"metadata": {},
"usage": null,
"temperature": 1.0,
"top\_p": 1.0,
"max\_prompt\_tokens": 1000,
"max\_completion\_tokens": 1000,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```
### Submit tool outputs to run
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
async function main() {
const stream = await openai.beta.threads.runs.submitToolOutputs(
"run\_123",
{
thread\_id: "thread\_123",
tool\_outputs: [
{
tool\_call\_id: "call\_001",
output: "70 degrees and sunny.",
},
],
}
);
for await (const event of stream) {
console.log(event);
}
}
main();
`
```
```
`event: thread.run.step.completed
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710352449,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"tool\_calls","status":"completed","cancelled\_at":null,"completed\_at":1710352475,"expires\_at":1710353047,"failed\_at":null,"last\_error":null,"step\_details":{"type":"tool\_calls","tool\_calls":[{"id":"call\_iWr0kQ2EaYMaxNdl0v3KYkx7","type":"function","function":{"name":"get\_current\_weather","arguments":"{\\"location\\":\\"San Francisco, CA\\",\\"unit\\":\\"fahrenheit\\"}","output":"70 degrees and sunny."}}]},"usage":{"prompt\_tokens":291,"completion\_tokens":24,"total\_tokens":315}}
event: thread.run.queued
data: {"id":"run\_123","object":"thread.run","created\_at":1710352447,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"queued","started\_at":1710352448,"expires\_at":1710353047,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: thread.run.in\_progress
data: {"id":"run\_123","object":"thread.run","created\_at":1710352447,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"in\_progress","started\_at":1710352475,"expires\_at":1710353047,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: thread.run.step.created
data: {"id":"step\_002","object":"thread.run.step","created\_at":1710352476,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710353047,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_002"}},"usage":null}
event: thread.run.step.in\_progress
data: {"id":"step\_002","object":"thread.run.step","created\_at":1710352476,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710353047,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_002"}},"usage":null}
event: thread.message.created
data: {"id":"msg\_002","object":"thread.message","created\_at":1710352476,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"in\_progress","incomplete\_details":null,"incomplete\_at":null,"completed\_at":null,"role":"assistant","content":[],"metadata":{}}
event: thread.message.in\_progress
data: {"id":"msg\_002","object":"thread.message","created\_at":1710352476,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"in\_progress","incomplete\_details":null,"incomplete\_at":null,"completed\_at":null,"role":"assistant","content":[],"metadata":{}}
event: thread.message.delta
data: {"id":"msg\_002","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":"The","annotations":[]}}]}}
event: thread.message.delta
data: {"id":"msg\_002","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":" current"}}]}}
event: thread.message.delta
data: {"id":"msg\_002","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":" weather"}}]}}
...
event: thread.message.delta
data: {"id":"msg\_002","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":" sunny"}}]}}
event: thread.message.delta
data: {"id":"msg\_002","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":"."}}]}}
event: thread.message.completed
data: {"id":"msg\_002","object":"thread.message","created\_at":1710352476,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"completed","incomplete\_details":null,"incomplete\_at":null,"completed\_at":1710352477,"role":"assistant","content":[{"type":"text","text":{"value":"The current weather in San Francisco, CA is 70 degrees Fahrenheit and sunny.","annotations":[]}}],"metadata":{}}
event: thread.run.step.completed
data: {"id":"step\_002","object":"thread.run.step","created\_at":1710352476,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"completed","cancelled\_at":null,"completed\_at":1710352477,"expires\_at":1710353047,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_002"}},"usage":{"prompt\_tokens":329,"completion\_tokens":18,"total\_tokens":347}}
event: thread.run.completed
data: {"id":"run\_123","object":"thread.run","created\_at":1710352447,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"completed","started\_at":1710352475,"expires\_at":null,"cancelled\_at":null,"failed\_at":null,"completed\_at":1710352477,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":{"prompt\_tokens":20,"completion\_tokens":11,"total\_tokens":31},"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: done
data: [DONE]
`
```
##### Returns Examples
```
`{
"id": "run\_123",
"object": "thread.run",
"created\_at": 1699075592,
"assistant\_id": "asst\_123",
"thread\_id": "thread\_123",
"status": "queued",
"started\_at": 1699075592,
"expires\_at": 1699076192,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": null,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"tools": [
{
"type": "function",
"function": {
"name": "get\_current\_weather",
"description": "Get the current weather in a given location",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA"
},
"unit": {
"type": "string",
"enum": ["celsius", "fahrenheit"]
}
},
"required": ["location"]
}
}
}
],
"metadata": {},
"usage": null,
"temperature": 1.0,
"top\_p": 1.0,
"max\_prompt\_tokens": 1000,
"max\_completion\_tokens": 1000,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```