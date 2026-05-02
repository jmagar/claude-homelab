Responses | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Responses
#### resource openai\_response
##### optional Expand Collapse
conversation?: String
The conversation that this response belongs to. Items from this conversation are prepended to `input\_items` for this response request.
Input items and output items from this response are automatically added to this conversation after this response completes.
[](<#(resource) responses > (terraform resource) > (attribute) conversation>)
input?: String
Text, image, or file inputs to the model, used to generate a response.
Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Image inputs](https://platform.openai.com/docs/guides/images)
* [File inputs](https://platform.openai.com/docs/guides/pdf-files)
* [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
* [Function calling](https://platform.openai.com/docs/guides/function-calling)
[](<#(resource) responses > (terraform resource) > (attribute) input>)
instructions?: String
A system (or developer) message inserted into the model’s context.
When using along with `previous\_response\_id`, the instructions from a previous
response will not be carried over to the next response. This makes it simple
to swap out system (or developer) messages in new responses.
[](<#(resource) responses > (terraform resource) > (attribute) instructions>)
max\_output\_tokens?: Int64
An upper bound for the number of tokens that can be generated for a response, including visible output tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) responses > (terraform resource) > (attribute) max_output_tokens>)
max\_tool\_calls?: Int64
The maximum number of total calls to built-in tools that can be processed in a response. This maximum number applies across all built-in tool calls, not per individual tool. Any further attempts to call a tool by the model will be ignored.
[](<#(resource) responses > (terraform resource) > (attribute) max_tool_calls>)
model?: String
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
to browse and compare available models.
[](<#(resource) responses > (terraform resource) > (attribute) model>)
previous\_response\_id?: String
The unique ID of the previous response to the model. Use this to
create multi-turn conversations. Learn more about
[conversation state](https://platform.openai.com/docs/guides/conversation-state). Cannot be used in conjunction with `conversation`.
[](<#(resource) responses > (terraform resource) > (attribute) previous_response_id>)
prompt\_cache\_key?: String
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (terraform resource) > (attribute) prompt_cache_key>)
prompt\_cache\_retention?: String
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](https://platform.openai.com/docs/guides/prompt-caching#prompt-cache-retention).
[](<#(resource) responses > (terraform resource) > (attribute) prompt_cache_retention>)
safety\_identifier?: String
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) responses > (terraform resource) > (attribute) safety_identifier>)
stream?: Bool
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
for more information.
[](<#(resource) responses > (terraform resource) > (attribute) stream>)
tool\_choice?: String
How the model should select which tool (or tools) to use when generating
a response. See the `tools` parameter to see how to specify which tools
the model can call.
[](<#(resource) responses > (terraform resource) > (attribute) tool_choice>)
top\_logprobs?: Int64
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
[](<#(resource) responses > (terraform resource) > (attribute) top_logprobs>)
Deprecateduser?: String
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) responses > (terraform resource) > (attribute) user>)
include?: List[String]
Specify additional output data to include in the model response. Currently supported values are:
* `web\_search\_call.action.sources`: Include the sources of the web search tool call.
* `code\_interpreter\_call.outputs`: Includes the outputs of python code execution in code interpreter tool call items.
* `computer\_call\_output.output.image\_url`: Include image urls from the computer call output.
* `file\_search\_call.results`: Include the search results of the file search tool call.
* `message.input\_image.image\_url`: Include image urls from the input message.
* `message.output\_text.logprobs`: Include logprobs with assistant messages.
* `reasoning.encrypted\_content`: Includes an encrypted version of reasoning tokens in reasoning item outputs. This enables reasoning items to be used in multi-turn conversations when using the Responses API statelessly (like when the `store` parameter is set to `false`, or when an organization is enrolled in the zero data retention program).
[](<#(resource) responses > (terraform resource) > (attribute) include>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) responses > (terraform resource) > (attribute) metadata>)
context\_management?: List[Attributes]
Context management configuration for this request.
type: String
The context management entry type. Currently only ‘compaction’ is supported.
[](<#(resource) responses > (terraform resource) > (attribute) context_management > (attribute) type>)
compact\_threshold?: Int64
Token threshold at which compaction should be triggered for this entry.
[](<#(resource) responses > (terraform resource) > (attribute) context_management > (attribute) compact_threshold>)
[](<#(resource) responses > (terraform resource) > (attribute) context_management>)
prompt?: Attributes
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: String
The unique identifier of the prompt template to use.
[](<#(resource) responses > (terraform resource) > (attribute) prompt > (attribute) id>)
variables?: Map[String]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
[](<#(resource) responses > (terraform resource) > (attribute) prompt > (attribute) variables>)
version?: String
Optional version of the prompt template.
[](<#(resource) responses > (terraform resource) > (attribute) prompt > (attribute) version>)
[](<#(resource) responses > (terraform resource) > (attribute) prompt>)
stream\_options?: Attributes
Options for streaming responses. Only set this when you set `stream: true`.
include\_obfuscation?: Bool
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) responses > (terraform resource) > (attribute) stream_options > (attribute) include_obfuscation>)
[](<#(resource) responses > (terraform resource) > (attribute) stream_options>)
background?: Bool
Whether to run the model response in the background.
[Learn more](https://platform.openai.com/docs/guides/background).
[](<#(resource) responses > (terraform resource) > (attribute) background>)
parallel\_tool\_calls?: Bool
Whether to allow the model to run tool calls in parallel.
[](<#(resource) responses > (terraform resource) > (attribute) parallel_tool_calls>)
service\_tier?: String
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
[](<#(resource) responses > (terraform resource) > (attribute) service_tier>)
store?: Bool
Whether to store the generated model response for later retrieval via
API.
[](<#(resource) responses > (terraform resource) > (attribute) store>)
temperature?: Float64
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
[](<#(resource) responses > (terraform resource) > (attribute) temperature>)
top\_p?: Float64
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
[](<#(resource) responses > (terraform resource) > (attribute) top_p>)
truncation?: String
The truncation strategy to use for the model response.
* `auto`: If the input to this Response exceeds
the model’s context window size, the model will truncate the
response to fit the context window by dropping items from the beginning of the conversation.
* `disabled` (default): If the input size will exceed the context window
size for a model, the request will fail with a 400 error.
[](<#(resource) responses > (terraform resource) > (attribute) truncation>)
reasoning?: Attributes
**gpt-5 and o-series models only**
Configuration options for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
effort?: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) responses > (terraform resource) > (attribute) reasoning > (attribute) effort>)
Deprecatedgenerate\_summary?: String
**Deprecated:** use `summary` instead.
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
[](<#(resource) responses > (terraform resource) > (attribute) reasoning > (attribute) generate_summary>)
summary?: String
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
`concise` is supported for `computer-use-preview` models and all reasoning models after `gpt-5`.
[](<#(resource) responses > (terraform resource) > (attribute) reasoning > (attribute) summary>)
[](<#(resource) responses > (terraform resource) > (attribute) reasoning>)
text?: Attributes
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
format?: Attributes
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type: String
The type of response format being defined. Always `text`.
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format > (attribute) type>)
name?: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format > (attribute) name>)
schema?: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format > (attribute) schema>)
description?: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format > (attribute) description>)
strict?: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format > (attribute) strict>)
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) format>)
verbosity?: String
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
[](<#(resource) responses > (terraform resource) > (attribute) text > (attribute) verbosity>)
[](<#(resource) responses > (terraform resource) > (attribute) text>)
tools?: List[Attributes]
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
We support the following categories of tools:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search). Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
* **MCP Tools**: Integrations with third-party systems via custom MCP servers
or predefined connectors such as Google Drive and SharePoint. Learn more about
[MCP Tools](https://platform.openai.com/docs/guides/tools-connectors-mcp).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code with strongly typed arguments
and outputs. Learn more about
[function calling](https://platform.openai.com/docs/guides/function-calling). You can also use
custom tools to call your own code.
name?: String
The name of the function to call.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) name>)
parameters?: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) parameters>)
strict?: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) strict>)
type?: String
The type of the function tool. Always `function`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) type>)
defer\_loading?: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) defer_loading>)
description?: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) description>)
vector\_store\_ids?: List[String]
The IDs of the vector stores to search.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) vector_store_ids>)
filters?: Attributes
A filter to apply.
key?: String
The key to compare against the value.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) key>)
type?: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) type>)
value?: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) value>)
filters?: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
type?: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains?: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) filters>)
max\_num\_results?: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) max_num_results>)
ranking\_options?: Attributes
Ranking options for search.
hybrid\_search?: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker?: String
The ranker to use for the file search.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold?: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) ranking_options>)
display\_height?: Int64
The height of the computer display.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) display_height>)
display\_width?: Int64
The width of the computer display.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) display_width>)
environment?: String
The type of computer environment to control.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) environment>)
search\_context\_size?: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) search_context_size>)
user\_location?: Attributes
The approximate location of the user.
city?: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) city>)
country?: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) country>)
region?: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone?: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type?: String
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) user_location>)
server\_label?: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) server_label>)
allowed\_tools?: List[String]
List of allowed tool names or a filter object.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) allowed_tools>)
authorization?: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) authorization>)
connector\_id?: String
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) connector_id>)
headers?: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) headers>)
require\_approval?: Attributes
Specify which of the MCP server’s tools require approval.
always?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always>)
never?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) require_approval>)
server\_description?: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) server_description>)
server\_url?: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) server_url>)
container?: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) container>)
action?: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) action>)
background?: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) background>)
input\_fidelity?: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask?: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: String
File ID for the mask image.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url?: String
Base64-encoded mask image.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) input_image_mask>)
model?: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) model>)
moderation?: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) moderation>)
output\_compression?: Int64
Compression level for the output image. Default: 100.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) output_compression>)
output\_format?: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) output_format>)
partial\_images?: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) partial_images>)
quality?: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) quality>)
size?: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) size>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) format>)
tools?: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) name>)
type?: String
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading?: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description?: String
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) description>)
parameters?: JSON
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict?: Bool
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) strict>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) tools>)
execution?: String
Whether tool search is executed by the server or by the client.
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) execution>)
search\_content\_types?: List[String]
[](<#(resource) responses > (terraform resource) > (attribute) tools > (attribute) search_content_types>)
[](<#(resource) responses > (terraform resource) > (attribute) tools>)
##### computed Expand Collapse
id: String
Unique identifier for this Response.
[](<#(resource) responses > (terraform resource) > (attribute) id>)
completed\_at: Float64
Unix timestamp (in seconds) of when this Response was completed.
Only present when the status is `completed`.
[](<#(resource) responses > (terraform resource) > (attribute) completed_at>)
created\_at: Float64
Unix timestamp (in seconds) of when this Response was created.
[](<#(resource) responses > (terraform resource) > (attribute) created_at>)
object: String
The object type of this resource - always set to `response`.
[](<#(resource) responses > (terraform resource) > (attribute) object>)
output\_text: String
SDK-only convenience property that contains the aggregated text output
from all `output\_text` items in the `output` array, if any are present.
Supported in the Python and JavaScript SDKs.
[](<#(resource) responses > (terraform resource) > (attribute) output_text>)
status: String
The status of the response generation. One of `completed`, `failed`,
`in\_progress`, `cancelled`, `queued`, or `incomplete`.
[](<#(resource) responses > (terraform resource) > (attribute) status>)
error: Attributes
An error object returned when the model fails to generate a Response.
code: String
The error code for the response.
[](<#(resource) responses > (terraform resource) > (attribute) error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) responses > (terraform resource) > (attribute) error > (attribute) message>)
[](<#(resource) responses > (terraform resource) > (attribute) error>)
incomplete\_details: Attributes
Details about why the response is incomplete.
reason: String
The reason why the response is incomplete.
[](<#(resource) responses > (terraform resource) > (attribute) incomplete_details > (attribute) reason>)
[](<#(resource) responses > (terraform resource) > (attribute) incomplete_details>)
output: List[Attributes]
An array of content items generated by the model.
* The length and order of items in the `output` array is dependent
on the model’s response.
* Rather than accessing the first item in the `output` array and
assuming it’s an `assistant` message with the content generated by
the model, you might consider using the `output\_text` property where
supported in SDKs.
id: String
The unique ID of the output message.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) id>)
content: List[Attributes]
The content of the output message.
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) annotations>)
text: String
The text output from the model.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) text>)
type: String
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) type>)
logprobs: List[Attributes]
token: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content > (attribute) refusal>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) content>)
role: String
The role of the output message. Always `assistant`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) role>)
status: String
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) status>)
type: String
The type of the output message. Always `message`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) type>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) phase>)
queries: List[String]
The queries used to search for files.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) queries>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results > (attribute) text>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) results>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) call_id>)
name: String
The name of the function to run.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) namespace>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) output>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) created_by>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action > (attribute) max_output_length>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) action>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) pending_safety_checks>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions > (attribute) text>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) actions>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) acknowledged_safety_checks>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) summary > (attribute) type>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) summary>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) encrypted_content>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) execution>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) authorization>)
connector\_id: String
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools > (attribute) annotations>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) tools>)
result: String
The generated image encoded in base64.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) result>)
code: String
The code to run, or null if not available.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) container_id>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) outputs > (attribute) url>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) outputs>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) environment > (attribute) container_id>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) environment>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) max_output_length>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) operation > (attribute) type>)
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) operation>)
server\_label: String
The label of the MCP server running the tool.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) server_label>)
approval\_request\_id: String
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) approval_request_id>)
error: String
The error from the tool call, if any.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) error>)
approve: Bool
Whether the request was approved.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) approve>)
reason: String
Optional reason for the decision.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) reason>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) responses > (terraform resource) > (attribute) output > (attribute) input>)
[](<#(resource) responses > (terraform resource) > (attribute) output>)
usage: Attributes
Represents token usage details including input tokens, output tokens,
a breakdown of output tokens, and the total tokens used.
input\_tokens: Int64
The number of input tokens.
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
A detailed breakdown of the input tokens.
cached\_tokens: Int64
The number of tokens that were retrieved from the cache.
[More on prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) input_tokens_details > (attribute) cached_tokens>)
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens.
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) output_tokens>)
output\_tokens\_details: Attributes
A detailed breakdown of the output tokens.
reasoning\_tokens: Int64
The number of reasoning tokens.
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) output_tokens_details > (attribute) reasoning_tokens>)
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) output_tokens_details>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) responses > (terraform resource) > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) responses > (terraform resource) > (attribute) usage>)
### openai\_response
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
`resource "openai\_response" "example\_response" {
background = true
context\_management = [{
type = "type"
compact\_threshold = 1000
}]
conversation = "string"
include = ["file\_search\_call.results"]
input = "string"
instructions = "instructions"
max\_output\_tokens = 16
max\_tool\_calls = 0
metadata = {
foo = "string"
}
model = "gpt-5.1"
parallel\_tool\_calls = true
previous\_response\_id = "previous\_response\_id"
prompt = {
id = "id"
variables = {
foo = "string"
}
version = "version"
}
prompt\_cache\_key = "prompt-cache-key-1234"
prompt\_cache\_retention = "in\_memory"
reasoning = {
effort = "none"
generate\_summary = "auto"
summary = "auto"
}
safety\_identifier = "safety-identifier-1234"
service\_tier = "auto"
store = true
stream = false
stream\_options = {
include\_obfuscation = true
}
temperature = 1
text = {
format = {
type = "text"
}
verbosity = "low"
}
tool\_choice = "none"
tools = [{
name = "name"
parameters = {
foo = "bar"
}
strict = true
type = "function"
defer\_loading = true
description = "description"
}]
top\_logprobs = 0
top\_p = 1
truncation = "auto"
user = "user-1234"
}
`
```
#### data openai\_response
##### required Expand Collapse
response\_id: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) response_id>)
stream: Bool
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section below](https://platform.openai.com/docs/api-reference/responses-streaming)
for more information.
[](<#(resource) responses > (terraform datasource-single) > (attribute) stream>)
##### optional Expand Collapse
include\_obfuscation?: Bool
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events
to normalize payload sizes as a mitigation to certain side-channel
attacks. These obfuscation fields are included by default, but add a
small amount of overhead to the data stream. You can set
`include\_obfuscation` to false to optimize for bandwidth if you trust
the network links between your application and the OpenAI API.
[](<#(resource) responses > (terraform datasource-single) > (attribute) include_obfuscation>)
starting\_after?: Int64
The sequence number of the event after which to start streaming.
[](<#(resource) responses > (terraform datasource-single) > (attribute) starting_after>)
include?: List[String]
Additional fields to include in the response. See the `include`
parameter for Response creation above for more information.
[](<#(resource) responses > (terraform datasource-single) > (attribute) include>)
##### computed Expand Collapse
id: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) id>)
background: Bool
Whether to run the model response in the background.
[Learn more](https://platform.openai.com/docs/guides/background).
[](<#(resource) responses > (terraform datasource-single) > (attribute) background>)
completed\_at: Float64
Unix timestamp (in seconds) of when this Response was completed.
Only present when the status is `completed`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) completed_at>)
created\_at: Float64
Unix timestamp (in seconds) of when this Response was created.
[](<#(resource) responses > (terraform datasource-single) > (attribute) created_at>)
instructions: String
A system (or developer) message inserted into the model’s context.
When using along with `previous\_response\_id`, the instructions from a previous
response will not be carried over to the next response. This makes it simple
to swap out system (or developer) messages in new responses.
[](<#(resource) responses > (terraform datasource-single) > (attribute) instructions>)
max\_output\_tokens: Int64
An upper bound for the number of tokens that can be generated for a response, including visible output tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) responses > (terraform datasource-single) > (attribute) max_output_tokens>)
max\_tool\_calls: Int64
The maximum number of total calls to built-in tools that can be processed in a response. This maximum number applies across all built-in tool calls, not per individual tool. Any further attempts to call a tool by the model will be ignored.
[](<#(resource) responses > (terraform datasource-single) > (attribute) max_tool_calls>)
model: String
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
to browse and compare available models.
[](<#(resource) responses > (terraform datasource-single) > (attribute) model>)
object: String
The object type of this resource - always set to `response`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) object>)
output\_text: String
SDK-only convenience property that contains the aggregated text output
from all `output\_text` items in the `output` array, if any are present.
Supported in the Python and JavaScript SDKs.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output_text>)
parallel\_tool\_calls: Bool
Whether to allow the model to run tool calls in parallel.
[](<#(resource) responses > (terraform datasource-single) > (attribute) parallel_tool_calls>)
previous\_response\_id: String
The unique ID of the previous response to the model. Use this to
create multi-turn conversations. Learn more about
[conversation state](https://platform.openai.com/docs/guides/conversation-state). Cannot be used in conjunction with `conversation`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) previous_response_id>)
prompt\_cache\_key: String
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt_cache_key>)
prompt\_cache\_retention: String
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](https://platform.openai.com/docs/guides/prompt-caching#prompt-cache-retention).
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt_cache_retention>)
safety\_identifier: String
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) responses > (terraform datasource-single) > (attribute) safety_identifier>)
service\_tier: String
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) service_tier>)
status: String
The status of the response generation. One of `completed`, `failed`,
`in\_progress`, `cancelled`, `queued`, or `incomplete`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) status>)
temperature: Float64
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
[](<#(resource) responses > (terraform datasource-single) > (attribute) temperature>)
tool\_choice: String
How the model should select which tool (or tools) to use when generating
a response. See the `tools` parameter to see how to specify which tools
the model can call.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tool_choice>)
top\_logprobs: Int64
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
[](<#(resource) responses > (terraform datasource-single) > (attribute) top_logprobs>)
top\_p: Float64
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
[](<#(resource) responses > (terraform datasource-single) > (attribute) top_p>)
truncation: String
The truncation strategy to use for the model response.
* `auto`: If the input to this Response exceeds
the model’s context window size, the model will truncate the
response to fit the context window by dropping items from the beginning of the conversation.
* `disabled` (default): If the input size will exceed the context window
size for a model, the request will fail with a 400 error.
[](<#(resource) responses > (terraform datasource-single) > (attribute) truncation>)
Deprecateduser: String
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) responses > (terraform datasource-single) > (attribute) user>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) responses > (terraform datasource-single) > (attribute) metadata>)
conversation: Attributes
The conversation that this response belonged to. Input items and output items from this response were automatically added to this conversation.
id: String
The unique ID of the conversation that this response was associated with.
[](<#(resource) responses > (terraform datasource-single) > (attribute) conversation > (attribute) id>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) conversation>)
error: Attributes
An error object returned when the model fails to generate a Response.
code: String
The error code for the response.
[](<#(resource) responses > (terraform datasource-single) > (attribute) error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) responses > (terraform datasource-single) > (attribute) error > (attribute) message>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) error>)
incomplete\_details: Attributes
Details about why the response is incomplete.
reason: String
The reason why the response is incomplete.
[](<#(resource) responses > (terraform datasource-single) > (attribute) incomplete_details > (attribute) reason>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) incomplete_details>)
output: List[Attributes]
An array of content items generated by the model.
* The length and order of items in the `output` array is dependent
on the model’s response.
* Rather than accessing the first item in the `output` array and
assuming it’s an `assistant` message with the content generated by
the model, you might consider using the `output\_text` property where
supported in SDKs.
id: String
The unique ID of the output message.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) id>)
content: List[Attributes]
The content of the output message.
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) annotations>)
text: String
The text output from the model.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) text>)
type: String
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) type>)
logprobs: List[Attributes]
token: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content > (attribute) refusal>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) content>)
role: String
The role of the output message. Always `assistant`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) role>)
status: String
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) status>)
type: String
The type of the output message. Always `message`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) type>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) phase>)
queries: List[String]
The queries used to search for files.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) queries>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results > (attribute) text>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) results>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) call_id>)
name: String
The name of the function to run.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) namespace>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) output>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) created_by>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action > (attribute) max_output_length>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) action>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) pending_safety_checks>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions > (attribute) text>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) actions>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) acknowledged_safety_checks>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) summary > (attribute) type>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) summary>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) encrypted_content>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) execution>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) authorization>)
connector\_id: String
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools > (attribute) annotations>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) tools>)
result: String
The generated image encoded in base64.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) result>)
code: String
The code to run, or null if not available.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) container_id>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) outputs > (attribute) url>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) outputs>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) environment > (attribute) container_id>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) environment>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) max_output_length>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) operation > (attribute) type>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) operation>)
server\_label: String
The label of the MCP server running the tool.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) server_label>)
approval\_request\_id: String
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) approval_request_id>)
error: String
The error from the tool call, if any.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) error>)
approve: Bool
Whether the request was approved.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) approve>)
reason: String
Optional reason for the decision.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) reason>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) responses > (terraform datasource-single) > (attribute) output > (attribute) input>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) output>)
prompt: Attributes
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: String
The unique identifier of the prompt template to use.
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt > (attribute) id>)
variables: Map[String]
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt > (attribute) variables>)
version: String
Optional version of the prompt template.
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt > (attribute) version>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) prompt>)
reasoning: Attributes
**gpt-5 and o-series models only**
Configuration options for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
effort: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) reasoning > (attribute) effort>)
Deprecatedgenerate\_summary: String
**Deprecated:** use `summary` instead.
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) reasoning > (attribute) generate_summary>)
summary: String
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
`concise` is supported for `computer-use-preview` models and all reasoning models after `gpt-5`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) reasoning > (attribute) summary>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) reasoning>)
text: Attributes
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
format: Attributes
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type: String
The type of response format being defined. Always `text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format > (attribute) type>)
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format > (attribute) name>)
schema: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format > (attribute) schema>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format > (attribute) description>)
strict: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format > (attribute) strict>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) format>)
verbosity: String
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) text > (attribute) verbosity>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) text>)
tools: List[Attributes]
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
We support the following categories of tools:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search). Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
* **MCP Tools**: Integrations with third-party systems via custom MCP servers
or predefined connectors such as Google Drive and SharePoint. Learn more about
[MCP Tools](https://platform.openai.com/docs/guides/tools-connectors-mcp).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code with strongly typed arguments
and outputs. Learn more about
[function calling](https://platform.openai.com/docs/guides/function-calling). You can also use
custom tools to call your own code.
name: String
The name of the function to call.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) authorization>)
connector\_id: String
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools > (attribute) search_content_types>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) tools>)
usage: Attributes
Represents token usage details including input tokens, output tokens,
a breakdown of output tokens, and the total tokens used.
input\_tokens: Int64
The number of input tokens.
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
A detailed breakdown of the input tokens.
cached\_tokens: Int64
The number of tokens that were retrieved from the cache.
[More on prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens_details > (attribute) cached_tokens>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens.
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens>)
output\_tokens\_details: Attributes
A detailed breakdown of the output tokens.
reasoning\_tokens: Int64
The number of reasoning tokens.
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens_details > (attribute) reasoning_tokens>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens_details>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) responses > (terraform datasource-single) > (attribute) usage>)
### openai\_response
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
`data "openai\_response" "example\_response" {
response\_id = "resp\_677efb5139a88190b512bc3fef8e535d"
include = ["file\_search\_call.results"]
include\_obfuscation = true
starting\_after = 0
stream = false
}
`
```
#### ResponsesInput Items
#### data openai\_response\_input\_items
##### required Expand Collapse
response\_id: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) response_id>)
##### optional Expand Collapse
order?: String
The order to return the input items in. Default is `desc`.
* `asc`: Return the input items in ascending order.
* `desc`: Return the input items in descending order.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) order>)
include?: List[String]
Additional fields to include in the response. See the `include`
parameter for Response creation above for more information.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) include>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The unique ID of the message input.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) id>)
content: List[Attributes]
A list of one or many input items to the model, containing different content
types.
text: String
The text input to the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) text>)
type: String
The type of the input item. Always `input\_text`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) type>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) detail>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) image_url>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_data>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) filename>)
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations>)
logprobs: List[Attributes]
token: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) refusal>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) content>)
role: String
The role of the message input. One of `user`, `system`, or `developer`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) role>)
type: String
The type of the message input. Always set to `message`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) type>)
status: String
The status of item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) status>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) phase>)
queries: List[String]
The queries used to search for files.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) queries>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) text>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) results>)
call\_id: String
An identifier used when responding to the tool call with output.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) call_id>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks>)
action: Attributes
A click action.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) text>)
query: String
[DEPRECATED] The search query.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) query>)
queries: List[String]
The search queries.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) pattern>)
command: List[String]
The command to run.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) max_output_length>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) action>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) keys>)
path: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) text>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) actions>)
output: Attributes
A computer screenshot image used with the computer use tool.
type: String
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) output > (attribute) type>)
file\_id: String
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) output > (attribute) file_id>)
image\_url: String
The URL of the screenshot image.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) output > (attribute) image_url>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) output>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) arguments>)
name: String
The name of the function to run.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) namespace>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) execution>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
type: String
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) authorization>)
connector\_id: String
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) annotations>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) tools>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) summary > (attribute) type>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) summary>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) encrypted_content>)
result: String
The generated image encoded in base64.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) result>)
code: String
The code to run, or null if not available.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) container_id>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) url>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) outputs>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) environment > (attribute) container_id>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) environment>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) max_output_length>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) type>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) operation>)
server\_label: String
The label of the MCP server.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) server_label>)
error: String
Error message if the server could not list tools.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) error>)
approval\_request\_id: String
The ID of the approval request being answered.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) approval_request_id>)
approve: Bool
Whether the request was approved.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) approve>)
reason: String
Optional reason for the decision.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) reason>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items > (attribute) input>)
[](<#(resource) responses.input_items > (terraform datasource-plural) > (attribute) items>)
### openai\_response\_input\_items
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
`data "openai\_response\_input\_items" "example\_response\_input\_items" {
response\_id = "response\_id"
include = ["file\_search\_call.results"]
order = "asc"
}
`
```