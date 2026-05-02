List ChatKit thread items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[ChatKit](/api/reference/java/resources/beta/subresources/chatkit)
[Threads](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List ChatKit thread items
ThreadListItemsPage beta().chatkit().threads().listItems(ThreadListItemsParamsparams = ThreadListItemsParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chatkit/threads/{thread\_id}/items
List items that belong to a ChatKit thread.
##### ParametersExpand Collapse
ThreadListItemsParams params
Optional\<String\> threadId
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) thread_id > (schema)>)
Optional\<String\> after
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) after > (schema)>)
Optional\<String\> before
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) before > (schema)>)
Optional\<Long\> limit
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/list_items#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>)\> order
Sort order for results by creation time. Defaults to `desc`.
ASC("asc")
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>)
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default>)
##### ReturnsExpand Collapse
class Data: A class that can be one of several variants.union
User-authored messages within a thread.
class ChatKitThreadUserMessageItem:
User-authored messages within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
List\<[ChatKitAttachment](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)\> attachments
Attachments associated with the user message. Defaults to an empty list.
String id
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
String mimeType
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
String name
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
Optional\<String\> previewUrl
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type type
Attachment discriminator.
One of the following:
IMAGE("image")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
FILE("file")
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
List\<Content\> content
Ordered content elements supplied by the user.
One of the following:
class InputText:
Text block that a user contributed to the thread.
String text
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
class QuotedText:
Quoted snippet that the user referenced in their message.
String text
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
JsonValue; type "quoted\_text"constant"quoted\_text"constant
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
Optional\<InferenceOptions\> inferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Optional\<String\> model
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
Optional\<ToolChoice\> toolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
String id
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.user\_message"constant"chatkit.user\_message"constant
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
class ChatKitThreadAssistantMessageItem:
Assistant-authored message within a thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
List\<[ChatKitResponseOutputText](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)\> content
Ordered assistant response segments.
List\<Annotation\> annotations
Ordered list of annotations attached to the response text.
One of the following:
class File:
Annotation that references an uploaded file.
Source source
File attachment referenced by the annotation.
String filename
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
JsonValue; type "file"constant"file"constant
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class Url:
Annotation that references a URL.
Source source
URL referenced by the annotation.
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
String url
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
JsonValue; type "url"constant"url"constant
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
String text
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.assistant\_message"constant"chatkit.assistant\_message"constant
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
class ChatKitWidgetItem:
Thread item that renders a widget payload.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
JsonValue; type "chatkit.widget"constant"chatkit.widget"constant
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
String widget
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
class ChatKitClientToolCall:
Record of a client side tool invocation initiated by the assistant.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
String arguments
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
String callId
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
String name
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
Optional\<String\> output
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
Status status
Execution status for the tool call.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
JsonValue; type "chatkit.client\_tool\_call"constant"chatkit.client\_tool\_call"constant
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
class ChatKitTask:
Task emitted by the workflow to show progress and status updates.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
Optional\<String\> heading
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
Optional\<String\> summary
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
TaskType taskType
Subtype for the task.
One of the following:
CUSTOM("custom")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
THOUGHT("thought")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
JsonValue; type "chatkit.task"constant"chatkit.task"constant
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
class ChatKitTaskGroup:
Collection of workflow tasks grouped together in the thread.
String id
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
JsonValue; object\_ "chatkit.thread\_item"constant"chatkit.thread\_item"constant
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
List\<Task\> tasks
Tasks included in the group.
Optional\<String\> heading
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
Optional\<String\> summary
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
Type type
Subtype for the grouped task.
One of the following:
CUSTOM("custom")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
THOUGHT("thought")
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
String threadId
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
JsonValue; type "chatkit.task\_group"constant"chatkit.task\_group"constant
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items)>)
### List ChatKit thread items
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
import com.openai.models.beta.chatkit.threads.ThreadListItemsPage;
import com.openai.models.beta.chatkit.threads.ThreadListItemsParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ThreadListItemsPage page = client.beta().chatkit().threads().listItems("cthr\_123");
}
}
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