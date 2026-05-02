Retrieve run step | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
[Runs](/api/reference/go/resources/beta/subresources/threads/subresources/runs)
[Steps](/api/reference/go/resources/beta/subresources/threads/subresources/runs/subresources/steps)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve run step
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.Beta.Threads.Runs.Steps.Get(ctx, threadID, runID, stepID, query) (\*[RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>), error)
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
Retrieves a run step.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) thread_id > (schema)>)
runID string
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) run_id > (schema)>)
stepID string
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) step_id > (schema)>)
query BetaThreadRunStepGetParams
Include param.Field[[][RunStepInclude](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)]Optional
A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
const RunStepIncludeStepDetailsToolCallsFileSearchResultsContent [RunStepInclude](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>) = "step\_details.tool\_calls[\*].file\_search.results[\*].content"
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema) > (member) 0>)
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) include>)
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
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
### Retrieve run step
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
runStep, err := client.Beta.Threads.Runs.Steps.Get(
context.TODO(),
"thread\_id",
"run\_id",
"step\_id",
openai.BetaThreadRunStepGetParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", runStep.ID)
}
`
```
```
`{
"id": "step\_abc123",
"object": "thread.run.step",
"created\_at": 1699063291,
"run\_id": "run\_abc123",
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"type": "message\_creation",
"status": "completed",
"cancelled\_at": null,
"completed\_at": 1699063291,
"expired\_at": null,
"failed\_at": null,
"last\_error": null,
"step\_details": {
"type": "message\_creation",
"message\_creation": {
"message\_id": "msg\_abc123"
}
},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
}
}
`
```
##### Returns Examples
```
`{
"id": "step\_abc123",
"object": "thread.run.step",
"created\_at": 1699063291,
"run\_id": "run\_abc123",
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"type": "message\_creation",
"status": "completed",
"cancelled\_at": null,
"completed\_at": 1699063291,
"expired\_at": null,
"failed\_at": null,
"last\_error": null,
"step\_details": {
"type": "message\_creation",
"message\_creation": {
"message\_id": "msg\_abc123"
}
},
"usage": {
"prompt\_tokens": 123,
"completion\_tokens": 456,
"total\_tokens": 579
}
}
`
```