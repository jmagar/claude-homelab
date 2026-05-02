Input Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Responses](/api/reference/terraform/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Input Items
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