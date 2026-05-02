Steps | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Beta](/api/reference/terraform/resources/beta)
[Threads](/api/reference/terraform/resources/beta/subresources/threads)
[Runs](/api/reference/terraform/resources/beta/subresources/threads/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Steps
Build Assistants that can call models and use tools.
#### data openai\_beta\_thread\_run\_step
##### required Expand Collapse
run\_id: String
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) run_id>)
step\_id: String
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_id>)
thread\_id: String
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) thread_id>)
##### optional Expand Collapse
include?: List[String]
A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) include>)
##### computed Expand Collapse
assistant\_id: String
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) assistant_id>)
cancelled\_at: Int64
The Unix timestamp (in seconds) for when the run step was cancelled.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) cancelled_at>)
completed\_at: Int64
The Unix timestamp (in seconds) for when the run step completed.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) completed_at>)
created\_at: Int64
The Unix timestamp (in seconds) for when the run step was created.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) created_at>)
expired\_at: Int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) expired_at>)
failed\_at: Int64
The Unix timestamp (in seconds) for when the run step failed.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) failed_at>)
id: String
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) id>)
object: String
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) object>)
status: String
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) status>)
type: String
The type of run step, which can be either `message\_creation` or `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) type>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) metadata>)
last\_error: Attributes
The last error associated with this run step. Will be `null` if there are no errors.
code: String
One of `server\_error` or `rate\_limit\_exceeded`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) last_error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) last_error > (attribute) message>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) last_error>)
step\_details: Attributes
The details of the run step.
message\_creation: Attributes
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) message_creation > (attribute) message_id>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) message_creation>)
type: String
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) type>)
tool\_calls: List[Attributes]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) id>)
code\_interpreter: Attributes
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) input>)
outputs: List[Attributes]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) logs>)
type: String
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) type>)
image: Attributes
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) image > (attribute) file_id>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) image>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter>)
type: String
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) type>)
file\_search: Attributes
For now, this is always going to be an empty object.
ranking\_options: Attributes
The ranking options for the file search.
ranker: String
The ranker to use for the file search. If not specified will use the `auto` ranker.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options>)
results: List[Attributes]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) file_name>)
score: Float64
The score of the result. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) score>)
content: List[Attributes]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content > (attribute) text>)
type: String
The type of the content.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content > (attribute) type>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) file_search>)
function: Attributes
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) output>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls > (attribute) function>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details > (attribute) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) step_details>)
usage: Attributes
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: Int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-single) > (attribute) usage>)
### openai\_beta\_thread\_run\_step
Terraform
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
`data "openai\_beta\_thread\_run\_step" "example\_beta\_thread\_run\_step" {
thread\_id = "thread\_id"
run\_id = "run\_id"
step\_id = "step\_id"
include = ["step\_details.tool\_calls[\*].file\_search.results[\*].content"]
}
`
```
#### data openai\_beta\_thread\_run\_steps
##### required Expand Collapse
run\_id: String
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) run_id>)
thread\_id: String
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) thread_id>)
##### optional Expand Collapse
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) before>)
include?: List[String]
A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) include>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) id>)
assistant\_id: String
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) assistant_id>)
cancelled\_at: Int64
The Unix timestamp (in seconds) for when the run step was cancelled.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) cancelled_at>)
completed\_at: Int64
The Unix timestamp (in seconds) for when the run step completed.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) completed_at>)
created\_at: Int64
The Unix timestamp (in seconds) for when the run step was created.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
expired\_at: Int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) expired_at>)
failed\_at: Int64
The Unix timestamp (in seconds) for when the run step failed.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) failed_at>)
last\_error: Attributes
The last error associated with this run step. Will be `null` if there are no errors.
code: String
One of `server\_error` or `rate\_limit\_exceeded`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) last_error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) last_error > (attribute) message>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) last_error>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
object: String
The object type, which is always `thread.run.step`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) object>)
run\_id: String
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) run_id>)
status: String
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) status>)
step\_details: Attributes
The details of the run step.
message\_creation: Attributes
message\_id: String
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) message_creation > (attribute) message_id>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) message_creation>)
type: String
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) type>)
tool\_calls: List[Attributes]
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
id: String
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) id>)
code\_interpreter: Attributes
The Code Interpreter tool call definition.
input: String
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) input>)
outputs: List[Attributes]
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
logs: String
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) logs>)
type: String
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) type>)
image: Attributes
file\_id: String
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) image > (attribute) file_id>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs > (attribute) image>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter > (attribute) outputs>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) code_interpreter>)
type: String
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) type>)
file\_search: Attributes
For now, this is always going to be an empty object.
ranking\_options: Attributes
The ranking options for the file search.
ranker: String
The ranker to use for the file search. If not specified will use the `auto` ranker.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) ranking_options>)
results: List[Attributes]
The results of the file search.
file\_id: String
The ID of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) file_id>)
file\_name: String
The name of the file that result was found in.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) file_name>)
score: Float64
The score of the result. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) score>)
content: List[Attributes]
The content of the result that was found. The content is only included if requested via the include query parameter.
text: String
The text content of the file.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content > (attribute) text>)
type: String
The type of the content.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content > (attribute) type>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results > (attribute) content>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search > (attribute) results>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) file_search>)
function: Attributes
The definition of the function that was called.
arguments: String
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) arguments>)
name: String
The name of the function.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) name>)
output: String
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) function > (attribute) output>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls > (attribute) function>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details > (attribute) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) step_details>)
thread\_id: String
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) thread_id>)
type: String
The type of run step, which can be either `message\_creation` or `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) type>)
usage: Attributes
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
completion\_tokens: Int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items > (attribute) usage>)
[](<#(resource) beta.threads.runs.steps > (terraform datasource-plural) > (attribute) items>)
### openai\_beta\_thread\_run\_steps
Terraform
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
`data "openai\_beta\_thread\_run\_steps" "example\_beta\_thread\_run\_steps" {
thread\_id = "thread\_id"
run\_id = "run\_id"
before = "before"
include = ["step\_details.tool\_calls[\*].file\_search.results[\*].content"]
}
`
```