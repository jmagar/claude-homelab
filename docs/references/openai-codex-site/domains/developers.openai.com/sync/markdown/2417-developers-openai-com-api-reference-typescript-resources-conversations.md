Conversations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Conversations
Manage conversations and conversation items.
##### [Create a conversation](/api/reference/typescript/resources/conversations/methods/create)
client.conversations.create(ConversationCreateParams { items, metadata } body?, RequestOptionsoptions?): [Conversation](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
POST/conversations
##### [Retrieve a conversation](/api/reference/typescript/resources/conversations/methods/retrieve)
client.conversations.retrieve(stringconversationID, RequestOptionsoptions?): [Conversation](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
GET/conversations/{conversation\_id}
##### [Update a conversation](/api/reference/typescript/resources/conversations/methods/update)
client.conversations.update(stringconversationID, ConversationUpdateParams { metadata } body, RequestOptionsoptions?): [Conversation](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
POST/conversations/{conversation\_id}
##### [Delete a conversation](/api/reference/typescript/resources/conversations/methods/delete)
client.conversations.delete(stringconversationID, RequestOptionsoptions?): [ConversationDeletedResource](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>) { id, deleted, object }
DELETE/conversations/{conversation\_id}
##### ModelsExpand Collapse
ComputerScreenshotContent { detail, file\_id, image\_url, type }
A screenshot of a computer.
detail: "low" | "high" | "auto" | "original"
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
file\_id: string | null
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
image\_url: string | null
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
Conversation { id, created\_at, metadata, object }
id: string
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
created\_at: number
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
metadata: unknown
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
object: "conversation"
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
ConversationDeleted { id, deleted, object }
id: string
[](<#(resource) conversations > (model) conversation_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) conversations > (model) conversation_deleted > (schema) > (property) deleted>)
object: "conversation.deleted"
[](<#(resource) conversations > (model) conversation_deleted > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted > (schema)>)
ConversationDeletedResource { id, deleted, object }
id: string
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
deleted: boolean
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
object: "conversation.deleted"
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
Message { id, content, role, 3 more }
A message to or from the model.
id: string
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
content: Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseOutputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, text, type, logprobs } | [TextContent](</api/reference/typescript/resources/conversations#(resource) conversations > (model) text_content > (schema)>) { text, type } | 6 more\>
The content of the message
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseOutputText { annotations, text, type, logprobs }
A text output from the model.
annotations: Array\<FileCitation { file\_id, filename, index, type } | URLCitation { end\_index, start\_index, title, 2 more } | ContainerFileCitation { container\_id, end\_index, file\_id, 3 more } | FilePath { file\_id, index, type } \>
The annotations of the text output.
One of the following:
FileCitation { file\_id, filename, index, type }
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
URLCitation { end\_index, start\_index, title, 2 more }
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
ContainerFileCitation { container\_id, end\_index, file\_id, 3 more }
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
FilePath { file\_id, index, type }
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
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
TextContent { text, type }
A text content.
text: string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
type: "text"
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
SummaryTextContent { text, type }
A summary text from the model.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
ReasoningText { text, type }
Reasoning text from the model.
text: string
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
ResponseOutputRefusal { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ComputerScreenshotContent { detail, file\_id, image\_url, type }
A screenshot of a computer.
detail: "low" | "high" | "auto" | "original"
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
file\_id: string | null
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
image\_url: string | null
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
role: "unknown" | "user" | "assistant" | 5 more
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
"unknown"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
"user"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
"assistant"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
"system"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
"critic"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
"discriminator"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
"developer"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
"tool"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
status: "in\_progress" | "completed" | "incomplete"
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
type: "message"
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
phase?: "commentary" | "final\_answer" | null
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
SummaryTextContent { text, type }
A summary text from the model.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
TextContent { text, type }
A text content.
text: string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
type: "text"
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
#### ConversationsItems
Manage conversations and conversation items.
##### [Create items](/api/reference/typescript/resources/conversations/subresources/items/methods/create)
client.conversations.items.create(stringconversationID, ItemCreateParams { items, include } params, RequestOptionsoptions?): [ConversationItemList](</api/reference/typescript/resources/conversations#(resource) conversations.items > (model) conversation_item_list > (schema)>) { data, first\_id, has\_more, 2 more }
POST/conversations/{conversation\_id}/items
##### [List items](/api/reference/typescript/resources/conversations/subresources/items/methods/list)
client.conversations.items.list(stringconversationID, ItemListParams { after, include, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[ConversationItem](</api/reference/typescript/resources/conversations#(resource) conversations.items > (model) conversation_item > (schema)>)\>
GET/conversations/{conversation\_id}/items
##### [Retrieve an item](/api/reference/typescript/resources/conversations/subresources/items/methods/retrieve)
client.conversations.items.retrieve(stringitemID, ItemRetrieveParams { conversation\_id, include } params, RequestOptionsoptions?): [ConversationItem](</api/reference/typescript/resources/conversations#(resource) conversations.items > (model) conversation_item > (schema)>)
GET/conversations/{conversation\_id}/items/{item\_id}
##### [Delete an item](/api/reference/typescript/resources/conversations/subresources/items/methods/delete)
client.conversations.items.delete(stringitemID, ItemDeleteParams { conversation\_id } params, RequestOptionsoptions?): [Conversation](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
DELETE/conversations/{conversation\_id}/items/{item\_id}
##### ModelsExpand Collapse
ConversationItem = [Message](</api/reference/typescript/resources/conversations#(resource) conversations > (model) message > (schema)>) { id, content, role, 3 more } | [ResponseFunctionToolCallItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_tool_call_item > (schema)>) { id, status, created\_by } | [ResponseFunctionToolCallOutputItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_tool_call_output_item > (schema)>) { id, call\_id, output, 3 more } | 22 more
A single item within a conversation. The set of possible types are the same as the `output` type of a [Response object](https://platform.openai.com/docs/api-reference/responses/object#responses/object-output).
One of the following:
Message { id, content, role, 3 more }
A message to or from the model.
id: string
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
content: Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseOutputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, text, type, logprobs } | [TextContent](</api/reference/typescript/resources/conversations#(resource) conversations > (model) text_content > (schema)>) { text, type } | 6 more\>
The content of the message
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseOutputText { annotations, text, type, logprobs }
A text output from the model.
annotations: Array\<FileCitation { file\_id, filename, index, type } | URLCitation { end\_index, start\_index, title, 2 more } | ContainerFileCitation { container\_id, end\_index, file\_id, 3 more } | FilePath { file\_id, index, type } \>
The annotations of the text output.
One of the following:
FileCitation { file\_id, filename, index, type }
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
URLCitation { end\_index, start\_index, title, 2 more }
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
ContainerFileCitation { container\_id, end\_index, file\_id, 3 more }
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
FilePath { file\_id, index, type }
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
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
TextContent { text, type }
A text content.
text: string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
type: "text"
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
SummaryTextContent { text, type }
A summary text from the model.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
ReasoningText { text, type }
Reasoning text from the model.
text: string
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
ResponseOutputRefusal { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ComputerScreenshotContent { detail, file\_id, image\_url, type }
A screenshot of a computer.
detail: "low" | "high" | "auto" | "original"
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
file\_id: string | null
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
image\_url: string | null
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
role: "unknown" | "user" | "assistant" | 5 more
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
"unknown"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
"user"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
"assistant"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
"system"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
"critic"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
"discriminator"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
"developer"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
"tool"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
status: "in\_progress" | "completed" | "incomplete"
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
type: "message"
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
phase?: "commentary" | "final\_answer" | null
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
ResponseFunctionToolCallItem extends [ResponseFunctionToolCall](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_tool_call > (schema)>) { arguments, call\_id, name, 4 more } { id, status, created\_by }
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
id: string
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema)>)
ResponseFunctionToolCallOutputItem { id, call\_id, output, 3 more }
id: string
The unique ID of the function call tool output.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema)>)
ResponseFileSearchToolCall { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
queries: Array\<string\>
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
status: "in\_progress" | "searching" | "completed" | 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
results?: Array\<Result\> | null
The results of the file search tool call.
attributes?: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
file\_id?: string
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
filename?: string
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
score?: number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
text?: string
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
ResponseFunctionWebSearch { id, action, status, type }
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
action: Search { query, type, queries, sources } | OpenPage { type, url } | FindInPage { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
queries?: Array\<string\>
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
sources?: Array\<Source\>
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
OpenPage { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
url?: string | null
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
FindInPage { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
status: "in\_progress" | "searching" | "completed" | "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
ImageGenerationCall { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) id>)
result: string | null
The generated image encoded in base64.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) result>)
status: "in\_progress" | "completed" | "generating" | "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 1>)
"generating"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 2>)
"failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 3>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5>)
ResponseComputerToolCall { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
pending\_safety\_checks: Array\<PendingSafetyCheck\>
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
action?: Click { button, type, x, 2 more } | DoubleClick { keys, type, x, y } | Drag { path, type, keys } | 6 more
A click action.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
actions?: [ComputerActionList](</api/reference/typescript/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { , , , 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
ResponseComputerToolCallOutputItem { id, call\_id, output, 4 more }
id: string
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/typescript/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output>)
status: "completed" | "incomplete" | "failed" | "in\_progress"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"completed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 2>)
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) type>)
acknowledged\_safety\_checks?: Array\<AcknowledgedSafetyCheck\>
The safety checks reported by the API that have been acknowledged by the
developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema)>)
ResponseToolSearchCall { id, arguments, call\_id, 4 more }
id: string
The unique ID of the tool search call item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) id>)
arguments: unknown
Arguments used for the tool search call.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) arguments>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search call item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status>)
type: "tool\_search\_call"
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_call > (schema)>)
ResponseToolSearchOutputItem { id, call\_id, execution, 4 more }
id: string
The unique ID of the tool search output item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) id>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search output item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status>)
tools: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
The loaded tool definitions returned by tool search.
One of the following:
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
One of the following:
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) tools>)
type: "tool\_search\_output"
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema)>)
ResponseReasoningItem { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
summary: Array\<Summary\>
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
content?: Array\<Content\>
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
encrypted\_content?: string | null
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
ResponseCompactionItem { id, encrypted\_content, type, created\_by }
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
id: string
The unique ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) id>)
encrypted\_content: string
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_compaction_item > (schema)>)
ResponseCodeInterpreterToolCall { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
code: string | null
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
outputs: Array\<Logs { logs, type } | Image { type, url } \> | null
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
Image { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
status: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
LocalShellCall { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) id>)
action: Action { command, env, type, 3 more }
Execute a shell command on the server.
command: Array\<string\>
The command to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) command>)
env: Record\<string, string\>
Environment variables to set for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) type>)
timeout\_ms?: number | null
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) timeout_ms>)
user?: string | null
Optional user to run the command as.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) user>)
working\_directory?: string | null
Optional working directory to run the command in.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) call_id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13>)
LocalShellCallOutput { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) type>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14>)
ResponseFunctionShellToolCall { id, action, call\_id, 4 more }
A tool call that executes one or more shell commands in a managed environment.
id: string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) id>)
action: Action { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: Array\<string\>
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) commands>)
max\_output\_length: number | null
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) max_output_length>)
timeout\_ms: number | null
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) call_id>)
environment: [ResponseLocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) response_local_environment > (schema)>) { type } | [ResponseContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) response_container_reference > (schema)>) { container\_id, type } | null
Represents the use of a local environment to perform shell actions.
One of the following:
ResponseLocalEnvironment { type }
Represents the use of a local environment to perform shell actions.
type: "local"
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
ResponseContainerReference { container\_id, type }
Represents a container created with /v1/containers.
container\_id: string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
type: "container\_reference"
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) environment>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema)>)
ResponseFunctionShellToolCallOutput { id, call\_id, max\_output\_length, 4 more }
The output of a shell tool call that was emitted.
id: string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) call_id>)
max\_output\_length: number | null
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) max_output_length>)
output: Array\<Output\>
An array of shell call output contents
outcome: Timeout { type } | Exit { exit\_code, type }
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
Timeout { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0>)
Exit { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
Exit code from the shell process.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome>)
stderr: string
The standard error output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stderr>)
stdout: string
The standard output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stdout>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status>)
type: "shell\_call\_output"
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema)>)
ResponseApplyPatchToolCall { id, call\_id, operation, 3 more }
A tool call that applies file diffs by creating, deleting, or updating files.
id: string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) call_id>)
operation: CreateFile { diff, path, type } | DeleteFile { path, type } | UpdateFile { diff, path, type }
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
CreateFile { diff, path, type }
Instruction describing how to create a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
Create a new file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0>)
DeleteFile { path, type }
Instruction describing how to delete a file via the apply\_patch tool.
path: string
Path of the file to delete.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
Delete the specified file.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1>)
UpdateFile { diff, path, type }
Instruction describing how to update a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
Update an existing file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation>)
status: "in\_progress" | "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema)>)
ResponseApplyPatchToolCallOutput { id, call\_id, status, 3 more }
The output emitted by an apply patch tool call.
id: string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) call_id>)
status: "completed" | "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) created_by>)
output?: string | null
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) output>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema)>)
McpListTools { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) server_label>)
tools: Array\<Tool\>
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) name>)
annotations?: unknown
Additional annotations about the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) annotations>)
description?: string | null
The description of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) description>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) type>)
error?: string | null
Error message if the server could not list tools.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) error>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19>)
McpApprovalRequest { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20>)
McpApprovalResponse { id, approval\_request\_id, approve, 2 more }
A response to an MCP approval request.
id: string
The unique ID of the approval response
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) type>)
reason?: string | null
Optional reason for the decision.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) reason>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21>)
McpCall { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) type>)
approval\_request\_id?: string | null
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) approval_request_id>)
error?: string | null
The error from the tool call, if any.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) error>)
output?: string | null
The output from the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) output>)
status?: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 2>)
"calling"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 3>)
"failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 4>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22>)
ResponseCustomToolCall { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
ResponseCustomToolCallOutput { call\_id, output, type, id }
The output of a custom tool call from your code, being sent back to the model.
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) id>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema)>)
[](<#(resource) conversations.items > (model) conversation_item > (schema)>)
ConversationItemList { data, first\_id, has\_more, 2 more }
A list of Conversation items.
data: Array\<[ConversationItem](</api/reference/typescript/resources/conversations#(resource) conversations.items > (model) conversation_item > (schema)>)\>
A list of conversation items.
One of the following:
Message { id, content, role, 3 more }
A message to or from the model.
id: string
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
content: Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseOutputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, text, type, logprobs } | [TextContent](</api/reference/typescript/resources/conversations#(resource) conversations > (model) text_content > (schema)>) { text, type } | 6 more\>
The content of the message
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseOutputText { annotations, text, type, logprobs }
A text output from the model.
annotations: Array\<FileCitation { file\_id, filename, index, type } | URLCitation { end\_index, start\_index, title, 2 more } | ContainerFileCitation { container\_id, end\_index, file\_id, 3 more } | FilePath { file\_id, index, type } \>
The annotations of the text output.
One of the following:
FileCitation { file\_id, filename, index, type }
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
URLCitation { end\_index, start\_index, title, 2 more }
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
ContainerFileCitation { container\_id, end\_index, file\_id, 3 more }
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
FilePath { file\_id, index, type }
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
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
TextContent { text, type }
A text content.
text: string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
type: "text"
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
SummaryTextContent { text, type }
A summary text from the model.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
ReasoningText { text, type }
Reasoning text from the model.
text: string
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
ResponseOutputRefusal { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ComputerScreenshotContent { detail, file\_id, image\_url, type }
A screenshot of a computer.
detail: "low" | "high" | "auto" | "original"
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
file\_id: string | null
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
image\_url: string | null
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
role: "unknown" | "user" | "assistant" | 5 more
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
"unknown"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
"user"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
"assistant"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
"system"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
"critic"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
"discriminator"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
"developer"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
"tool"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
status: "in\_progress" | "completed" | "incomplete"
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
type: "message"
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
phase?: "commentary" | "final\_answer" | null
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
ResponseFunctionToolCallItem extends [ResponseFunctionToolCall](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_tool_call > (schema)>) { arguments, call\_id, name, 4 more } { id, status, created\_by }
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
id: string
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema)>)
ResponseFunctionToolCallOutputItem { id, call\_id, output, 3 more }
id: string
The unique ID of the function call tool output.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema)>)
ResponseFileSearchToolCall { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
queries: Array\<string\>
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
status: "in\_progress" | "searching" | "completed" | 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
results?: Array\<Result\> | null
The results of the file search tool call.
attributes?: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
file\_id?: string
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
filename?: string
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
score?: number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
text?: string
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
ResponseFunctionWebSearch { id, action, status, type }
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
action: Search { query, type, queries, sources } | OpenPage { type, url } | FindInPage { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
queries?: Array\<string\>
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
sources?: Array\<Source\>
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
OpenPage { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
url?: string | null
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
FindInPage { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
status: "in\_progress" | "searching" | "completed" | "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
ImageGenerationCall { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) id>)
result: string | null
The generated image encoded in base64.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) result>)
status: "in\_progress" | "completed" | "generating" | "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 1>)
"generating"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 2>)
"failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 3>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5>)
ResponseComputerToolCall { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
pending\_safety\_checks: Array\<PendingSafetyCheck\>
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
action?: Click { button, type, x, 2 more } | DoubleClick { keys, type, x, y } | Drag { path, type, keys } | 6 more
A click action.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
actions?: [ComputerActionList](</api/reference/typescript/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { , , , 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
ResponseComputerToolCallOutputItem { id, call\_id, output, 4 more }
id: string
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/typescript/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output>)
status: "completed" | "incomplete" | "failed" | "in\_progress"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"completed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 2>)
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) type>)
acknowledged\_safety\_checks?: Array\<AcknowledgedSafetyCheck\>
The safety checks reported by the API that have been acknowledged by the
developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema)>)
ResponseToolSearchCall { id, arguments, call\_id, 4 more }
id: string
The unique ID of the tool search call item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) id>)
arguments: unknown
Arguments used for the tool search call.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) arguments>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search call item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status>)
type: "tool\_search\_call"
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_call > (schema)>)
ResponseToolSearchOutputItem { id, call\_id, execution, 4 more }
id: string
The unique ID of the tool search output item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) id>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search output item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status>)
tools: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
The loaded tool definitions returned by tool search.
One of the following:
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
One of the following:
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) tools>)
type: "tool\_search\_output"
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema)>)
ResponseReasoningItem { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
summary: Array\<Summary\>
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
content?: Array\<Content\>
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
encrypted\_content?: string | null
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
ResponseCompactionItem { id, encrypted\_content, type, created\_by }
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
id: string
The unique ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) id>)
encrypted\_content: string
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_compaction_item > (schema)>)
ResponseCodeInterpreterToolCall { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
code: string | null
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
outputs: Array\<Logs { logs, type } | Image { type, url } \> | null
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
Image { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
status: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
LocalShellCall { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) id>)
action: Action { command, env, type, 3 more }
Execute a shell command on the server.
command: Array\<string\>
The command to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) command>)
env: Record\<string, string\>
Environment variables to set for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) type>)
timeout\_ms?: number | null
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) timeout_ms>)
user?: string | null
Optional user to run the command as.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) user>)
working\_directory?: string | null
Optional working directory to run the command in.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) call_id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13>)
LocalShellCallOutput { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) type>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14>)
ResponseFunctionShellToolCall { id, action, call\_id, 4 more }
A tool call that executes one or more shell commands in a managed environment.
id: string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) id>)
action: Action { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: Array\<string\>
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) commands>)
max\_output\_length: number | null
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) max_output_length>)
timeout\_ms: number | null
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) call_id>)
environment: [ResponseLocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) response_local_environment > (schema)>) { type } | [ResponseContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) response_container_reference > (schema)>) { container\_id, type } | null
Represents the use of a local environment to perform shell actions.
One of the following:
ResponseLocalEnvironment { type }
Represents the use of a local environment to perform shell actions.
type: "local"
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
ResponseContainerReference { container\_id, type }
Represents a container created with /v1/containers.
container\_id: string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
type: "container\_reference"
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) environment>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema)>)
ResponseFunctionShellToolCallOutput { id, call\_id, max\_output\_length, 4 more }
The output of a shell tool call that was emitted.
id: string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) call_id>)
max\_output\_length: number | null
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) max_output_length>)
output: Array\<Output\>
An array of shell call output contents
outcome: Timeout { type } | Exit { exit\_code, type }
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
Timeout { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0>)
Exit { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
Exit code from the shell process.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome>)
stderr: string
The standard error output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stderr>)
stdout: string
The standard output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stdout>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status>)
type: "shell\_call\_output"
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema)>)
ResponseApplyPatchToolCall { id, call\_id, operation, 3 more }
A tool call that applies file diffs by creating, deleting, or updating files.
id: string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) call_id>)
operation: CreateFile { diff, path, type } | DeleteFile { path, type } | UpdateFile { diff, path, type }
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
CreateFile { diff, path, type }
Instruction describing how to create a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
Create a new file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0>)
DeleteFile { path, type }
Instruction describing how to delete a file via the apply\_patch tool.
path: string
Path of the file to delete.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
Delete the specified file.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1>)
UpdateFile { diff, path, type }
Instruction describing how to update a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
Update an existing file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation>)
status: "in\_progress" | "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema)>)
ResponseApplyPatchToolCallOutput { id, call\_id, status, 3 more }
The output emitted by an apply patch tool call.
id: string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) call_id>)
status: "completed" | "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) created_by>)
output?: string | null
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) output>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema)>)
McpListTools { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) server_label>)
tools: Array\<Tool\>
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) name>)
annotations?: unknown
Additional annotations about the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) annotations>)
description?: string | null
The description of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) description>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) type>)
error?: string | null
Error message if the server could not list tools.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) error>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19>)
McpApprovalRequest { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20>)
McpApprovalResponse { id, approval\_request\_id, approve, 2 more }
A response to an MCP approval request.
id: string
The unique ID of the approval response
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) type>)
reason?: string | null
Optional reason for the decision.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) reason>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21>)
McpCall { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) type>)
approval\_request\_id?: string | null
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) approval_request_id>)
error?: string | null
The error from the tool call, if any.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) error>)
output?: string | null
The output from the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) output>)
status?: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 2>)
"calling"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 3>)
"failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 4>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22>)
ResponseCustomToolCall { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
ResponseCustomToolCallOutput { call\_id, output, type, id }
The output of a custom tool call from your code, being sent back to the model.
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) id>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema)>)
[](<#(resource) conversations.items > (model) conversation_item_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) conversations.items > (model) conversation_item_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) conversations.items > (model) conversation_item_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) conversations.items > (model) conversation_item_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) conversations.items > (model) conversation_item_list > (schema) > (property) object>)
[](<#(resource) conversations.items > (model) conversation_item_list > (schema)>)