Input Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Responses](/api/reference/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Input Items
##### [List input items](/api/reference/resources/responses/subresources/input_items/methods/list)
GET/responses/{response\_id}/input\_items
##### ModelsExpand Collapse
ResponseItemList object { data, first\_id, has\_more, 2 more }
A list of Response items.
data: array of [ResponseInputMessageItem](</api/reference/resources/responses#(resource) responses > (model) response_input_message_item > (schema)>) { id, content, role, 2 more } or [ResponseOutputMessage](</api/reference/resources/responses#(resource) responses > (model) response_output_message > (schema)>) { id, content, role, 3 more } or object { id, queries, status, 2 more } or 23 more
A list of items used to generate this response.
One of the following:
ResponseInputMessageItem object { id, content, role, 2 more }
id: string
The unique ID of the message input.
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) id>)
content: [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
A list of one or many input items to the model, containing different content
types.
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) content>)
role: "user" or "system" or "developer"
The role of the message input. One of `user`, `system`, or `developer`.
One of the following:
"user"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) role > (member) 0>)
"system"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) role > (member) 1>)
"developer"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) role > (member) 2>)
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) role>)
type: "message"
The type of the message input. Always set to `message`.
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) type>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_message_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_input_message_item > (schema)>)
ResponseOutputMessage object { id, content, role, 3 more }
An output message from the model.
id: string
The unique ID of the output message.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) id>)
content: array of [ResponseOutputText](</api/reference/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, logprobs, text, type } or [ResponseOutputRefusal](</api/reference/resources/responses#(resource) responses > (model) response_output_refusal > (schema)>) { refusal, type }
The content of the output message.
One of the following:
ResponseOutputText object { annotations, logprobs, text, type }
A text output from the model.
annotations: array of object { file\_id, filename, index, type } or object { end\_index, start\_index, title, 2 more } or object { container\_id, end\_index, file\_id, 3 more } or object { file\_id, index, type }
The annotations of the text output.
One of the following:
FileCitation object { file\_id, filename, index, type }
A citation to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) file_id>)
filename: string
The filename of the file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) filename>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) index>)
type: "file\_citation"
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URLCitation object { end\_index, start\_index, title, 2 more }
A citation for a web resource used to generate a model response.
end\_index: number
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) end_index>)
start\_index: number
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) start_index>)
title: string
The title of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) title>)
type: "url\_citation"
The type of the URL citation. Always `url\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
url: string
The URL of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
ContainerFileCitation object { container\_id, end\_index, file\_id, 3 more }
A citation for a container file used to generate a model response.
container\_id: string
The ID of the container file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) container_id>)
end\_index: number
The index of the last character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) end_index>)
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) file_id>)
filename: string
The filename of the container file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) filename>)
start\_index: number
The index of the first character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) start_index>)
type: "container\_file\_citation"
The type of the container file citation. Always `container\_file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2>)
FilePath object { file\_id, index, type }
A path to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) file_id>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) index>)
type: "file\_path"
The type of the file path. Always `file\_path`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations>)
logprobs: array of object { token, bytes, logprob, top\_logprobs }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: array of object { token, bytes, logprob }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
ResponseOutputRefusal object { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) content>)
role: "assistant"
The role of the output message. Always `assistant`.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) role>)
status: "in\_progress" or "completed" or "incomplete"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status>)
type: "message"
The type of the output message. Always `message`.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) type>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase>)
[](<#(resource) responses > (model) response_output_message > (schema)>)
FileSearchCall object { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) id>)
queries: array of string
The queries used to search for files.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) queries>)
status: "in\_progress" or "searching" or "completed" or 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status > (member) 4>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) type>)
results: optional array of object { attributes, file\_id, filename, 2 more }
The results of the file search tool call.
attributes: optional map[string or number or boolean]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) attributes>)
file\_id: optional string
The unique ID of the file.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) file_id>)
filename: optional string
The name of the file.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) filename>)
score: optional number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) score>)
text: optional string
The text that was retrieved from the file.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results > (items) > (property) text>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2 > (property) results>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 2>)
ComputerCall object { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
pending\_safety\_checks: array of object { id, code, message }
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) pending_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) pending_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) pending_safety_checks>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
action: optional [ComputerAction](</api/reference/resources/responses#(resource) responses > (model) computer_action > (schema)>)
A click action.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) action>)
actions: optional [ComputerActionList](</api/reference/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { Click, DoubleClick, Drag, 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3 > (property) actions>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 3>)
ComputerCallOutput object { id, call\_id, output, 4 more }
id: string
The unique ID of the computer call tool output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
call\_id: string
The ID of the computer tool call that produced the output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) output>)
status: "completed" or "incomplete" or "failed" or "in\_progress"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) status > (member) 0>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) status > (member) 1>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) status > (member) 2>)
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) status > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) status>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
acknowledged\_safety\_checks: optional array of object { id, code, message }
The safety checks reported by the API that have been acknowledged by the
developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) acknowledged_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) acknowledged_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) acknowledged_safety_checks>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 4>)
WebSearchCall object { id, action, status, type }
The results of a web search tool call. See the
[web search guide](/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
action: object { query, type, queries, sources } or object { type, url } or object { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search object { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) type>)
queries: optional array of string
The search queries.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) queries>)
sources: optional array of object { type, url }
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 0>)
OpenPage object { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 1 > (property) type>)
url: optional string
The URL opened by the model.
formaturi
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 1>)
FindInPage object { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action > (variant) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) action>)
status: "in\_progress" or "searching" or "completed" or "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) status > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 5>)
FunctionCall object { id, arguments, call\_id, 5 more }
id: string
The unique ID of the function tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) id>)
arguments: string
A JSON string of the arguments to pass to the function.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) arguments>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) call_id>)
name: string
The name of the function to run.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) name>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) status>)
type: "function\_call"
The type of the function tool call. Always `function\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) created_by>)
namespace: optional string
The namespace of the function to run.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6 > (property) namespace>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 6>)
FunctionCallOutput object { id, call\_id, output, 3 more }
id: string
The unique ID of the function call tool output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) id>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) call_id>)
output: string or array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
StringOutput = string
A string of the output of the function call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) output > (variant) 0>)
OutputContentList = array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the function call.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) output > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) output>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) status>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 7>)
ToolSearchCall object { id, arguments, call\_id, 4 more }
id: string
The unique ID of the tool search call item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) id>)
arguments: unknown
Arguments used for the tool search call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) arguments>)
call\_id: string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) call_id>)
execution: "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) execution > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) execution>)
status: "in\_progress" or "completed" or "incomplete"
The status of the tool search call item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) status>)
type: "tool\_search\_call"
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 8>)
ToolSearchOutput object { id, call\_id, execution, 4 more }
id: string
The unique ID of the tool search output item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) id>)
call\_id: string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) call_id>)
execution: "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) execution > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) execution>)
status: "in\_progress" or "completed" or "incomplete"
The status of the tool search output item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) status>)
tools: array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
The loaded tool definitions returned by tool search.
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
"connector\_dropbox"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools > (items) > (variant) 14>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) tools>)
type: "tool\_search\_output"
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 9>)
Reasoning object { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) id>)
summary: array of [SummaryTextContent](</api/reference/resources/conversations#(resource) conversations > (model) summary_text_content > (schema)>) { text, type }
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) type>)
content: optional array of object { text, type }
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) content > (items) > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) content>)
encrypted\_content: optional string
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) encrypted_content>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10 > (property) status>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 10>)
Compaction object { id, encrypted\_content, type, created\_by }
A compaction item generated by the [`v1/responses/compact` API](/docs/api-reference/responses/compact).
id: string
The unique ID of the compaction item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 11 > (property) id>)
encrypted\_content: string
The encrypted content that was produced by compaction.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 11 > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 11 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 11 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 11>)
ImageGenerationCall object { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) id>)
result: string
The generated image encoded in base64.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) result>)
status: "in\_progress" or "completed" or "generating" or "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) status > (member) 1>)
"generating"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) status > (member) 3>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 12>)
CodeInterpreterCall object { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) id>)
code: string
The code to run, or null if not available.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) container_id>)
outputs: array of object { logs, type } or object { type, url }
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs object { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 0>)
Image object { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) outputs>)
status: "in\_progress" or "completed" or "incomplete" or 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status > (member) 4>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 13>)
LocalShellCall object { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) id>)
action: object { command, env, type, 3 more }
Execute a shell command on the server.
command: array of string
The command to run.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) command>)
env: map[string]
Environment variables to set for the command.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) type>)
timeout\_ms: optional number
Optional timeout in milliseconds for the command.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) timeout_ms>)
user: optional string
Optional user to run the command as.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) user>)
working\_directory: optional string
Optional working directory to run the command in.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action > (property) working_directory>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) call_id>)
status: "in\_progress" or "completed" or "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 14>)
LocalShellCallOutput object { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) type>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15 > (property) status>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 15>)
ShellCall object { id, action, call\_id, 4 more }
A tool call that executes one or more shell commands in a managed environment.
id: string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) id>)
action: object { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: array of string
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) action > (property) commands>)
max\_output\_length: number
Optional maximum number of characters to return from each command.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) action > (property) max_output_length>)
timeout\_ms: number
Optional timeout in milliseconds for the commands.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) action > (property) timeout_ms>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) call_id>)
environment: [ResponseLocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) response_local_environment > (schema)>) { type } or [ResponseContainerReference](</api/reference/resources/responses#(resource) responses > (model) response_container_reference > (schema)>) { container\_id, type }
Represents the use of a local environment to perform shell actions.
One of the following:
ResponseLocalEnvironment object { type }
Represents the use of a local environment to perform shell actions.
type: "local"
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
ResponseContainerReference object { container\_id, type }
Represents a container created with /v1/containers.
container\_id: string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
type: "container\_reference"
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) environment>)
status: "in\_progress" or "completed" or "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) status>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 16>)
ShellCallOutput object { id, call\_id, max\_output\_length, 4 more }
The output of a shell tool call that was emitted.
id: string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) id>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) call_id>)
max\_output\_length: number
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) max_output_length>)
output: array of object { outcome, stderr, stdout, created\_by }
An array of shell call output contents
outcome: object { type } or object { exit\_code, type }
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
Timeout object { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome > (variant) 0>)
Exit object { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
Exit code from the shell process.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) outcome>)
stderr: string
The standard error output that was captured.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) stderr>)
stdout: string
The standard output that was captured.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) stdout>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output > (items) > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) output>)
status: "in\_progress" or "completed" or "incomplete"
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) status>)
type: "shell\_call\_output"
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 17>)
ApplyPatchCall object { id, call\_id, operation, 3 more }
A tool call that applies file diffs by creating, deleting, or updating files.
id: string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) call_id>)
operation: object { diff, path, type } or object { path, type } or object { diff, path, type }
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
CreateFile object { diff, path, type }
Instruction describing how to create a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
Create a new file with the provided diff.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 0>)
DeleteFile object { path, type }
Instruction describing how to delete a file via the apply\_patch tool.
path: string
Path of the file to delete.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
Delete the specified file.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 1>)
UpdateFile object { diff, path, type }
Instruction describing how to update a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
Update an existing file with the provided diff.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation > (variant) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) operation>)
status: "in\_progress" or "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) status > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 18>)
ApplyPatchCallOutput object { id, call\_id, status, 3 more }
The output emitted by an apply patch tool call.
id: string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) call_id>)
status: "completed" or "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) status > (member) 0>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) status > (member) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) created_by>)
output: optional string
Optional textual output returned by the apply patch tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19 > (property) output>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 19>)
McpListTools object { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) tools > (items) > (property) description>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) type>)
error: optional string
Error message if the server could not list tools.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20 > (property) error>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 20>)
McpApprovalRequest object { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21 > (property) type>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 21>)
McpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A response to an MCP approval request.
id: string
The unique ID of the approval response
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22 > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22 > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22 > (property) reason>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 22>)
McpCall object { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) type>)
approval\_request\_id: optional string
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) approval_request_id>)
error: optional string
The error from the tool call, if any.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) output>)
status: optional "in\_progress" or "completed" or "incomplete" or 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status > (member) 2>)
"calling"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status > (member) 4>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23 > (property) status>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 23>)
CustomToolCall object { id, call\_id, input, 5 more }
id: string
The unique ID of the custom tool call item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) id>)
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) name>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) status>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) created_by>)
namespace: optional string
The namespace of the custom tool being called.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24 > (property) namespace>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 24>)
CustomToolCallOutput object { id, call\_id, output, 3 more }
id: string
The unique ID of the custom tool call output item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) id>)
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) call_id>)
output: string or array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
StringOutput = string
A string of the output of the custom tool call.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) output > (variant) 0>)
OutputContentList = array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the custom tool call.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) output > (variant) 1>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) output>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) status > (member) 2>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) status>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25 > (property) created_by>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data > (items) > (variant) 25>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) responses.input_items > (model) responseItemList > (schema) > (property) object>)
[](<#(resource) responses.input_items > (model) responseItemList > (schema)>)