Threads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Threads
Build Assistants that can call models and use tools.
##### [Create thread](/api/reference/java/resources/beta/subresources/threads/methods/create)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().create(ThreadCreateParamsparams = ThreadCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/threads
##### [Create thread and run](/api/reference/java/resources/beta/subresources/threads/methods/create_and_run)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().createAndRun(ThreadCreateAndRunParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/runs
##### [Retrieve thread](/api/reference/java/resources/beta/subresources/threads/methods/retrieve)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().retrieve(ThreadRetrieveParamsparams = ThreadRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}
##### [Modify thread](/api/reference/java/resources/beta/subresources/threads/methods/update)
Deprecated
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().update(ThreadUpdateParamsparams = ThreadUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}
##### [Delete thread](/api/reference/java/resources/beta/subresources/threads/methods/delete)
Deprecated
[ThreadDeleted](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) beta().threads().delete(ThreadDeleteParamsparams = ThreadDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}
##### ModelsExpand Collapse
class AssistantResponseFormatOption: A class that can be one of several variants.union
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
JsonValue;
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
class AssistantToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type type
The type of the tool. If type is `function`, the function name must be set
One of the following:
FUNCTION("function")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
CODE\_INTERPRETER("code\_interpreter")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
FILE\_SEARCH("file\_search")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Optional\<[AssistantToolChoiceFunction](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)\> function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
class AssistantToolChoiceFunction:
String name
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)
class AssistantToolChoiceOption: A class that can be one of several variants.union
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
Auto
One of the following:
NONE("none")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
AUTO("auto")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
REQUIRED("required")
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
class AssistantToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type type
The type of the tool. If type is `function`, the function name must be set
One of the following:
FUNCTION("function")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
CODE\_INTERPRETER("code\_interpreter")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
FILE\_SEARCH("file\_search")
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Optional\<[AssistantToolChoiceFunction](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)\> function
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
class Thread:
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
JsonValue; object\_ "thread"constant"thread"constant
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
Optional\<ToolResources\> toolResources
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
class ThreadDeleted:
String id
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.deleted"constant"thread.deleted"constant
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
#### ThreadsRuns
Build Assistants that can call models and use tools.
##### [List runs](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/list)
Deprecated
RunListPage beta().threads().runs().list(RunListParamsparams = RunListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs
##### [Create run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/create)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().create(RunCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs
##### [Retrieve run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/retrieve)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().retrieve(RunRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}
##### [Modify run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/update)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().update(RunUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}
##### [Submit tool outputs to run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/submit_tool_outputs)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().submitToolOutputs(RunSubmitToolOutputsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}/submit\_tool\_outputs
##### [Cancel a run](/api/reference/java/resources/beta/subresources/threads/subresources/runs/methods/cancel)
Deprecated
[Run](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>) beta().threads().runs().cancel(RunCancelParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/runs/{run\_id}/cancel
##### ModelsExpand Collapse
class RequiredActionFunctionToolCall:
Tool call objects
String id
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function function
The function definition.
String arguments
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
class Run:
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
String assistantId
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
Optional\<Long\> cancelledAt
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
long createdAt
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
Optional\<Long\> failedAt
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
Optional\<IncompleteDetails\> incompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Optional\<Reason\> reason
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
MAX\_COMPLETION\_TOKENS("max\_completion\_tokens")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
MAX\_PROMPT\_TOKENS("max\_prompt\_tokens")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
String instructions
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
Optional\<LastError\> lastError
The last error associated with this run. Will be `null` if there are no errors.
Code code
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
SERVER\_ERROR("server\_error")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
RATE\_LIMIT\_EXCEEDED("rate\_limit\_exceeded")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
INVALID\_PROMPT("invalid\_prompt")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
String message
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
Optional\<Long\> maxCompletionTokens
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
Optional\<Long\> maxPromptTokens
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
String model
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
JsonValue; object\_ "thread.run"constant"thread.run"constant
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
boolean parallelToolCalls
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
Optional\<RequiredAction\> requiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs submitToolOutputs
Details on the tool outputs needed for this run to continue.
List\<[RequiredActionFunctionToolCall](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)\> toolCalls
A list of the relevant tool calls.
String id
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function function
The function definition.
String arguments
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
JsonValue; type "submit\_tool\_outputs"constant"submit\_tool\_outputs"constant
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
Optional\<[AssistantResponseFormatOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)\> responseFormat
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
Optional\<Long\> startedAt
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
[RunStatus](</api/reference/java/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) status
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
String threadId
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
Optional\<[AssistantToolChoiceOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)\> toolChoice
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
List\<[AssistantTool](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\> tools
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool:
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
Optional\<FileSearch\> fileSearch
Overrides for the file search tool.
Optional\<Long\> maxNumResults
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
double scoreThreshold
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Optional\<Ranker\> ranker
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
AUTO("auto")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_08\_21("default\_2024\_08\_21")
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
class FunctionTool:
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
Optional\<TruncationStrategy\> truncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type type
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
LAST\_MESSAGES("last\_messages")
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
Optional\<Long\> lastMessages
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Optional\<Usage\> usage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
long completionTokens
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
long promptTokens
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
long totalTokens
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Optional\<Double\> temperature
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
Optional\<Double\> topP
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
enum RunStatus:
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
QUEUED("queued")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
REQUIRES\_ACTION("requires\_action")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
CANCELLING("cancelling")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
CANCELLED("cancelled")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
FAILED("failed")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
COMPLETED("completed")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
INCOMPLETE("incomplete")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
EXPIRED("expired")
[](<#(resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run_status > (schema)>)
#### ThreadsRunsSteps
Build Assistants that can call models and use tools.
##### [List run steps](/api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/list)
Deprecated
StepListPage beta().threads().runs().steps().list(StepListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}/steps
##### [Retrieve run step](/api/reference/java/resources/beta/subresources/threads/subresources/runs/subresources/steps/methods/retrieve)
Deprecated
[RunStep](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>) beta().threads().runs().steps().retrieve(StepRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/runs/{run\_id}/steps/{step\_id}
##### ModelsExpand Collapse
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
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
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
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
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
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
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
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
class RunStepDelta:
The delta containing the fields that have changed on the run step.
Optional\<StepDetails\> stepDetails
The details of the run step.
One of the following:
class RunStepDeltaMessageDelta:
Details of the message creation by the run step.
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
Optional\<MessageCreation\> messageCreation
Optional\<String\> messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
class ToolCallDeltaObject:
Details of the tool call.
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
Optional\<List\<[ToolCallDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
class RunStepDeltaEvent:
Represents a run step delta i.e. any changed fields on a run step during streaming.
String id
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
[RunStepDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>) delta
The delta containing the fields that have changed on the run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
JsonValue; object\_ "thread.run.step.delta"constant"thread.run.step.delta"constant
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
class RunStepDeltaMessageDelta:
Details of the message creation by the run step.
JsonValue; type "message\_creation"constant"message\_creation"constant
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
Optional\<MessageCreation\> messageCreation
Optional\<String\> messageId
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
enum RunStepInclude:
STEP\_DETAILS\_TOOL\_CALLS\_FILE\_SEARCH\_RESULTS\_CONTENT("step\_details.tool\_calls[\*].file\_search.results[\*].content")
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema) > (member) 0>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)
class ToolCall: A class that can be one of several variants.union
Details of the Code Interpreter tool call the run step was involved in.
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
[](<#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
class ToolCallDelta: A class that can be one of several variants.union
Details of the Code Interpreter tool call the run step was involved in.
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)
class ToolCallDeltaObject:
Details of the tool call.
JsonValue; type "tool\_calls"constant"tool\_calls"constant
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
Optional\<List\<[ToolCallDelta](</api/reference/java/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)\>\> toolCalls
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterToolCallDelta:
Details of the Code Interpreter tool call the run step was involved in.
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
Optional\<CodeInterpreter\> codeInterpreter
The Code Interpreter tool call definition.
Optional\<String\> input
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Optional\<List\<Output\>\> outputs
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
class CodeInterpreterLogs:
Text output from the Code Interpreter tool call as part of a run step.
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
JsonValue; type "logs"constant"logs"constant
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Optional\<String\> logs
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
class CodeInterpreterOutputImage:
long index
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
JsonValue; type "image"constant"image"constant
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Optional\<Image\> image
Optional\<String\> fileId
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
class FileSearchToolCallDelta:
JsonValue fileSearch
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
class FunctionToolCallDelta:
long index
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
JsonValue; type "function"constant"function"constant
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
Optional\<String\> id
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Optional\<Function\> function
The definition of the function that was called.
Optional\<String\> arguments
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Optional\<String\> output
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
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
#### ThreadsMessages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
MessageListPage beta().threads().messages().list(MessageListParamsparams = MessageListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().create(MessageCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().update(MessageUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().retrieve(MessageRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
[MessageDeleted](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) beta().threads().messages().delete(MessageDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
class Annotation: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
class AnnotationDelta: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile:
String fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta:
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
Optional\<String\> fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageUrl:
String url
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageUrlDelta:
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
Optional\<String\> url
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
class Message:
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
Optional\<String\> assistantId
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Optional\<List\<Attachment\>\> attachments
A list of files attached to the message, and the tools they were added to.
Optional\<String\> fileId
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Optional\<List\<Tool\>\> tools
The tools to add this file to.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
JsonValue;
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
List\<[MessageContent](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
long createdAt
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
Optional\<Long\> incompleteAt
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
Optional\<IncompleteDetails\> incompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason reason
The reason the message is incomplete.
One of the following:
CONTENT\_FILTER("content\_filter")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
MAX\_TOKENS("max\_tokens")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
RUN\_CANCELLED("run\_cancelled")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
RUN\_EXPIRED("run\_expired")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
RUN\_FAILED("run\_failed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
JsonValue; object\_ "thread.message"constant"thread.message"constant
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
Optional\<String\> runId
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status status
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
INCOMPLETE("incomplete")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
String threadId
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
class MessageContent: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
class MessageContentDelta: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
class MessageContentPartParam: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted:
String id
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.message.deleted"constant"thread.message.deleted"constant
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta:
The delta containing the fields that have changed on the Message.
Optional\<List\<[MessageContentDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)\>\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Optional\<Role\> role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent:
Represents a message delta i.e. any changed fields on a message during streaming.
String id
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
[MessageDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) delta
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
JsonValue; object\_ "thread.message.delta"constant"thread.message.delta"constant
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text:
List\<[Annotation](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\> annotations
One of the following:
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
String value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta:
Optional\<List\<[AnnotationDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)\>\> annotations
One of the following:
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Optional\<String\> value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)