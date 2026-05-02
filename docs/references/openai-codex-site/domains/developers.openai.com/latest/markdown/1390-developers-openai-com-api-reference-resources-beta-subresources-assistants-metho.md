Create assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[Assistants](/api/reference/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create assistant
Deprecated
POST/assistants
Create an assistant with a model and instructions.
##### Body ParametersJSONExpand Collapse
model: string or "gpt-5" or "gpt-5-mini" or "gpt-5-nano" or 39 more
ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.
One of the following:
string
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 0>)
AssistantSupportedModels = "gpt-5" or "gpt-5-mini" or "gpt-5-nano" or 39 more
ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.
One of the following:
"gpt-5"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 0>)
"gpt-5-mini"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 1>)
"gpt-5-nano"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 2>)
"gpt-5-2025-08-07"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 3>)
"gpt-5-mini-2025-08-07"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 4>)
"gpt-5-nano-2025-08-07"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 5>)
"gpt-4.1"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 6>)
"gpt-4.1-mini"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 7>)
"gpt-4.1-nano"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 8>)
"gpt-4.1-2025-04-14"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 9>)
"gpt-4.1-mini-2025-04-14"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 10>)
"gpt-4.1-nano-2025-04-14"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 11>)
"o3-mini"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 12>)
"o3-mini-2025-01-31"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 13>)
"o1"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 14>)
"o1-2024-12-17"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 15>)
"gpt-4o"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 16>)
"gpt-4o-2024-11-20"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 17>)
"gpt-4o-2024-08-06"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 18>)
"gpt-4o-2024-05-13"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 19>)
"gpt-4o-mini"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 20>)
"gpt-4o-mini-2024-07-18"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 21>)
"gpt-4.5-preview"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 22>)
"gpt-4.5-preview-2025-02-27"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 23>)
"gpt-4-turbo"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 24>)
"gpt-4-turbo-2024-04-09"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 25>)
"gpt-4-0125-preview"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 26>)
"gpt-4-turbo-preview"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 27>)
"gpt-4-1106-preview"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 28>)
"gpt-4-vision-preview"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 29>)
"gpt-4"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 30>)
"gpt-4-0314"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 31>)
"gpt-4-0613"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 32>)
"gpt-4-32k"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 33>)
"gpt-4-32k-0314"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 34>)
"gpt-4-32k-0613"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 35>)
"gpt-3.5-turbo"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 36>)
"gpt-3.5-turbo-16k"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 37>)
"gpt-3.5-turbo-0613"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 38>)
"gpt-3.5-turbo-1106"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 39>)
"gpt-3.5-turbo-0125"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 40>)
"gpt-3.5-turbo-16k-0613"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1 > (member) 41>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema) > (variant) 1>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) model > (schema)>)
description: optional string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) description > (schema)>)
instructions: optional string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) instructions > (schema)>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) metadata > (schema)>)
name: optional string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) name > (schema)>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
One of the following:
"none"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) reasoning_effort > (schema)>)
response\_format: optional [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) response_format > (schema)>)
temperature: optional number
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) temperature > (schema)>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids, vector\_stores }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
vector\_stores: optional array of object { chunking\_strategy, file\_ids, metadata }
A helper to create a [vector store](/docs/api-reference/vector-stores/object) with file\_ids and attach it to this assistant. There can be a maximum of 1 vector store attached to the assistant.
chunking\_strategy: optional object { type } or object { static, type }
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
One of the following:
AutoChunkingStrategy object { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0>)
StaticChunkingStrategy object { static, type }
static: object { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) max_chunk_size_tokens>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static>)
type: "static"
Always `static`.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy>)
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs to add to the vector store. For vector stores created before Nov 2025, there can be a maximum of 10,000 files in a vector store. For vector stores created starting in Nov 2025, the limit is 100,000,000 files.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) file_ids>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) metadata>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tool_resources > (schema)>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
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
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) tools > (schema)>)
top\_p: optional number
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (method) create > (params) 0 > (param) top_p > (schema)>)
##### ReturnsExpand Collapse
Assistant object { id, created\_at, description, 10 more }
Represents an `assistant` that can call the model and use tools.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
description: string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
instructions: string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
model: string
ID of the model to use. You can use the [List models](/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
name: string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
object: "assistant"
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
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
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
response\_format: optional [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
temperature: optional number
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The ID of the [vector store](/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
top\_p: optional number
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
Code InterpreterFiles
### Create assistant
HTTP
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
`curl "https://api.openai.com/v1/assistants" \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"instructions": "You are a personal math tutor. When asked a question, write and run Python code to answer the question.",
"name": "Math Tutor",
"tools": [{"type": "code\_interpreter"}],
"model": "gpt-4o"
}'
`
```
```
`{
"id": "asst\_abc123",
"object": "assistant",
"created\_at": 1698984975,
"name": "Math Tutor",
"description": null,
"model": "gpt-4o",
"instructions": "You are a personal math tutor. When asked a question, write and run Python code to answer the question.",
"tools": [
{
"type": "code\_interpreter"
}
],
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
}
`
```
### Create assistant
HTTP
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
`curl https://api.openai.com/v1/assistants \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"instructions": "You are an HR bot, and you have access to files to answer employee questions about company policies.",
"tools": [{"type": "file\_search"}],
"tool\_resources": {"file\_search": {"vector\_store\_ids": ["vs\_123"]}},
"model": "gpt-4o"
}'
`
```
```
`{
"id": "asst\_abc123",
"object": "assistant",
"created\_at": 1699009403,
"name": "HR Helper",
"description": null,
"model": "gpt-4o",
"instructions": "You are an HR bot, and you have access to files to answer employee questions about company policies.",
"tools": [
{
"type": "file\_search"
}
],
"tool\_resources": {
"file\_search": {
"vector\_store\_ids": ["vs\_123"]
}
},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
}
`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"instructions": "instructions",
"metadata": {
"foo": "string"
},
"model": "model",
"name": "name",
"object": "assistant",
"tools": [
{
"type": "code\_interpreter"
}
],
"response\_format": "auto",
"temperature": 1,
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"string"
]
},
"file\_search": {
"vector\_store\_ids": [
"string"
]
}
},
"top\_p": 1
}`
```