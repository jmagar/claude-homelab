Runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Threads](/api/reference/typescript/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Runs
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
client.beta.threads.runs.list(stringthreadID, RunListParams { after, before, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more } \>
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
client.beta.threads.runs.create(stringthreadID, RunCreateParamsparams, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more } | Stream\<[AssistantStreamEvent](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)\>
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
client.beta.threads.runs.retrieve(stringrunID, RunRetrieveParams { thread\_id } params, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
client.beta.threads.runs.update(stringrunID, RunUpdateParams { thread\_id, metadata } params, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
client.beta.threads.runs.submitToolOutputs(stringrunID, RunSubmitToolOutputsParamsparams, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more } | Stream\<[AssistantStreamEvent](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)\>
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
client.beta.threads.runs.cancel(stringrunID, RunCancelParams { thread\_id } params, RequestOptionsoptions?): [Run](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) { id, assistant\_id, cancelled\_at, 24 more }
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
RequiredActionFunctionToolCall { id, function, type }
Tool call objects
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
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
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
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number | null
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: [RunStatus](</api/reference/typescript/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
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
RunStatus = "queued" | "in\_progress" | "requires\_action" | 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### RunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
client.beta.threads.runs.steps.list(stringrunID, StepListParams { thread\_id, after, before, 3 more } params, RequestOptionsoptions?): CursorPage\<[RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more } \>
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
client.beta.threads.runs.steps.retrieve(stringstepID, StepRetrieveParams { thread\_id, run\_id, include } params, RequestOptionsoptions?): [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter?: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input?: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs?: Array\<[CodeInterpreterLogs](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results?: Array\<Result\>
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
FunctionToolCallDelta { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function?: Function { arguments, name, output }
The definition of the function that was called.
arguments?: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name?: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output?: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
RunStep { id, assistant\_id, cancelled\_at, 13 more }
Represents a step in execution of a run.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
cancelled\_at: number | null
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
completed\_at: number | null
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
expired\_at: number | null
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
failed\_at: number | null
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
last\_error: LastError | null
The last error associated with this run step. Will be `null` if there are no errors.
code: "server\_error" | "rate\_limit\_exceeded"
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
object: "thread.run.step"
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
run\_id: string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
status: "in\_progress" | "cancelled" | "failed" | 2 more
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
"in\_progress"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
"cancelled"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
"completed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
"expired"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
step\_details: [MessageCreationStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>) { message\_creation, type } | [ToolCallsStepDetails](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>) { tool\_calls, type }
The details of the run step.
One of the following:
MessageCreationStepDetails { message\_creation, type }
Details of the message creation by the run step.
message\_creation: MessageCreation { message\_id }
message\_id: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results?: Array\<Result\>
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
thread\_id: string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
type: "message\_creation" | "tool\_calls"
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
"message\_creation"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
"tool\_calls"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
usage: Usage | null
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: number
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
RunStepDelta { step\_details }
The delta containing the fields that have changed on the run step.
step\_details?: [RunStepDeltaMessageDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>) { type, message\_creation } | [ToolCallDeltaObject](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>) { type, tool\_calls }
The details of the run step.
One of the following:
RunStepDeltaMessageDelta { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation?: MessageCreation { message\_id }
message\_id?: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
ToolCallDeltaObject { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls?: Array\<[ToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter?: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input?: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs?: Array\<[CodeInterpreterLogs](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function?: Function { arguments, name, output }
The definition of the function that was called.
arguments?: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name?: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output?: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
RunStepDeltaEvent { id, delta, object }
Represents a run step delta i.e. any changed fields on a run step during streaming.
id: string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
delta: [RunStepDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>) { step\_details }
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
object: "thread.run.step.delta"
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
RunStepDeltaMessageDelta { type, message\_creation }
Details of the message creation by the run step.
type: "message\_creation"
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
message\_creation?: MessageCreation { message\_id }
message\_id?: string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
RunStepInclude = "step\_details.tool\_calls[\*].file\_search.results[\*].content"
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
ToolCall = [CodeInterpreterToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>) { id, code\_interpreter, type } | [FileSearchToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>) { id, file\_search, type } | [FunctionToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>) { id, function, type }
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results?: Array\<Result\>
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
ToolCallDelta = [CodeInterpreterToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>) { index, type, id, code\_interpreter } | [FileSearchToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>) { file\_search, index, type, id } | [FunctionToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>) { index, type, id, function }
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter?: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input?: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs?: Array\<[CodeInterpreterLogs](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function?: Function { arguments, name, output }
The definition of the function that was called.
arguments?: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name?: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output?: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
ToolCallDeltaObject { type, tool\_calls }
Details of the tool call.
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
tool\_calls?: Array\<[ToolCallDelta](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCallDelta { index, type, id, code\_interpreter }
Details of the Code Interpreter tool call the run step was involved in.
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
code\_interpreter?: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input?: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
outputs?: Array\<[CodeInterpreterLogs](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>) { index, type, logs } | [CodeInterpreterOutputImage](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>) { index, type, image } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
CodeInterpreterLogs { index, type, logs }
Text output from the Code Interpreter tool call as part of a run step.
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
logs?: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
CodeInterpreterOutputImage { index, type, image }
index: number
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
image?: Image { file\_id }
file\_id?: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
FileSearchToolCallDelta { file\_search, index, type, id }
file\_search: unknown
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
FunctionToolCallDelta { index, type, id, function }
index: number
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
id?: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
function?: Function { arguments, name, output }
The definition of the function that was called.
arguments?: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
name?: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
output?: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
ToolCallsStepDetails { tool\_calls, type }
Details of the tool call.
tool\_calls: Array\<[ToolCall](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\>
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterToolCall { id, code\_interpreter, type }
Details of the Code Interpreter tool call the run step was involved in.
id: string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
code\_interpreter: CodeInterpreter { input, outputs }
The Code Interpreter tool call definition.
input: string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
outputs: Array\<Logs { logs, type } | Image { image, type } \>
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
Logs { logs, type }
Text output from the Code Interpreter tool call as part of a run step.
logs: string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
Image { image, type }
image: Image { file\_id }
file\_id: string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
type: "image"
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
type: "code\_interpreter"
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
FileSearchToolCall { id, file\_search, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
file\_search: FileSearch { ranking\_options, results }
For now, this is always going to be an empty object.
ranking\_options?: RankingOptions { ranker, score\_threshold }
The ranking options for the file search.
ranker: "auto" | "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
results?: Array\<Result\>
The results of the file search.
file\_id: string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
file\_name: string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
score: number
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
content?: Array\<Content\>
The content of the result that was found. The content is only included if requested via the include query parameter.
text?: string
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
type?: "text"
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
type: "file\_search"
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
FunctionToolCall { id, function, type }
id: string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
function: Function { arguments, name, output }
The definition of the function that was called.
arguments: string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
output: string | null
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
type: "tool\_calls"
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)