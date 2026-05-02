List runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
[Runs](/api/reference/go/resources/beta/subresources/threads/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List runs
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.Beta.Threads.Runs.List(ctx, threadID, query) (\*CursorPage[[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)], error)
GET/threads/{thread\_id}/runs
Returns a list of runs belonging to a thread.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) thread_id > (schema)>)
query BetaThreadRunListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) after>)
Before param.Field[string]Optional
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) before>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) limit>)
Order param.Field[[BetaThreadRunListParamsOrder](</api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/list#(resource) beta.threads.runs > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
const BetaThreadRunListParamsOrderAsc [BetaThreadRunListParamsOrder](</api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/list#(resource) beta.threads.runs > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const BetaThreadRunListParamsOrderDesc [BetaThreadRunListParamsOrder](</api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/list#(resource) beta.threads.runs > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.threads.runs > (method) list > (params) default > (param) order>)
[](<#(resource) beta.threads.runs > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Run struct{…}
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Strict boolOptional
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
### List runs
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
page, err := client.Beta.Threads.Runs.List(
context.TODO(),
"thread\_id",
openai.BetaThreadRunListParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699075072,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "completed",
"started\_at": 1699075072,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699075073,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"file-abc123",
"file-abc456"
]
}
},
"metadata": {},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
},
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
},
{
"id": "run\_abc456",
"object": "thread.run",
"created\_at": 1699063290,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "completed",
"started\_at": 1699063290,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699063291,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"file-abc123",
"file-abc456"
]
}
},
"metadata": {},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
},
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
],
"first\_id": "run\_abc123",
"last\_id": "run\_abc456",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699075072,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "completed",
"started\_at": 1699075072,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699075073,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"file-abc123",
"file-abc456"
]
}
},
"metadata": {},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
},
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
},
{
"id": "run\_abc456",
"object": "thread.run",
"created\_at": 1699063290,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "completed",
"started\_at": 1699063290,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699063291,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"file-abc123",
"file-abc456"
]
}
},
"metadata": {},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
},
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
],
"first\_id": "run\_abc123",
"last\_id": "run\_abc456",
"has\_more": false
}
`
```