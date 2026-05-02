Assistants | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assistants
Build Assistants that can call models and use tools.
##### [List assistants](/api/reference/python/resources/beta/subresources/assistants/methods/list)
Deprecated
beta.assistants.list(AssistantListParams\*\*kwargs) -\> SyncCursorPage[[Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)]
GET/assistants
##### [Create assistant](/api/reference/python/resources/beta/subresources/assistants/methods/create)
Deprecated
beta.assistants.create(AssistantCreateParams\*\*kwargs) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
POST/assistants
##### [Retrieve assistant](/api/reference/python/resources/beta/subresources/assistants/methods/retrieve)
Deprecated
beta.assistants.retrieve(strassistant\_id) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
GET/assistants/{assistant\_id}
##### [Modify assistant](/api/reference/python/resources/beta/subresources/assistants/methods/update)
Deprecated
beta.assistants.update(strassistant\_id, AssistantUpdateParams\*\*kwargs) -\> [Assistant](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)
POST/assistants/{assistant\_id}
##### [Delete assistant](/api/reference/python/resources/beta/subresources/assistants/methods/delete)
Deprecated
beta.assistants.delete(strassistant\_id) -\> [AssistantDeleted](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
DELETE/assistants/{assistant\_id}
##### ModelsExpand Collapse
class Assistant: …
Represents an `assistant` that can call the model and use tools.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
description: Optional[str]
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
instructions: Optional[str]
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
model: str
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
name: Optional[str]
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
object: Literal["assistant"]
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
tools: List[[AssistantTool](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
response\_format: Optional[AssistantResponseFormatOption]
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
temperature: Optional[float]
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
tool\_resources: Optional[ToolResources]
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Optional[ToolResourcesCodeInterpreter]
file\_ids: Optional[List[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: Optional[ToolResourcesFileSearch]
vector\_store\_ids: Optional[List[str]]
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
top\_p: Optional[float]
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
class AssistantDeleted: …
id: str
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: Literal["assistant.deleted"]
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
[AssistantStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
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
class ThreadCreated: …
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
enabled: Optional[bool]
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
class ThreadRunCreated: …
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
class ThreadRunQueued: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.queued"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
class ThreadRunInProgress: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
class ThreadRunRequiresAction: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.requires\_action"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
class ThreadRunCompleted: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
class ThreadRunIncomplete: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.incomplete"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
class ThreadRunFailed: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
event: Literal["thread.run.failed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelling: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
event: Literal["thread.run.cancelling"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
class ThreadRunCancelled: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
event: Literal["thread.run.cancelled"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
class ThreadRunExpired: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
event: Literal["thread.run.expired"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
class ThreadRunStepCreated: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
event: Literal["thread.run.step.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
class ThreadRunStepInProgress: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
event: Literal["thread.run.step.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
class ThreadRunStepDelta: …
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
event: Literal["thread.run.step.delta"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
class ThreadRunStepCompleted: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
event: Literal["thread.run.step.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
class ThreadRunStepFailed: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
event: Literal["thread.run.step.failed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
class ThreadRunStepCancelled: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
event: Literal["thread.run.step.cancelled"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
class ThreadRunStepExpired: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
event: Literal["thread.run.step.expired"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
class ThreadMessageCreated: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
event: Literal["thread.message.created"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
class ThreadMessageInProgress: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
event: Literal["thread.message.in\_progress"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
class ThreadMessageDelta: …
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
event: Literal["thread.message.delta"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
class ThreadMessageCompleted: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
event: Literal["thread.message.completed"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
class ThreadMessageIncomplete: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
event: Literal["thread.message.incomplete"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
class ErrorEvent: …
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
data: [ErrorObject](</api/reference/python/resources/$shared#(resource) $shared > (model) error_object > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
event: Literal["error"]
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
[AssistantTool](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_tool > (schema)>)
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class FileSearchTool: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: Optional[FileSearch]
Overrides for the file search tool.
max\_num\_results: Optional[int]
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: Optional[FileSearchRankingOptions]
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: float
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: Optional[Literal["auto", "default\_2024\_08\_21"]]
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
class FunctionTool: …
function: [FunctionDefinition](</api/reference/python/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: Literal["function"]
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[MessageStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) message_stream_event > (schema)>)
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
One of the following:
class ThreadMessageCreated: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.message.created"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 0>)
class ThreadMessageInProgress: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.message.in\_progress"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 1>)
class ThreadMessageDelta: …
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
data: [MessageDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.message.delta"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 2>)
class ThreadMessageCompleted: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.message.completed"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 3>)
class ThreadMessageIncomplete: …
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
data: [Message](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.message.incomplete"]
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema) > (variant) 4>)
[](<#(resource) beta.assistants > (model) message_stream_event > (schema)>)
[RunStepStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
One of the following:
class ThreadRunStepCreated: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.run.step.created"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 0>)
class ThreadRunStepInProgress: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.step.in\_progress"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 1>)
class ThreadRunStepDelta: …
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
data: [RunStepDeltaEvent](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.step.delta"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 2>)
class ThreadRunStepCompleted: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.step.completed"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 3>)
class ThreadRunStepFailed: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.step.failed"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 4>)
class ThreadRunStepCancelled: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.step.cancelled"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 5>)
class ThreadRunStepExpired: …
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
data: [RunStep](</api/reference/python/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.step.expired"]
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema) > (variant) 6>)
[](<#(resource) beta.assistants > (model) run_step_stream_event > (schema)>)
[RunStreamEvent](</api/reference/python/resources/beta#(resource) beta.assistants > (model) run_stream_event > (schema)>)
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
One of the following:
class ThreadRunCreated: …
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) data>)
event: Literal["thread.run.created"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 0>)
class ThreadRunQueued: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) data>)
event: Literal["thread.run.queued"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 1>)
class ThreadRunInProgress: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) data>)
event: Literal["thread.run.in\_progress"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 2>)
class ThreadRunRequiresAction: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) data>)
event: Literal["thread.run.requires\_action"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 3>)
class ThreadRunCompleted: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) data>)
event: Literal["thread.run.completed"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 4>)
class ThreadRunIncomplete: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) data>)
event: Literal["thread.run.incomplete"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 5>)
class ThreadRunFailed: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) data>)
event: Literal["thread.run.failed"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 6>)
class ThreadRunCancelling: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) data>)
event: Literal["thread.run.cancelling"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 7>)
class ThreadRunCancelled: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) data>)
event: Literal["thread.run.cancelled"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 8>)
class ThreadRunExpired: …
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
data: [Run](</api/reference/python/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) data>)
event: Literal["thread.run.expired"]
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema) > (variant) 9>)
[](<#(resource) beta.assistants > (model) run_stream_event > (schema)>)
class ThreadStreamEvent: …
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
data: [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) data>)
event: Literal["thread.created"]
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) event>)
enabled: Optional[bool]
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema) > (property) enabled>)
[](<#(resource) beta.assistants > (model) thread_stream_event > (schema)>)