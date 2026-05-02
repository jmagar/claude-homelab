Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Conversations](/api/reference/terraform/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Items
Manage conversations and conversation items.
#### resource openai\_conversation\_item
##### required Expand Collapse
conversation\_id: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) conversation_id>)
items: List[Attributes]
The items to add to the conversation. You may add up to 20 items at a time.
content?: String
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) content>)
role?: String
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) role>)
phase?: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) phase>)
type?: String
The type of the message input. Always `message`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) type>)
status?: String
The status of item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) status>)
id?: String
The unique ID of the output message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) id>)
queries?: List[String]
The queries used to search for files.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) queries>)
results?: List[Attributes]
The results of the file search tool call.
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results > (attribute) attributes>)
file\_id?: String
The unique ID of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results > (attribute) file_id>)
filename?: String
The name of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results > (attribute) filename>)
score?: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results > (attribute) score>)
text?: String
The text that was retrieved from the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) results>)
call\_id?: String
An identifier used when responding to the tool call with output.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) call_id>)
pending\_safety\_checks?: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) pending_safety_checks > (attribute) id>)
code?: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) pending_safety_checks > (attribute) code>)
message?: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) pending_safety_checks>)
action?: Attributes
A click action.
button?: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) button>)
type?: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) type>)
x?: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) x>)
y?: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) y>)
keys?: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) keys>)
path?: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) path>)
scroll\_x?: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) scroll_x>)
scroll\_y?: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) scroll_y>)
text?: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) text>)
query?: String
[DEPRECATED] The search query.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) query>)
queries?: List[String]
The search queries.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) queries>)
sources?: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) sources>)
url?: String
The URL opened by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) url>)
pattern?: String
The pattern or text to search for within the page.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) pattern>)
command?: List[String]
The command to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) command>)
env?: Map[String]
Environment variables to set for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) env>)
timeout\_ms?: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) timeout_ms>)
user?: String
Optional user to run the command as.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) user>)
working\_directory?: String
Optional working directory to run the command in.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) working_directory>)
commands?: List[String]
Ordered shell commands for the execution environment to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) commands>)
max\_output\_length?: Int64
Maximum number of UTF-8 characters to capture from combined stdout and stderr output.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action > (attribute) max_output_length>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) action>)
actions?: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button?: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) button>)
type?: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) type>)
x?: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) x>)
y?: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) y>)
keys?: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) keys>)
path?: List[Attributes]
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: Int64
The x-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) path>)
scroll\_x?: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) scroll_x>)
scroll\_y?: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) scroll_y>)
text?: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) actions>)
output?: Attributes
A computer screenshot image used with the computer use tool.
type?: String
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) output > (attribute) type>)
file\_id?: String
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) output > (attribute) file_id>)
image\_url?: String
The URL of the screenshot image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) output > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) output>)
acknowledged\_safety\_checks?: List[Attributes]
The safety checks reported by the API that have been acknowledged by the developer.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) id>)
code?: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) code>)
message?: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) acknowledged_safety_checks>)
arguments?: String
A JSON string of the arguments to pass to the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) arguments>)
name?: String
The name of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) name>)
namespace?: String
The namespace of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) namespace>)
execution?: String
Whether tool search was executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) execution>)
tools?: List[Attributes]
The loaded tool definitions returned by the tool search output.
name?: String
The name of the function to call.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) name>)
parameters?: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) parameters>)
strict?: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) strict>)
type?: String
The type of the function tool. Always `function`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) type>)
defer\_loading?: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) defer_loading>)
description?: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) description>)
vector\_store\_ids?: List[String]
The IDs of the vector stores to search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) vector_store_ids>)
filters?: Attributes
A filter to apply.
key?: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) type>)
value?: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) value>)
filters?: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains?: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) filters>)
max\_num\_results?: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) max_num_results>)
ranking\_options?: Attributes
Ranking options for search.
hybrid\_search?: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker?: String
The ranker to use for the file search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold?: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) ranking_options>)
display\_height?: Int64
The height of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) display_height>)
display\_width?: Int64
The width of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) display_width>)
environment?: String
The type of computer environment to control.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) environment>)
search\_context\_size?: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) search_context_size>)
user\_location?: Attributes
The approximate location of the user.
city?: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) city>)
country?: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) country>)
region?: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone?: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type?: String
The type of location approximation. Always `approximate`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) user_location>)
server\_label?: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) server_label>)
allowed\_tools?: List[String]
List of allowed tool names or a filter object.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) allowed_tools>)
authorization?: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) connector_id>)
headers?: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) headers>)
require\_approval?: Attributes
Specify which of the MCP server’s tools require approval.
always?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always>)
never?: Attributes
A filter object to specify which tools are allowed.
read\_only?: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names?: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) require_approval>)
server\_description?: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) server_description>)
server\_url?: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) server_url>)
container?: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) container>)
action?: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) action>)
background?: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) background>)
input\_fidelity?: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask?: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: String
File ID for the mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url?: String
Base64-encoded mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) input_image_mask>)
model?: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) model>)
moderation?: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) moderation>)
output\_compression?: Int64
Compression level for the output image. Default: 100.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) output_compression>)
output\_format?: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) output_format>)
partial\_images?: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) partial_images>)
quality?: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) quality>)
size?: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) size>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) format>)
tools?: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) name>)
type?: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading?: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description?: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) description>)
parameters?: JSON
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict?: Bool
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) strict>)
format?: Attributes
The input format for the custom tool. Default is unconstrained text.
type?: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition?: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax?: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) tools>)
execution?: String
Whether tool search is executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) execution>)
search\_content\_types?: List[String]
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) search_content_types>)
input\_schema?: JSON
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) input_schema>)
annotations?: JSON
Additional annotations about the tool.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools > (attribute) annotations>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) tools>)
summary?: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) summary > (attribute) text>)
type?: String
The type of the object. Always `summary\_text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) summary > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) summary>)
encrypted\_content?: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) encrypted_content>)
result?: String
The generated image encoded in base64.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) result>)
code?: String
The code to run, or null if not available.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) code>)
container\_id?: String
The ID of the container used to run the code.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) container_id>)
outputs?: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs?: String
The logs output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) outputs > (attribute) logs>)
type?: String
The type of the output. Always `logs`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) outputs > (attribute) type>)
url?: String
The URL of the image output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) outputs > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) outputs>)
environment?: Attributes
The environment to execute the shell commands in.
type?: String
Use a local computer environment.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) type>)
skills?: List[Attributes]
An optional list of skills.
description: String
The description of the skill.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) skills > (attribute) description>)
name: String
The name of the skill.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) skills > (attribute) name>)
path: String
The path to the directory containing the skill.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) skills > (attribute) path>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) skills>)
container\_id?: String
The ID of the referenced container.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) environment>)
max\_output\_length?: Int64
The maximum number of UTF-8 characters captured for this shell call’s combined output.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) max_output_length>)
operation?: Attributes
The specific create, delete, or update instruction for the apply\_patch tool call.
diff?: String
Unified diff content to apply when creating the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create relative to the workspace root.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) operation > (attribute) path>)
type?: String
The operation type. Always `create\_file`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) operation > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) operation>)
server\_label?: String
The label of the MCP server.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) server_label>)
error?: String
Error message if the server could not list tools.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) error>)
approval\_request\_id?: String
The ID of the approval request being answered.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) approval_request_id>)
approve?: Bool
Whether the request was approved.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) approve>)
reason?: String
Optional reason for the decision.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) reason>)
input?: String
The input for the custom tool call generated by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) items > (attribute) input>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) items>)
##### optional Expand Collapse
item\_id?: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) item_id>)
##### computed Expand Collapse
approval\_request\_id: String
The ID of the approval request being answered.
[](<#(resource) conversations.items > (terraform resource) > (attribute) approval_request_id>)
approve: Bool
Whether the request was approved.
[](<#(resource) conversations.items > (terraform resource) > (attribute) approve>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) call_id>)
code: String
The code to run, or null if not available.
[](<#(resource) conversations.items > (terraform resource) > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) conversations.items > (terraform resource) > (attribute) container_id>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) conversations.items > (terraform resource) > (attribute) created_by>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) encrypted_content>)
error: String
Error message if the server could not list tools.
[](<#(resource) conversations.items > (terraform resource) > (attribute) error>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) execution>)
first\_id: String
The ID of the first item in the list.
[](<#(resource) conversations.items > (terraform resource) > (attribute) first_id>)
has\_more: Bool
Whether there are more items available.
[](<#(resource) conversations.items > (terraform resource) > (attribute) has_more>)
id: String
The unique ID of the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) id>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) input>)
last\_id: String
The ID of the last item in the list.
[](<#(resource) conversations.items > (terraform resource) > (attribute) last_id>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) conversations.items > (terraform resource) > (attribute) max_output_length>)
name: String
The name of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) namespace>)
object: String
The type of object returned, must be `list`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) object>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) conversations.items > (terraform resource) > (attribute) output>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) conversations.items > (terraform resource) > (attribute) phase>)
reason: String
Optional reason for the decision.
[](<#(resource) conversations.items > (terraform resource) > (attribute) reason>)
result: String
The generated image encoded in base64.
[](<#(resource) conversations.items > (terraform resource) > (attribute) result>)
role: String
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) role>)
server\_label: String
The label of the MCP server.
[](<#(resource) conversations.items > (terraform resource) > (attribute) server_label>)
status: String
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
[](<#(resource) conversations.items > (terraform resource) > (attribute) status>)
type: String
The type of the message. Always set to `message`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) type>)
queries: List[String]
The queries used to search for files.
[](<#(resource) conversations.items > (terraform resource) > (attribute) queries>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) acknowledged_safety_checks>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) action > (attribute) max_output_length>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) action>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) actions>)
content: List[Attributes]
The content of the message
text: String
The text input to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) text>)
type: String
The type of the input item. Always `input\_text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) type>)
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) annotations>)
logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) refusal>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) detail>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) image_url>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) file_data>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) content > (attribute) filename>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) content>)
data: List[Attributes]
A list of conversation items.
id: String
The unique ID of the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) id>)
content: List[Attributes]
The content of the message
text: String
The text input to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) text>)
type: String
The type of the input item. Always `input\_text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) type>)
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) annotations>)
logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) refusal>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) detail>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) image_url>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) file_data>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content > (attribute) filename>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) content>)
role: String
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) role>)
status: String
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) status>)
type: String
The type of the message. Always set to `message`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) type>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) phase>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) call_id>)
name: String
The name of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) namespace>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) created_by>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) output>)
queries: List[String]
The queries used to search for files.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) queries>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) results>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action > (attribute) max_output_length>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) action>)
result: String
The generated image encoded in base64.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) result>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) pending_safety_checks>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) actions>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) acknowledged_safety_checks>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) execution>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools > (attribute) annotations>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) tools>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) summary > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) summary>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) encrypted_content>)
code: String
The code to run, or null if not available.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) container_id>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) outputs > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) outputs>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) environment > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) environment>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) max_output_length>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) operation > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) operation>)
server\_label: String
The label of the MCP server.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) server_label>)
error: String
Error message if the server could not list tools.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) error>)
approval\_request\_id: String
The ID of the approval request being answered.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) approval_request_id>)
approve: Bool
Whether the request was approved.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) approve>)
reason: String
Optional reason for the decision.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) reason>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) conversations.items > (terraform resource) > (attribute) data > (attribute) input>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) data>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) environment > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) environment>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) conversations.items > (terraform resource) > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) conversations.items > (terraform resource) > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) conversations.items > (terraform resource) > (attribute) operation > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) operation>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) outputs > (attribute) url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) outputs>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform resource) > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) pending_safety_checks>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) conversations.items > (terraform resource) > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) conversations.items > (terraform resource) > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) conversations.items > (terraform resource) > (attribute) results > (attribute) text>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) results>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) conversations.items > (terraform resource) > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) summary > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) summary>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools > (attribute) annotations>)
[](<#(resource) conversations.items > (terraform resource) > (attribute) tools>)
### openai\_conversation\_item
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
`resource "openai\_conversation\_item" "example\_conversation\_item" {
conversation\_id = "conv\_123"
items = [{
content = "string"
role = "user"
phase = "commentary"
type = "message"
}]
}
`
```
#### data openai\_conversation\_item
##### required Expand Collapse
conversation\_id: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) conversation_id>)
item\_id: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) item_id>)
##### optional Expand Collapse
include?: List[String]
Additional fields to include in the response. See the `include`
parameter for [listing Conversation items above](https://platform.openai.com/docs/api-reference/conversations/list-items#conversations_list_items-include) for more information.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) include>)
##### computed Expand Collapse
approval\_request\_id: String
The ID of the approval request being answered.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) approval_request_id>)
approve: Bool
Whether the request was approved.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) approve>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) call_id>)
code: String
The code to run, or null if not available.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) container_id>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) created_by>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) encrypted_content>)
error: String
Error message if the server could not list tools.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) error>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) execution>)
id: String
The unique ID of the message.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) id>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) input>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) max_output_length>)
name: String
The name of the function to run.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) namespace>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) output>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) phase>)
reason: String
Optional reason for the decision.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) reason>)
result: String
The generated image encoded in base64.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) result>)
role: String
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) role>)
server\_label: String
The label of the MCP server.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) server_label>)
status: String
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) status>)
type: String
The type of the message. Always set to `message`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) type>)
queries: List[String]
The queries used to search for files.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) queries>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) acknowledged_safety_checks>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action > (attribute) max_output_length>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) action>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions > (attribute) text>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) actions>)
content: List[Attributes]
The content of the message
text: String
The text input to the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) text>)
type: String
The type of the input item. Always `input\_text`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) type>)
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) annotations>)
logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) refusal>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) detail>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) image_url>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) file_data>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content > (attribute) filename>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) content>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) environment > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) environment>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) operation > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) operation>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) outputs > (attribute) url>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) outputs>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) pending_safety_checks>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results > (attribute) text>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) results>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) summary > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) summary>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools > (attribute) annotations>)
[](<#(resource) conversations.items > (terraform datasource-single) > (attribute) tools>)
### openai\_conversation\_item
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
`data "openai\_conversation\_item" "example\_conversation\_item" {
conversation\_id = "conv\_123"
item\_id = "msg\_abc"
include = ["file\_search\_call.results"]
}
`
```
#### data openai\_conversation\_items
##### required Expand Collapse
conversation\_id: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) conversation_id>)
##### optional Expand Collapse
order?: String
The order to return the input items in. Default is `desc`.
* `asc`: Return the input items in ascending order.
* `desc`: Return the input items in descending order.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) order>)
include?: List[String]
Specify additional output data to include in the model response. Currently supported values are:
* `web\_search\_call.action.sources`: Include the sources of the web search tool call.
* `code\_interpreter\_call.outputs`: Includes the outputs of python code execution in code interpreter tool call items.
* `computer\_call\_output.output.image\_url`: Include image urls from the computer call output.
* `file\_search\_call.results`: Include the search results of the file search tool call.
* `message.input\_image.image\_url`: Include image urls from the input message.
* `message.output\_text.logprobs`: Include logprobs with assistant messages.
* `reasoning.encrypted\_content`: Includes an encrypted version of reasoning tokens in reasoning item outputs. This enables reasoning items to be used in multi-turn conversations when using the Responses API statelessly (like when the `store` parameter is set to `false`, or when an organization is enrolled in the zero data retention program).
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) include>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The unique ID of the message.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) id>)
content: List[Attributes]
The content of the message
text: String
The text input to the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) text>)
type: String
The type of the input item. Always `input\_text`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) type>)
annotations: List[Attributes]
The annotations of the text output.
file\_id: String
The ID of the file.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) file_id>)
filename: String
The filename of the file cited.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) filename>)
index: Int64
The index of the file in the list of files.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) index>)
type: String
The type of the file citation. Always `file\_citation`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) type>)
end\_index: Int64
The index of the last character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) end_index>)
start\_index: Int64
The index of the first character of the URL citation in the message.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) start_index>)
title: String
The title of the web resource.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) title>)
url: String
The URL of the web resource.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) url>)
container\_id: String
The ID of the container file.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) annotations>)
logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) logprob>)
top\_logprobs: List[Attributes]
token: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) token>)
bytes: List[Int64]
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) bytes>)
logprob: Float64
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs > (attribute) logprob>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs > (attribute) top_logprobs>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) logprobs>)
refusal: String
The refusal explanation from the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) refusal>)
detail: String
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) detail>)
file\_id: String
The ID of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_id>)
image\_url: String
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) image_url>)
file\_data: String
The content of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_data>)
file\_url: String
The URL of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) file_url>)
filename: String
The name of the file to be sent to the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content > (attribute) filename>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) content>)
role: String
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) role>)
status: String
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) status>)
type: String
The type of the message. Always set to `message`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) type>)
phase: String
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) phase>)
arguments: String
A JSON string of the arguments to pass to the function.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) arguments>)
call\_id: String
The unique ID of the function tool call generated by the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) call_id>)
name: String
The name of the function to run.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) name>)
namespace: String
The namespace of the function to run.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) namespace>)
created\_by: String
The identifier of the actor that created the item.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
output: String
The output from the function call generated by your code.
Can be a string or an list of output content.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) output>)
queries: List[String]
The queries used to search for files.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) queries>)
results: List[Attributes]
The results of the file search tool call.
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) attributes>)
file\_id: String
The unique ID of the file.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) file_id>)
filename: String
The name of the file.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) filename>)
score: Float64
The relevance score of the file - a value between 0 and 1.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) score>)
text: String
The text that was retrieved from the file.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) text>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) results>)
action: Attributes
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
query: String
[DEPRECATED] The search query.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) query>)
type: String
The action type.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) type>)
queries: List[String]
The search queries.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) queries>)
sources: List[Attributes]
The sources used in the search.
type: String
The type of source. Always `url`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources > (attribute) type>)
url: String
The URL of the source.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources > (attribute) url>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) sources>)
url: String
The URL opened by the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) url>)
pattern: String
The pattern or text to search for within the page.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) pattern>)
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) button>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) text>)
command: List[String]
The command to run.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) command>)
env: Map[String]
Environment variables to set for the command.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) env>)
timeout\_ms: Int64
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) timeout_ms>)
user: String
Optional user to run the command as.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) user>)
working\_directory: String
Optional working directory to run the command in.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) working_directory>)
commands: List[String]
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) commands>)
max\_output\_length: Int64
Optional maximum number of characters to return from each command.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action > (attribute) max_output_length>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) action>)
result: String
The generated image encoded in base64.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) result>)
pending\_safety\_checks: List[Attributes]
The pending safety checks for the computer call.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) pending_safety_checks>)
actions: List[Attributes]
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
button: String
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) button>)
type: String
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) type>)
x: Int64
The x-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) x>)
y: Int64
The y-coordinate where the click occurred.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) y>)
keys: List[String]
The keys being held while clicking.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) keys>)
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
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path > (attribute) x>)
y: Int64
The y-coordinate.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path > (attribute) y>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) path>)
scroll\_x: Int64
The horizontal scroll distance.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) scroll_x>)
scroll\_y: Int64
The vertical scroll distance.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) scroll_y>)
text: String
The text to type.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions > (attribute) text>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) actions>)
acknowledged\_safety\_checks: List[Attributes]
The safety checks reported by the API that have been acknowledged by the
developer.
id: String
The ID of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) id>)
code: String
The type of the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) code>)
message: String
Details about the pending safety check.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks > (attribute) message>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) acknowledged_safety_checks>)
execution: String
Whether tool search was executed by the server or by the client.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) execution>)
tools: List[Attributes]
The loaded tool definitions returned by tool search.
name: String
The name of the function to call.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) name>)
parameters: Map[JSON]
A JSON schema object describing the parameters of the function.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) parameters>)
strict: Bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) strict>)
type: String
The type of the function tool. Always `function`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function is deferred and loaded via tool search.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) defer_loading>)
description: String
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) description>)
vector\_store\_ids: List[String]
The IDs of the vector stores to search.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) vector_store_ids>)
filters: Attributes
A filter to apply.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) value>)
filters: List[Attributes]
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
key: String
The key to compare against the value.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) key>)
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
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) type>)
value: String
The value to compare against the attribute key; supports string, number, or boolean types.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters > (attribute) value>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) filters>)
allowed\_domains: List[String]
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters > (attribute) allowed_domains>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) filters>)
max\_num\_results: Int64
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) max_num_results>)
ranking\_options: Attributes
Ranking options for search.
hybrid\_search: Attributes
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: Float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) embedding_weight>)
text\_weight: Float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search > (attribute) text_weight>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) hybrid_search>)
ranker: String
The ranker to use for the file search.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) ranker>)
score\_threshold: Float64
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options > (attribute) score_threshold>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) ranking_options>)
display\_height: Int64
The height of the computer display.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) display_height>)
display\_width: Int64
The width of the computer display.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) display_width>)
environment: String
The type of computer environment to control.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) environment>)
search\_context\_size: String
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) search_context_size>)
user\_location: Attributes
The approximate location of the user.
city: String
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) city>)
country: String
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) country>)
region: String
Free text input for the region of the user, e.g. `California`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) region>)
timezone: String
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) timezone>)
type: String
The type of location approximation. Always `approximate`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) user_location>)
server\_label: String
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_label>)
allowed\_tools: List[String]
List of allowed tool names or a filter object.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) allowed_tools>)
authorization: String
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) authorization>)
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
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) connector_id>)
headers: Map[String]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) headers>)
require\_approval: Attributes
Specify which of the MCP server’s tools require approval.
always: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) always>)
never: Attributes
A filter object to specify which tools are allowed.
read\_only: Bool
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) read_only>)
tool\_names: List[String]
List of allowed tool names.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never > (attribute) tool_names>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval > (attribute) never>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) require_approval>)
server\_description: String
Optional description of the MCP server, used to provide more context.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_description>)
server\_url: String
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) server_url>)
container: String
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) container>)
action: String
Whether to generate a new image or edit an existing image. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) action>)
background: String
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) background>)
input\_fidelity: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_fidelity>)
input\_image\_mask: Attributes
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: String
File ID for the mask image.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) file_id>)
image\_url: String
Base64-encoded mask image.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask > (attribute) image_url>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_image_mask>)
model: String
The image generation model to use. Default: `gpt-image-1`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) model>)
moderation: String
Moderation level for the generated image. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) moderation>)
output\_compression: Int64
Compression level for the output image. Default: 100.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) output_compression>)
output\_format: String
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) output_format>)
partial\_images: Int64
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) partial_images>)
quality: String
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) quality>)
size: String
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) size>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) format>)
tools: List[Attributes]
The function/custom tools available inside this namespace.
name: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) name>)
type: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) type>)
defer\_loading: Bool
Whether this function should be deferred and discovered via tool search.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) defer_loading>)
description: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) description>)
parameters: JSON
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) parameters>)
strict: Bool
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) strict>)
format: Attributes
The input format for the custom tool. Default is unconstrained text.
type: String
Unconstrained text format. Always `text`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) type>)
definition: String
The grammar definition.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) definition>)
syntax: String
The syntax of the grammar definition. One of `lark` or `regex`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format > (attribute) syntax>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools > (attribute) format>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) tools>)
execution: String
Whether tool search is executed by the server or by the client.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) execution>)
search\_content\_types: List[String]
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) search_content_types>)
input\_schema: JSON
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) input_schema>)
annotations: JSON
Additional annotations about the tool.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools > (attribute) annotations>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) tools>)
summary: List[Attributes]
Reasoning summary content.
text: String
A summary of the reasoning output from the model so far.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) summary > (attribute) text>)
type: String
The type of the object. Always `summary\_text`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) summary > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) summary>)
encrypted\_content: String
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) encrypted_content>)
code: String
The code to run, or null if not available.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) code>)
container\_id: String
The ID of the container used to run the code.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) container_id>)
outputs: List[Attributes]
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
logs: String
The logs output from the code interpreter.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) logs>)
type: String
The type of the output. Always `logs`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) type>)
url: String
The URL of the image output from the code interpreter.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) outputs > (attribute) url>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) outputs>)
environment: Attributes
Represents the use of a local environment to perform shell actions.
type: String
The environment type. Always `local`.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) environment > (attribute) type>)
container\_id: String
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) environment > (attribute) container_id>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) environment>)
max\_output\_length: Int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) max_output_length>)
operation: Attributes
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
diff: String
Diff to apply.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) diff>)
path: String
Path of the file to create.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) path>)
type: String
Create a new file with the provided diff.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) operation > (attribute) type>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) operation>)
server\_label: String
The label of the MCP server.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) server_label>)
error: String
Error message if the server could not list tools.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) error>)
approval\_request\_id: String
The ID of the approval request being answered.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) approval_request_id>)
approve: Bool
Whether the request was approved.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) approve>)
reason: String
Optional reason for the decision.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) reason>)
input: String
The input for the custom tool call generated by the model.
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items > (attribute) input>)
[](<#(resource) conversations.items > (terraform datasource-plural) > (attribute) items>)
### openai\_conversation\_items
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
`data "openai\_conversation\_items" "example\_conversation\_items" {
conversation\_id = "conv\_123"
include = ["file\_search\_call.results"]
order = "asc"
}
`
```