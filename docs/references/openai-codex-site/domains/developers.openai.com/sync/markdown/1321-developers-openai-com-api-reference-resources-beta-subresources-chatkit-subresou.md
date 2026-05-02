List ChatKit thread items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[ChatKit](/api/reference/resources/beta/subresources/chatkit)
[Threads](/api/reference/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List ChatKit thread items
GET/chatkit/threads/{thread\_id}/items
List items that belong to a ChatKit thread.
##### Path ParametersExpand Collapse
thread\_id: string
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) thread_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) after > (schema)>)
before: optional string
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) before > (schema)>)
limit: optional number
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for results by creation time. Defaults to `desc`.
One of the following:
"asc"
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
ChatKitThreadItemList object { data, first\_id, has\_more, 2 more }
A paginated list of thread items rendered for the ChatKit API.
data: array of [ChatKitThreadUserMessageItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>) { id, attachments, content, 5 more } or [ChatKitThreadAssistantMessageItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>) { id, content, created\_at, 3 more } or [ChatKitWidgetItem](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>) { id, created\_at, object, 3 more } or 3 more
A list of items
One of the following:
ChatKitThreadUserMessageItem object { id, attachments, content, 5 more }
User-authored messages within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
attachments: array of [ChatKitAttachment](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>) { id, mime\_type, name, 2 more }
Attachments associated with the user message. Defaults to an empty list.
id: string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
mime\_type: string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
name: string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
preview\_url: string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
type: "image" or "file"
Attachment discriminator.
One of the following:
"image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
"file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
content: array of object { text, type } or object { text, type }
Ordered content elements supplied by the user.
One of the following:
InputText object { text, type }
Text block that a user contributed to the thread.
text: string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
type: "input\_text"
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
QuotedText object { text, type }
Quoted snippet that the user referenced in their message.
text: string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
type: "quoted\_text"
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
inference\_options: object { model, tool\_choice }
Inference overrides applied to the message. Defaults to null when unset.
model: string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
tool\_choice: object { id }
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
id: string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
type: "chatkit.user\_message"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
ChatKitThreadAssistantMessageItem object { id, content, created\_at, 3 more }
Assistant-authored message within a thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
content: array of [ChatKitResponseOutputText](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>) { annotations, text, type }
Ordered assistant response segments.
annotations: array of object { source, type } or object { source, type }
Ordered list of annotations attached to the response text.
One of the following:
File object { source, type }
Annotation that references an uploaded file.
source: object { filename, type }
File attachment referenced by the annotation.
filename: string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
type: "file"
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
type: "file"
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URL object { source, type }
Annotation that references a URL.
source: object { type, url }
URL referenced by the annotation.
type: "url"
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
url: string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
type: "url"
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
text: string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
type: "output\_text"
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
type: "chatkit.assistant\_message"
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
ChatKitWidgetItem object { id, created\_at, object, 3 more }
Thread item that renders a widget payload.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
type: "chatkit.widget"
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
widget: string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
ChatKitClientToolCall object { id, arguments, call\_id, 7 more }
Record of a client side tool invocation initiated by the assistant.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
arguments: string
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
call\_id: string
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
name: string
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
output: string
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
status: "in\_progress" or "completed"
Execution status for the tool call.
One of the following:
"in\_progress"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
"completed"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
type: "chatkit.client\_tool\_call"
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
ChatKitTask object { id, created\_at, heading, 5 more }
Task emitted by the workflow to show progress and status updates.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
heading: string
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
summary: string
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
task\_type: "custom" or "thought"
Subtype for the task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
type: "chatkit.task"
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
ChatKitTaskGroup object { id, created\_at, object, 3 more }
Collection of workflow tasks grouped together in the thread.
id: string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
object: "chatkit.thread\_item"
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
tasks: array of object { heading, summary, type }
Tasks included in the group.
heading: string
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
summary: string
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
type: "custom" or "thought"
Subtype for the grouped task.
One of the following:
"custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
"thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
thread\_id: string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
type: "chatkit.task\_group"
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema)>)
### List ChatKit thread items
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
`curl "https://api.openai.com/v1/chatkit/threads/cthr\_abc123/items?limit=3" \\
-H "OpenAI-Beta: chatkit\_beta=v1" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
```
`{
"data": [
{
"id": "cthi\_user\_001",
"object": "chatkit.thread\_item",
"type": "user\_message",
"content": [
{
"type": "input\_text",
"text": "I need help debugging an onboarding issue."
}
],
"attachments": []
},
{
"id": "cthi\_assistant\_002",
"object": "chatkit.thread\_item",
"type": "assistant\_message",
"content": [
{
"type": "output\_text",
"text": "Let's start by confirming the workflow version you deployed."
}
]
}
],
"has\_more": false,
"object": "list"
}
`
```
##### Returns Examples
```
`{
"data": [
{
"id": "cthi\_user\_001",
"object": "chatkit.thread\_item",
"type": "user\_message",
"content": [
{
"type": "input\_text",
"text": "I need help debugging an onboarding issue."
}
],
"attachments": []
},
{
"id": "cthi\_assistant\_002",
"object": "chatkit.thread\_item",
"type": "assistant\_message",
"content": [
{
"type": "output\_text",
"text": "Let's start by confirming the workflow version you deployed."
}
]
}
],
"has\_more": false,
"object": "list"
}
`
```