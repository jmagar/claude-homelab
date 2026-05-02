Runs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Evals](/api/reference/terraform/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Runs
Manage and run evals in the OpenAI platform.
#### resource openai\_eval\_run
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs > (terraform resource) > (attribute) eval_id>)
data\_source: Attributes
Details about the run’s data source.
source: Attributes
Determines what populates the `item` namespace in the data source.
content?: List[Attributes]
The content of the jsonl file.
item: Map[JSON]
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) content > (attribute) item>)
sample?: Map[JSON]
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) content > (attribute) sample>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) content>)
type?: String
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) type>)
id?: String
The identifier of the file.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) id>)
created\_after?: Int64
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) created_after>)
created\_before?: Int64
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) created_before>)
limit?: Int64
An optional maximum number of items to return.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) limit>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) metadata>)
model?: String
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) model>)
instructions\_search?: String
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) instructions_search>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) reasoning_effort>)
temperature?: Float64
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) temperature>)
tools?: List[String]
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) tools>)
top\_p?: Float64
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) top_p>)
users?: List[String]
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source > (attribute) users>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) source>)
type?: String
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) type>)
input\_messages?: Attributes
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
template?: List[Attributes]
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
content: String
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) content>)
role: String
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) role>)
phase?: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) phase>)
type?: String
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) type>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) template>)
type: String
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) type>)
item\_reference?: String
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages > (attribute) item_reference>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) input_messages>)
model?: String
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) model>)
sampling\_params?: Attributes
max\_completion\_tokens?: Int64
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) max_completion_tokens>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) reasoning_effort>)
response\_format?: Attributes
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type: String
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) type>)
json\_schema?: Attributes
Structured Outputs configuration options, including a JSON Schema.
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) name>)
description?: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) description>)
schema?: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) schema>)
strict?: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) strict>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format>)
seed?: Int64
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) seed>)
temperature?: Float64
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) temperature>)
tools?: List[Attributes]
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function?: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) name>)
description?: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) description>)
parameters?: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) parameters>)
strict?: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function>)
type?: String
The type of the tool. Currently, only `function` is supported.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) type>)
name?: String
The name of the function to call.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) name>)
parameters?: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) parameters>)
strict?: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) strict>)
defer\_loading?: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) defer_loading>)
description?: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) description>)
vector\_store\_ids?: List[String]
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) vector_store_ids>)
filters?: Attributes
A filter to apply.
key?: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) type>)
value?: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) value>)
filters?: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains?: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters>)
max\_num\_results?: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) max_num_results>)
ranking\_options?: Attributes
Ranking options for search.
hybrid\_search?: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker?: String
The ranker to use for the file search.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold?: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options>)
display\_height?: Int64
The height of the computer display.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_height>)
display\_width?: Int64
The width of the computer display.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_width>)
environment?: String
The type of computer environment to control.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) environment>)
search\_context\_size?: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_context_size>)
user\_location?: Attributes
The approximate location of the user.
city?: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) city>)
country?: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) country>)
region?: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone?: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type?: String
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location>)
server\_label?: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_label>)
allowed\_tools?: List[String]
List of allowed tool names or a filter object.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) allowed_tools>)
authorization?: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) connector_id>)
headers?: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) headers>)
require\_approval?: Attributes
Specify which of the MCP server’s tools require approval.
always?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always>)
never?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval>)
server\_description?: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_description>)
server\_url?: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_url>)
container?: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) container>)
action?: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) action>)
background?: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) background>)
input\_fidelity?: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask?: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: String
File ID for the mask image.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url?: String
Base64-encoded mask image.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask>)
model?: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) model>)
moderation?: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) moderation>)
output\_compression?: Int64
Compression level for the output image. Default: 100.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_compression>)
output\_format?: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_format>)
partial\_images?: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) partial_images>)
quality?: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) quality>)
size?: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) size>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format>)
tools?: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) name>)
type?: String
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading?: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description?: String
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) description>)
parameters?: JSON
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict?: Bool
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) strict>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools>)
execution?: String
Whether tool search is executed by the server or by the client.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) execution>)
search\_content\_types?: List[String]
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_content_types>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) tools>)
top\_p?: Float64
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) top_p>)
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
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) type>)
name?: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) name>)
schema?: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) schema>)
description?: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) description>)
strict?: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) strict>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params > (attribute) text>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source > (attribute) sampling_params>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) data_source>)
##### optional Expand Collapse
name?: String
The name of the run.
[](<#(resource) evals.runs > (terraform resource) > (attribute) name>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform resource) > (attribute) metadata>)
##### computed Expand Collapse
id: String
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs > (terraform resource) > (attribute) created_at>)
model: String
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (terraform resource) > (attribute) model>)
object: String
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (terraform resource) > (attribute) object>)
report\_url: String
The URL to the rendered evaluation run report on the UI dashboard.
[](<#(resource) evals.runs > (terraform resource) > (attribute) report_url>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs > (terraform resource) > (attribute) status>)
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs > (terraform resource) > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs > (terraform resource) > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) error>)
per\_model\_usage: List[Attributes]
Usage statistics for each model during the evaluation run.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) completion_tokens>)
invocation\_count: Int64
The number of invocations.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) invocation_count>)
model\_name: String
The name of the model.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) model_name>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage > (attribute) total_tokens>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_model_usage>)
per\_testing\_criteria\_results: List[Attributes]
Results per testing criteria applied during the evaluation run.
failed: Int64
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_testing_criteria_results > (attribute) failed>)
passed: Int64
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_testing_criteria_results > (attribute) passed>)
testing\_criteria: String
A description of the testing criteria.
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_testing_criteria_results > (attribute) testing_criteria>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) per_testing_criteria_results>)
result\_counts: Attributes
Counters summarizing the outcomes of the evaluation run.
errored: Int64
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (terraform resource) > (attribute) result_counts > (attribute) errored>)
failed: Int64
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (terraform resource) > (attribute) result_counts > (attribute) failed>)
passed: Int64
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (terraform resource) > (attribute) result_counts > (attribute) passed>)
total: Int64
Total number of executed output items.
[](<#(resource) evals.runs > (terraform resource) > (attribute) result_counts > (attribute) total>)
[](<#(resource) evals.runs > (terraform resource) > (attribute) result_counts>)
#### data openai\_eval\_run
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) eval_id>)
##### optional Expand Collapse
run\_id?: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) run_id>)
find\_one\_by?: Attributes
order?: String
Sort order for runs by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
status?: String
Filter runs by status. One of `queued` | `in\_progress` | `failed` | `completed` | `canceled`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) find_one_by > (attribute) status>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) created_at>)
model: String
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) model>)
name: String
The name of the evaluation run.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) name>)
object: String
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) object>)
report\_url: String
The URL to the rendered evaluation run report on the UI dashboard.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) report_url>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) status>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) metadata>)
data\_source: Attributes
Information about the run’s data source.
source: Attributes
Determines what populates the `item` namespace in the data source.
content: List[Attributes]
The content of the jsonl file.
item: Map[JSON]
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) content > (attribute) item>)
sample: Map[JSON]
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) content > (attribute) sample>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) content>)
type: String
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) type>)
id: String
The identifier of the file.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) id>)
created\_after: Int64
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) created_after>)
created\_before: Int64
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) created_before>)
limit: Int64
An optional maximum number of items to return.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) limit>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) metadata>)
model: String
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) model>)
instructions\_search: String
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) instructions_search>)
reasoning\_effort: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) reasoning_effort>)
temperature: Float64
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) temperature>)
tools: List[String]
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) tools>)
top\_p: Float64
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) top_p>)
users: List[String]
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source > (attribute) users>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) source>)
type: String
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) type>)
input\_messages: Attributes
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
template: List[Attributes]
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
content: String
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) content>)
role: String
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) role>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) phase>)
type: String
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) type>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) template>)
type: String
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) type>)
item\_reference: String
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages > (attribute) item_reference>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) input_messages>)
model: String
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) model>)
sampling\_params: Attributes
max\_completion\_tokens: Int64
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) max_completion_tokens>)
reasoning\_effort: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) reasoning_effort>)
response\_format: Attributes
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type: String
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) type>)
json\_schema: Attributes
Structured Outputs configuration options, including a JSON Schema.
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) name>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) description>)
schema: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) schema>)
strict: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) response_format>)
seed: Int64
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) seed>)
temperature: Float64
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) temperature>)
tools: List[Attributes]
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) name>)
description: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) description>)
parameters: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) parameters>)
strict: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function>)
type: String
The type of the tool. Currently, only `function` is supported.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) type>)
name: String
The name of the function to call.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) strict>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_content_types>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) tools>)
top\_p: Float64
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) top_p>)
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
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) type>)
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) name>)
schema: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) schema>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) description>)
strict: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params > (attribute) text>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source > (attribute) sampling_params>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) data_source>)
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) error>)
per\_model\_usage: List[Attributes]
Usage statistics for each model during the evaluation run.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) completion_tokens>)
invocation\_count: Int64
The number of invocations.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) invocation_count>)
model\_name: String
The name of the model.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) model_name>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage > (attribute) total_tokens>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_model_usage>)
per\_testing\_criteria\_results: List[Attributes]
Results per testing criteria applied during the evaluation run.
failed: Int64
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_testing_criteria_results > (attribute) failed>)
passed: Int64
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_testing_criteria_results > (attribute) passed>)
testing\_criteria: String
A description of the testing criteria.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_testing_criteria_results > (attribute) testing_criteria>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) per_testing_criteria_results>)
result\_counts: Attributes
Counters summarizing the outcomes of the evaluation run.
errored: Int64
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) result_counts > (attribute) errored>)
failed: Int64
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) result_counts > (attribute) failed>)
passed: Int64
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) result_counts > (attribute) passed>)
total: Int64
Total number of executed output items.
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) result_counts > (attribute) total>)
[](<#(resource) evals.runs > (terraform datasource-single) > (attribute) result_counts>)
#### data openai\_eval\_runs
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) eval_id>)
##### optional Expand Collapse
status?: String
Filter runs by status. One of `queued` | `in\_progress` | `failed` | `completed` | `canceled`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) status>)
order?: String
Sort order for runs by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the evaluation run.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
data\_source: Attributes
Information about the run’s data source.
source: Attributes
Determines what populates the `item` namespace in the data source.
content: List[Attributes]
The content of the jsonl file.
item: Map[JSON]
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) content > (attribute) item>)
sample: Map[JSON]
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) content > (attribute) sample>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) content>)
type: String
The type of jsonl source. Always `file\_content`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) type>)
id: String
The identifier of the file.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) id>)
created\_after: Int64
An optional Unix timestamp to filter items created after this time.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) created_after>)
created\_before: Int64
An optional Unix timestamp to filter items created before this time.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) created_before>)
limit: Int64
An optional maximum number of items to return.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) limit>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) metadata>)
model: String
An optional model to filter by (e.g., ‘gpt-4o’).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) model>)
instructions\_search: String
Optional string to search the ‘instructions’ field. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) instructions_search>)
reasoning\_effort: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) reasoning_effort>)
temperature: Float64
Sampling temperature. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) temperature>)
tools: List[String]
List of tool names. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) tools>)
top\_p: Float64
Nucleus sampling parameter. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) top_p>)
users: List[String]
List of user identifiers. This is a query parameter used to select responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source > (attribute) users>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) source>)
type: String
The type of data source. Always `jsonl`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) type>)
input\_messages: Attributes
Used when sampling from a model. Dictates the structure of the messages passed into the model. Can either be a reference to a prebuilt trajectory (ie, `item.input\_trajectory`), or a template with variable references to the `item` namespace.
template: List[Attributes]
A list of chat messages forming the prompt or context. May include variable references to the `item` namespace, ie {{item.name}}.
content: String
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) content>)
role: String
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) role>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) phase>)
type: String
The type of the message input. Always `message`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) template > (attribute) type>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) template>)
type: String
The type of input messages. Always `template`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) type>)
item\_reference: String
A reference to a variable in the `item` namespace. Ie, “item.input\_trajectory”
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages > (attribute) item_reference>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) input_messages>)
model: String
The name of the model to use for generating completions (e.g. “o3-mini”).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) model>)
sampling\_params: Attributes
max\_completion\_tokens: Int64
The maximum number of tokens in the generated output.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) max_completion_tokens>)
reasoning\_effort: String
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) reasoning_effort>)
response\_format: Attributes
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type: String
The type of response format being defined. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) type>)
json\_schema: Attributes
Structured Outputs configuration options, including a JSON Schema.
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) name>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) description>)
schema: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) schema>)
strict: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format > (attribute) json_schema>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) response_format>)
seed: Int64
A seed value to initialize the randomness, during sampling.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) seed>)
temperature: Float64
A higher temperature increases randomness in the outputs.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) temperature>)
tools: List[Attributes]
A list of tools the model may call. Currently, only functions are supported as a tool. Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are supported.
function: Attributes
name: String
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) name>)
description: String
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) description>)
parameters: Map[JSON]
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) parameters>)
strict: Bool
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) function>)
type: String
The type of the tool. Currently, only `function` is supported.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) type>)
name: String
The name of the function to call.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) strict>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools > (attribute) search_content_types>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) tools>)
top\_p: Float64
An alternative to temperature for nucleus sampling; 1.0 includes all tokens.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) top_p>)
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
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) type>)
name: String
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) name>)
schema: Map[JSON]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) schema>)
description: String
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) description>)
strict: Bool
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format > (attribute) strict>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text > (attribute) format>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params > (attribute) text>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source > (attribute) sampling_params>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) data_source>)
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) error>)
eval\_id: String
The identifier of the associated evaluation.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) eval_id>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
model: String
The model that is evaluated, if applicable.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) model>)
name: String
The name of the evaluation run.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The type of the object. Always “eval.run”.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) object>)
per\_model\_usage: List[Attributes]
Usage statistics for each model during the evaluation run.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) completion_tokens>)
invocation\_count: Int64
The number of invocations.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) invocation_count>)
model\_name: String
The name of the model.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) model_name>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage > (attribute) total_tokens>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_model_usage>)
per\_testing\_criteria\_results: List[Attributes]
Results per testing criteria applied during the evaluation run.
failed: Int64
Number of tests failed for this criteria.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_testing_criteria_results > (attribute) failed>)
passed: Int64
Number of tests passed for this criteria.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_testing_criteria_results > (attribute) passed>)
testing\_criteria: String
A description of the testing criteria.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_testing_criteria_results > (attribute) testing_criteria>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) per_testing_criteria_results>)
report\_url: String
The URL to the rendered evaluation run report on the UI dashboard.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) report_url>)
result\_counts: Attributes
Counters summarizing the outcomes of the evaluation run.
errored: Int64
Number of output items that resulted in an error.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) result_counts > (attribute) errored>)
failed: Int64
Number of output items that failed to pass the evaluation.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) result_counts > (attribute) failed>)
passed: Int64
Number of output items that passed the evaluation.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) result_counts > (attribute) passed>)
total: Int64
Total number of executed output items.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) result_counts > (attribute) total>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) result_counts>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items > (attribute) status>)
[](<#(resource) evals.runs > (terraform datasource-plural) > (attribute) items>)
#### RunsOutput Items
Manage and run evals in the OpenAI platform.
#### data openai\_eval\_run\_output\_item
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) eval_id>)
output\_item\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) output_item_id>)
run\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) run_id>)
##### computed Expand Collapse
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) created_at>)
datasource\_item\_id: Int64
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) datasource_item_id>)
id: String
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) id>)
object: String
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) object>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) status>)
datasource\_item: Map[JSON]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) datasource_item>)
results: List[Attributes]
A list of grader results for this output item.
name: String
The name of the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) name>)
passed: Bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) passed>)
score: Float64
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) score>)
sample: Map[JSON]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) sample>)
type: String
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) type>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results>)
sample: Attributes
A sample containing the input and output of the evaluation run.
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error>)
finish\_reason: String
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) finish_reason>)
input: List[Attributes]
An array of input messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input > (attribute) content>)
role: String
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input>)
max\_completion\_tokens: Int64
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) max_completion_tokens>)
model: String
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) model>)
output: List[Attributes]
An array of output messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output > (attribute) content>)
role: String
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output>)
seed: Int64
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) seed>)
temperature: Float64
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) temperature>)
top\_p: Float64
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) top_p>)
usage: Attributes
Token usage details for the sample.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample>)
#### data openai\_eval\_run\_output\_items
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) eval_id>)
run\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) run_id>)
##### optional Expand Collapse
status?: String
Filter output items by status. Use `failed` to filter by failed output
items or `pass` to filter by passed output items.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) status>)
order?: String
Sort order for output items by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
datasource\_item: Map[JSON]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) datasource_item>)
datasource\_item\_id: Int64
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) datasource_item_id>)
eval\_id: String
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) eval_id>)
object: String
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) object>)
results: List[Attributes]
A list of grader results for this output item.
name: String
The name of the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) name>)
passed: Bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) passed>)
score: Float64
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) score>)
sample: Map[JSON]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) sample>)
type: String
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) type>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results>)
run\_id: String
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) run_id>)
sample: Attributes
A sample containing the input and output of the evaluation run.
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error>)
finish\_reason: String
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) finish_reason>)
input: List[Attributes]
An array of input messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input > (attribute) content>)
role: String
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input>)
max\_completion\_tokens: Int64
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) max_completion_tokens>)
model: String
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) model>)
output: List[Attributes]
An array of output messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output > (attribute) content>)
role: String
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output>)
seed: Int64
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) seed>)
temperature: Float64
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) temperature>)
top\_p: Float64
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) top_p>)
usage: Attributes
Token usage details for the sample.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) status>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items>)