Retrieve run step | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Threads](/api/reference/typescript/resources/beta/subresources/threads)
[Runs](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs)
[Steps](/api/reference/typescript/resources/beta/subresources/threads/subresources/runs/subresources/steps)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve run step
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.beta.threads.runs.steps.retrieve(stringstepID, StepRetrieveParams { thread\_id, run\_id, include } params, RequestOptionsoptions?): [RunStep](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) { id, assistant\_id, cancelled\_at, 13 more }
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
Retrieves a run step.
##### ParametersExpand Collapse
stepID: string
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) step_id > (schema)>)
params: StepRetrieveParams { thread\_id, run\_id, include }
thread\_id: string
Path param: The ID of the thread to which the run and run step belongs.
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) thread_id>)
run\_id: string
Path param: The ID of the run to which the run step belongs.
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) run_id>)
include?: Array\<[RunStepInclude](</api/reference/typescript/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>) { } \>
Query param: A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default > (param) include>)
[](<#(resource) beta.threads.runs.steps > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
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
### Retrieve run step
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
const runStep = await openai.beta.threads.runs.steps.retrieve(
"step\_abc123",
{ thread\_id: "thread\_abc123", run\_id: "run\_abc123" }
);
console.log(runStep);
}
main();
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