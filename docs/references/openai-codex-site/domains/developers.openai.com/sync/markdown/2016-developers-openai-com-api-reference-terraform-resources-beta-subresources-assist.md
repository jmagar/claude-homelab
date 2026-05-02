Assistants | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Beta](/api/reference/terraform/resources/beta)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assistants
Build Assistants that can call models and use tools.
#### resource openai\_beta\_assistant
##### required Expand Collapse
model: String
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) model>)
##### optional Expand Collapse
description?: String
The description of the assistant. The maximum length is 512 characters.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) description>)
instructions?: String
The system instructions that the assistant uses. The maximum length is 256,000 characters.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) instructions>)
name?: String
The name of the assistant. The maximum length is 256 characters.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) name>)
response\_format?: String
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) response_format>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) metadata>)
reasoning\_effort?: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) reasoning_effort>)
temperature?: Float64
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) temperature>)
top\_p?: Float64
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) top_p>)
tool\_resources?: Attributes
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter?: Attributes
file\_ids?: List[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) code_interpreter > (attribute) file_ids>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) code_interpreter>)
file\_search?: Attributes
vector\_store\_ids?: List[String]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_store_ids>)
vector\_stores?: List[Attributes]
A helper to create a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) with file\_ids and attach it to this assistant. There can be a maximum of 1 vector store attached to the assistant.
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
type: String
Always `auto`.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) chunking_strategy>)
file\_ids?: List[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs to add to the vector store. For vector stores created before Nov 2025, there can be a maximum of 10,000 files in a vector store. For vector stores created starting in Nov 2025, the limit is 100,000,000 files.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) file_ids>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores > (attribute) metadata>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_stores>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources > (attribute) file_search>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tool_resources>)
tools?: List[Attributes]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
type: String
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) type>)
file\_search?: Attributes
Overrides for the file search tool.
max\_num\_results?: Int64
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) file_search > (attribute) max_num_results>)
ranking\_options?: Attributes
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) score_threshold>)
ranker?: String
The ranker to use for the file search. If not specified will use the `auto` ranker.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) ranker>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) file_search > (attribute) ranking_options>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) file_search>)
function?: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) function > (attribute) name>)
description?: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) function > (attribute) description>)
parameters?: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) function > (attribute) parameters>)
strict?: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools > (attribute) function>)
[](<#(resource) beta.assistants > (terraform resource) > (attribute) tools>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the assistant was created.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (terraform resource) > (attribute) object>)
### openai\_beta\_assistant
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
`resource "openai\_beta\_assistant" "example\_beta\_assistant" {
model = "gpt-4o"
description = "description"
instructions = "instructions"
metadata = {
foo = "string"
}
name = "name"
reasoning\_effort = "none"
response\_format = "auto"
temperature = 1
tool\_resources = {
code\_interpreter = {
file\_ids = ["string"]
}
file\_search = {
vector\_store\_ids = ["string"]
vector\_stores = [{
chunking\_strategy = {
type = "auto"
}
file\_ids = ["string"]
metadata = {
foo = "string"
}
}]
}
}
tools = [{
type = "code\_interpreter"
}]
top\_p = 1
}
`
```
#### data openai\_beta\_assistant
##### optional Expand Collapse
assistant\_id?: String
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) assistant_id>)
find\_one\_by?: Attributes
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) find_one_by > (attribute) before>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the assistant was created.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) created_at>)
description: String
The description of the assistant. The maximum length is 512 characters.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) description>)
instructions: String
The system instructions that the assistant uses. The maximum length is 256,000 characters.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) instructions>)
model: String
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) model>)
name: String
The name of the assistant. The maximum length is 256 characters.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) object>)
response\_format: String
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) response_format>)
temperature: Float64
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) temperature>)
top\_p: Float64
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) top_p>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) metadata>)
tool\_resources: Attributes
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Attributes
file\_ids: List[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tool_resources > (attribute) code_interpreter > (attribute) file_ids>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tool_resources > (attribute) code_interpreter>)
file\_search: Attributes
vector\_store\_ids: List[String]
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tool_resources > (attribute) file_search > (attribute) vector_store_ids>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tool_resources > (attribute) file_search>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tool_resources>)
tools: List[Attributes]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
type: String
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) type>)
file\_search: Attributes
Overrides for the file search tool.
max\_num\_results: Int64
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) file_search > (attribute) max_num_results>)
ranking\_options: Attributes
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) score_threshold>)
ranker: String
The ranker to use for the file search. If not specified will use the `auto` ranker.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) ranker>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) file_search > (attribute) ranking_options>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) file_search>)
function: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) function > (attribute) name>)
description: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) function > (attribute) description>)
parameters: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) function > (attribute) parameters>)
strict: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools > (attribute) function>)
[](<#(resource) beta.assistants > (terraform datasource-single) > (attribute) tools>)
### openai\_beta\_assistant
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
`data "openai\_beta\_assistant" "example\_beta\_assistant" {
assistant\_id = "assistant\_id"
}
`
```
#### data openai\_beta\_assistants
##### optional Expand Collapse
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) before>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the assistant was created.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
description: String
The description of the assistant. The maximum length is 512 characters.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) description>)
instructions: String
The system instructions that the assistant uses. The maximum length is 256,000 characters.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) instructions>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
model: String
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) model>)
name: String
The name of the assistant. The maximum length is 256 characters.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) object>)
tools: List[Attributes]
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
type: String
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) type>)
file\_search: Attributes
Overrides for the file search tool.
max\_num\_results: Int64
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) file_search > (attribute) max_num_results>)
ranking\_options: Attributes
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: Float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) score_threshold>)
ranker: String
The ranker to use for the file search. If not specified will use the `auto` ranker.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) file_search > (attribute) ranking_options > (attribute) ranker>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) file_search > (attribute) ranking_options>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) file_search>)
function: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) function > (attribute) name>)
description: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) function > (attribute) description>)
parameters: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) function > (attribute) parameters>)
strict: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) function>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tools>)
response\_format: String
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) response_format>)
temperature: Float64
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) temperature>)
tool\_resources: Attributes
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Attributes
file\_ids: List[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tool_resources > (attribute) code_interpreter > (attribute) file_ids>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tool_resources > (attribute) code_interpreter>)
file\_search: Attributes
vector\_store\_ids: List[String]
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tool_resources > (attribute) file_search > (attribute) vector_store_ids>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tool_resources > (attribute) file_search>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) tool_resources>)
top\_p: Float64
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items > (attribute) top_p>)
[](<#(resource) beta.assistants > (terraform datasource-plural) > (attribute) items>)
### openai\_beta\_assistants
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
`data "openai\_beta\_assistants" "example\_beta\_assistants" {
before = "before"
}
`
```