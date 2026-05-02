List assistants | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Assistants](/api/reference/go/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List assistants
Deprecated
client.Beta.Assistants.List(ctx, query) (\*CursorPage[[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>)], error)
GET/assistants
Returns a list of assistants.
##### ParametersExpand Collapse
query BetaAssistantListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) beta.assistants > (method) list > (params) default > (param) after>)
Before param.Field[string]Optional
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.assistants > (method) list > (params) default > (param) before>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) beta.assistants > (method) list > (params) default > (param) limit>)
Order param.Field[[BetaAssistantListParamsOrder](</api/reference/go/resources/beta/subresources/assistants/methods/list#(resource) beta.assistants > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
const BetaAssistantListParamsOrderAsc [BetaAssistantListParamsOrder](</api/reference/go/resources/beta/subresources/assistants/methods/list#(resource) beta.assistants > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) beta.assistants > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const BetaAssistantListParamsOrderDesc [BetaAssistantListParamsOrder](</api/reference/go/resources/beta/subresources/assistants/methods/list#(resource) beta.assistants > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) beta.assistants > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.assistants > (method) list > (params) default > (param) order>)
[](<#(resource) beta.assistants > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Assistant struct{…}
Represents an `assistant` that can call the model and use tools.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
Description string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
Instructions string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
Model string
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
Name string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
Object Assistant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
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
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Strict boolOptional
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)Optional
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
Temperature float64Optional
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
ToolResources AssistantToolResourcesOptional
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter AssistantToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
FileSearch AssistantToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
TopP float64Optional
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
### List assistants
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
page, err := client.Beta.Assistants.List(context.TODO(), openai.BetaAssistantListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"id": "asst\_abc123",
"object": "assistant",
"created\_at": 1698982736,
"name": "Coding Tutor",
"description": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant designed to make me better at coding!",
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
},
{
"id": "asst\_abc456",
"object": "assistant",
"created\_at": 1698982718,
"name": "My Assistant",
"description": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant designed to make me better at coding!",
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
},
{
"id": "asst\_abc789",
"object": "assistant",
"created\_at": 1698982643,
"name": null,
"description": null,
"model": "gpt-4o",
"instructions": null,
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
}
],
"first\_id": "asst\_abc123",
"last\_id": "asst\_abc789",
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
"id": "asst\_abc123",
"object": "assistant",
"created\_at": 1698982736,
"name": "Coding Tutor",
"description": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant designed to make me better at coding!",
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
},
{
"id": "asst\_abc456",
"object": "assistant",
"created\_at": 1698982718,
"name": "My Assistant",
"description": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant designed to make me better at coding!",
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
},
{
"id": "asst\_abc789",
"object": "assistant",
"created\_at": 1698982643,
"name": null,
"description": null,
"model": "gpt-4o",
"instructions": null,
"tools": [],
"tool\_resources": {},
"metadata": {},
"top\_p": 1.0,
"temperature": 1.0,
"response\_format": "auto"
}
],
"first\_id": "asst\_abc123",
"last\_id": "asst\_abc789",
"has\_more": false
}
`
```