List run steps | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Threads](/api/reference/java/resources/beta/subresources/threads)
[Runs](/api/reference/java/resources/beta/subresources/threads/subresources/runs)
[Steps](/api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List run steps
Deprecated: The Assistants API is deprecated in favor of the Responses API
StepListPage beta().threads().runs().steps().list(StepListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}/steps
Returns a list of run steps belonging to a run.
##### ParametersExpand Collapse
StepListParams params
String threadId
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) thread_id > (schema)>)
Optional\<String\> runId
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) run_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) after > (schema)>)
Optional\<String\> before
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) before > (schema)>)
Optional\<List\<[RunStepInclude](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)\>\> include
A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
STEP\_DETAILS\_TOOL\_CALLS\_FILE\_SEARCH\_RESULTS\_CONTENT("step\_details.tool\_calls[\*].file\_search.results[\*].content")
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema) > (member) 0>)
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) include > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
ASC("asc")
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) beta.threads.runs.steps > (method) list > (params) default>)
##### ReturnsExpand Collapse
class RunStep:
Represents a step in execution of a run.
String id
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
String assistantId
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
Optional\<Long\> cancelledAt
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
long createdAt
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
Optional\<Long\> expiredAt
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
Optional\<Long\> failedAt
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
Optional\<LastError\> lastError
The last error associated with this run step. Will be `null` if there are no errors.
Code code
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
SERVER\_ERROR("server\_error")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
RATE\_LIMIT\_EXCEEDED("rate\_limit\_exceeded")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
String message
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
JsonValue; object\_ "thread.run.step"constant"thread.run.step"constant
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
String runId
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status status
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
CANCELLED("cancelled")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
FAILED("failed")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
COMPLETED("completed")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
EXPIRED("expired")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails stepDetails
The details of the run step.
One of the following:
class MessageCreationStepDetails:
Details of the message creation by the run step.
MessageCreation messageCreation
String messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
class ToolCallsStepDetails:
Details of the tool call.
List\<[ToolCall](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCall:
Details of the Code Interpreter tool call the run step was involved in.
String id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter codeInterpreter
The Code Interpreter tool call definition.
String input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
List\<Output\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class LogsOutput:
Text output from the Code Interpreter tool call as part of a run step.
String logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
class ImageOutput:
Image image
String fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
class FileSearchToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch fileSearch
For now, this is always going to be an empty object.
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search.
Ranker ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Optional\<List\<Result\>\> results
The results of the file search.
String fileId
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
String fileName
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
double score
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Optional\<List\<Content\>\> content
The content of the result that was found. The content is only included if requested via the include query parameter.
Optional\<String\> text
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Optional\<Type\> type
The type of the content.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
class FunctionToolCall:
String id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function function
The definition of the function that was called.
String arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
String threadId
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type type
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
MESSAGE\_CREATION("message\_creation")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
TOOL\_CALLS("tool\_calls")
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Optional\<Usage\> usage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
long completionTokens
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
long promptTokens
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
long totalTokens
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
### List run steps
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.beta.threads.runs.steps.StepListPage;
import com.openai.models.beta.threads.runs.steps.StepListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
StepListParams params = StepListParams.builder()
.threadId("thread\_id")
.runId("run\_id")
.build();
StepListPage page = client.beta().threads().runs().steps().list(params);
}
}`
```
```
`{
"object": "list",
"data": [
{
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
],
"first\_id": "step\_abc123",
"last\_id": "step\_abc456",
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
],
"first\_id": "step\_abc123",
"last\_id": "step\_abc456",
"has\_more": false
}
`
```