Modify assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Assistants](/api/reference/java/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify assistant
Deprecated
[Assistant](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>) beta().assistants().update(AssistantUpdateParamsparams = AssistantUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/assistants/{assistant\_id}
Modifies an assistant.
##### ParametersExpand Collapse
AssistantUpdateParams params
Optional\<String\> assistantId
[](<#(resource) beta.assistants > (method) update > (params) default > (param) assistant_id > (schema)>)
Optional\<String\> description
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) description>)
Optional\<String\> instructions
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) instructions>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) metadata>)
Optional\<Model\> model
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
GPT\_5("gpt-5")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 0>)
GPT\_5\_MINI("gpt-5-mini")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 1>)
GPT\_5\_NANO("gpt-5-nano")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 2>)
GPT\_5\_2025\_08\_07("gpt-5-2025-08-07")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 3>)
GPT\_5\_MINI\_2025\_08\_07("gpt-5-mini-2025-08-07")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 4>)
GPT\_5\_NANO\_2025\_08\_07("gpt-5-nano-2025-08-07")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 5>)
GPT\_4\_1("gpt-4.1")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 6>)
GPT\_4\_1\_MINI("gpt-4.1-mini")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 7>)
GPT\_4\_1\_NANO("gpt-4.1-nano")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 8>)
GPT\_4\_1\_2025\_04\_14("gpt-4.1-2025-04-14")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 9>)
GPT\_4\_1\_MINI\_2025\_04\_14("gpt-4.1-mini-2025-04-14")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 10>)
GPT\_4\_1\_NANO\_2025\_04\_14("gpt-4.1-nano-2025-04-14")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 11>)
O3\_MINI("o3-mini")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 12>)
O3\_MINI\_2025\_01\_31("o3-mini-2025-01-31")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 13>)
O1("o1")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 14>)
O1\_2024\_12\_17("o1-2024-12-17")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 15>)
GPT\_4O("gpt-4o")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 16>)
GPT\_4O\_2024\_11\_20("gpt-4o-2024-11-20")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 17>)
GPT\_4O\_2024\_08\_06("gpt-4o-2024-08-06")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 18>)
GPT\_4O\_2024\_05\_13("gpt-4o-2024-05-13")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 19>)
GPT\_4O\_MINI("gpt-4o-mini")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 20>)
GPT\_4O\_MINI\_2024\_07\_18("gpt-4o-mini-2024-07-18")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 21>)
GPT\_4\_5\_PREVIEW("gpt-4.5-preview")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 22>)
GPT\_4\_5\_PREVIEW\_2025\_02\_27("gpt-4.5-preview-2025-02-27")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 23>)
GPT\_4\_TURBO("gpt-4-turbo")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 24>)
GPT\_4\_TURBO\_2024\_04\_09("gpt-4-turbo-2024-04-09")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 25>)
GPT\_4\_0125\_PREVIEW("gpt-4-0125-preview")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 26>)
GPT\_4\_TURBO\_PREVIEW("gpt-4-turbo-preview")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 27>)
GPT\_4\_1106\_PREVIEW("gpt-4-1106-preview")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 28>)
GPT\_4\_VISION\_PREVIEW("gpt-4-vision-preview")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 29>)
GPT\_4("gpt-4")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 30>)
GPT\_4\_0314("gpt-4-0314")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 31>)
GPT\_4\_0613("gpt-4-0613")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 32>)
GPT\_4\_32K("gpt-4-32k")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 33>)
GPT\_4\_32K\_0314("gpt-4-32k-0314")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 34>)
GPT\_4\_32K\_0613("gpt-4-32k-0613")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 35>)
GPT\_3\_5\_TURBO("gpt-3.5-turbo")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 36>)
GPT\_3\_5\_TURBO\_16K("gpt-3.5-turbo-16k")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 37>)
GPT\_3\_5\_TURBO\_0613("gpt-3.5-turbo-0613")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 38>)
GPT\_3\_5\_TURBO\_1106("gpt-3.5-turbo-1106")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 39>)
GPT\_3\_5\_TURBO\_0125("gpt-3.5-turbo-0125")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 40>)
GPT\_3\_5\_TURBO\_16K\_0613("gpt-3.5-turbo-16k-0613")
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model > (variant) 1 > (member) 41>)
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) model>)
Optional\<String\> name
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) name>)
Optional\<[ReasoningEffort](</api/reference/java/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)\> reasoningEffort
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) reasoning_effort>)
Optional\<[AssistantResponseFormatOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)\> responseFormat
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) response_format>)
Optional\<Double\> temperature
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) temperature>)
Optional\<ToolResources\> toolResources
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
Overrides the list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
Overrides the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tool_resources>)
Optional\<List\<[AssistantTool](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\>\> tools
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
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
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) tools>)
Optional\<Double\> topP
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (method) update > (params) default > (param) body > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (method) update > (params) default>)
##### ReturnsExpand Collapse
class Assistant:
Represents an `assistant` that can call the model and use tools.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
Optional\<String\> description
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
Optional\<String\> instructions
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
String model
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
Optional\<String\> name
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
JsonValue; object\_ "assistant"constant"assistant"constant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
List\<[AssistantTool](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)\> tools
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
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
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
Optional\<[AssistantResponseFormatOption](</api/reference/java/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)\> responseFormat
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
JsonValue;
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
Optional\<Double\> temperature
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
Optional\<ToolResources\> toolResources
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
Optional\<Double\> topP
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
### Modify assistant
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
import com.openai.models.beta.assistants.Assistant;
import com.openai.models.beta.assistants.AssistantUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Assistant assistant = client.beta().assistants().update("assistant\_id");
}
}`
```
```
`{
"id": "asst\_123",
"object": "assistant",
"created\_at": 1699009709,
"name": "HR Helper",
"description": null,
"model": "gpt-4o",
"instructions": "You are an HR bot, and you have access to files to answer employee questions about company policies. Always response with info from either of the files.",
"tools": [
{
"type": "file\_search"
}
],
"tool\_resources": {
"file\_search": {
"vector\_store\_ids": []
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
```
`{
"id": "asst\_123",
"object": "assistant",
"created\_at": 1699009709,
"name": "HR Helper",
"description": null,
"model": "gpt-4o",
"instructions": "You are an HR bot, and you have access to files to answer employee questions about company policies. Always response with info from either of the files.",
"tools": [
{
"type": "file\_search"
}
],
"tool\_resources": {
"file\_search": {
"vector\_store\_ids": []
}
},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
}
`
```