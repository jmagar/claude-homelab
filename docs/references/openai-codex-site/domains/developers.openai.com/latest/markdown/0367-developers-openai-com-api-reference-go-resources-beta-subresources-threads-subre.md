Runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Runs
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
client.Beta.Threads.Runs.List(ctx, threadID, query) (\*CursorPage[[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)], error)
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
client.Beta.Threads.Runs.New(ctx, threadID, params) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
client.Beta.Threads.Runs.Get(ctx, threadID, runID) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
client.Beta.Threads.Runs.Update(ctx, threadID, runID, body) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
client.Beta.Threads.Runs.SubmitToolOutputs(ctx, threadID, runID, body) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
client.Beta.Threads.Runs.Cancel(ctx, threadID, runID) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
type RequiredActionFunctionToolCall struct{…}
Tool call objects
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
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
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
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
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
type RunStatus string
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### RunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/go/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
client.Beta.Threads.Runs.Steps.List(ctx, threadID, runID, query) (\*CursorPage[[RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)], error)
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/go/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
client.Beta.Threads.Runs.Steps.Get(ctx, threadID, runID, stepID, query) (\*[RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>), error)
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type RunStep struct{…}
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
type RunStepDelta struct{…}
The delta containing the fields that have changed on the run step.
StepDetails RunStepDeltaStepDetailsUnionOptional
The details of the run step.
One of the following:
type RunStepDeltaMessageDelta struct{…}
Details of the message creation by the run step.
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
MessageCreation RunStepDeltaMessageDeltaMessageCreationOptional
MessageID stringOptional
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
type ToolCallDeltaObject struct{…}
Details of the tool call.
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
ToolCalls [][ToolCallDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)Optional
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
type RunStepDeltaEvent struct{…}
Represents a run step delta i.e. any changed fields on a run step during streaming.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
Delta [RunStepDelta](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
Object ThreadRunStepDelta
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
type RunStepDeltaMessageDelta struct{…}
Details of the message creation by the run step.
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
MessageCreation RunStepDeltaMessageDeltaMessageCreationOptional
MessageID stringOptional
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
type RunStepInclude string
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
type ToolCallUnion interface{…}
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
type ToolCallDeltaUnion interface{…}
Details of the Code Interpreter tool call the run step was involved in.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
type ToolCallDeltaObject struct{…}
Details of the tool call.
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
ToolCalls [][ToolCallDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)Optional
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)