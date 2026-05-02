List ChatKit thread items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[ChatKit](/api/reference/go/resources/beta/subresources/chatkit)
[Threads](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List ChatKit thread items
client.Beta.ChatKit.Threads.ListItems(ctx, threadID, query) (\*ConversationCursorPage[ChatKitThreadItemListDataUnion], error)
GET/chatkit/threads/{thread\_id}/items
List items that belong to a ChatKit thread.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) thread_id > (schema)>)
query BetaChatKitThreadListItemsParams
After param.Field[string]Optional
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) after>)
Before param.Field[string]Optional
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) before>)
Limit param.Field[int64]Optional
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) limit>)
Order param.Field[[BetaChatKitThreadListItemsParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list_items#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>)]Optional
Sort order for results by creation time. Defaults to `desc`.
const BetaChatKitThreadListItemsParamsOrderAsc [BetaChatKitThreadListItemsParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list_items#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 0>)
const BetaChatKitThreadListItemsParamsOrderDesc [BetaChatKitThreadListItemsParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list_items#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default > (param) order>)
[](<#(resource) beta.chatkit.threads > (method) list_items > (params) default>)
##### ReturnsExpand Collapse
type ChatKitThreadItemListDataUnion interface{…}
User-authored messages within a thread.
One of the following:
type ChatKitThreadUserMessageItem struct{…}
User-authored messages within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) id>)
Attachments [][ChatKitAttachment](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema)>)
Attachments associated with the user message. Defaults to an empty list.
ID string
Identifier for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) id>)
MimeType string
MIME type of the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) mime_type>)
Name string
Original display name for the attachment.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) name>)
PreviewURL string
Preview URL for rendering the attachment inline.
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) preview_url>)
Type ChatKitAttachmentType
Attachment discriminator.
One of the following:
const ChatKitAttachmentTypeImage ChatKitAttachmentType = "image"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 0>)
const ChatKitAttachmentTypeFile ChatKitAttachmentType = "file"
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_attachment > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) attachments>)
Content []ChatKitThreadUserMessageItemContentUnion
Ordered content elements supplied by the user.
One of the following:
type ChatKitThreadUserMessageItemContentInputText struct{…}
Text block that a user contributed to the thread.
Text string
Plain-text content supplied by the user.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) text>)
Type InputText
Type discriminator that is always `input\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 0>)
type ChatKitThreadUserMessageItemContentQuotedText struct{…}
Quoted snippet that the user referenced in their message.
Text string
Quoted text content.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) text>)
Type QuotedText
Type discriminator that is always `quoted\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) created_at>)
InferenceOptions ChatKitThreadUserMessageItemInferenceOptions
Inference overrides applied to the message. Defaults to null when unset.
Model string
Model name that generated the response. Defaults to null when using the session default.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) model>)
ToolChoice ChatKitThreadUserMessageItemInferenceOptionsToolChoice
Preferred tool to invoke. Defaults to null when ChatKit should auto-select.
ID string
Identifier of the requested tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice > (property) id>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options > (property) tool_choice>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) inference_options>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) thread_id>)
Type ChatKitUserMessage
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_user_message_item > (schema)>)
type ChatKitThreadAssistantMessageItem struct{…}
Assistant-authored message within a thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) id>)
Content [][ChatKitResponseOutputText](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema)>)
Ordered assistant response segments.
Annotations []ChatKitResponseOutputTextAnnotationUnion
Ordered list of annotations attached to the response text.
One of the following:
type ChatKitResponseOutputTextAnnotationFile struct{…}
Annotation that references an uploaded file.
Source ChatKitResponseOutputTextAnnotationFileSource
File attachment referenced by the annotation.
Filename string
Filename referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) filename>)
Type File
Type discriminator that is always `file`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) source>)
Type File
Type discriminator that is always `file` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
type ChatKitResponseOutputTextAnnotationURL struct{…}
Annotation that references a URL.
Source ChatKitResponseOutputTextAnnotationURLSource
URL referenced by the annotation.
Type URL
Type discriminator that is always `url`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) type>)
URL string
URL referenced by the annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source > (property) url>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) source>)
Type URL
Type discriminator that is always `url` for this annotation.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) annotations>)
Text string
Assistant generated text.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) text>)
Type OutputText
Type discriminator that is always `output\_text`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_response_output_text > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) content>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) thread_id>)
Type ChatKitAssistantMessage
Type discriminator that is always `chatkit.assistant\_message`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_assistant_message_item > (schema)>)
type ChatKitWidgetItem struct{…}
Thread item that renders a widget payload.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) object>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) thread_id>)
Type ChatKitWidget
Type discriminator that is always `chatkit.widget`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) type>)
Widget string
Serialized widget payload rendered in the UI.
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema) > (property) widget>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_widget_item > (schema)>)
type ChatKitThreadItemListDataChatKitClientToolCall struct{…}
Record of a client side tool invocation initiated by the assistant.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) id>)
Arguments string
JSON-encoded arguments that were sent to the tool.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) arguments>)
CallID string
Identifier for the client tool call.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) call_id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) created_at>)
Name string
Tool name that was invoked.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) name>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) object>)
Output string
JSON-encoded output captured from the tool. Defaults to null while execution is in progress.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) output>)
Status string
Execution status for the tool call.
One of the following:
const ChatKitThreadItemListDataChatKitClientToolCallStatusInProgress ChatKitThreadItemListDataChatKitClientToolCallStatus = "in\_progress"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 0>)
const ChatKitThreadItemListDataChatKitClientToolCallStatusCompleted ChatKitThreadItemListDataChatKitClientToolCallStatus = "completed"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) status>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) thread_id>)
Type ChatKitClientToolCall
Type discriminator that is always `chatkit.client\_tool\_call`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 3>)
type ChatKitThreadItemListDataChatKitTask struct{…}
Task emitted by the workflow to show progress and status updates.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) created_at>)
Heading string
Optional heading for the task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) heading>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) object>)
Summary string
Optional summary that describes the task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) summary>)
TaskType string
Subtype for the task.
One of the following:
const ChatKitThreadItemListDataChatKitTaskTaskTypeCustom ChatKitThreadItemListDataChatKitTaskTaskType = "custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 0>)
const ChatKitThreadItemListDataChatKitTaskTaskTypeThought ChatKitThreadItemListDataChatKitTaskTaskType = "thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) task_type>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) thread_id>)
Type ChatKitTask
Type discriminator that is always `chatkit.task`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 4>)
type ChatKitThreadItemListDataChatKitTaskGroup struct{…}
Collection of workflow tasks grouped together in the thread.
ID string
Identifier of the thread item.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the item was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) created_at>)
Object ChatKitThreadItem
Type discriminator that is always `chatkit.thread\_item`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) object>)
Tasks []ChatKitThreadItemListDataChatKitTaskGroupTask
Tasks included in the group.
Heading string
Optional heading for the grouped task. Defaults to null when not provided.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) heading>)
Summary string
Optional summary that describes the grouped task. Defaults to null when omitted.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) summary>)
Type string
Subtype for the grouped task.
One of the following:
const ChatKitThreadItemListDataChatKitTaskGroupTaskTypeCustom ChatKitThreadItemListDataChatKitTaskGroupTaskType = "custom"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 0>)
const ChatKitThreadItemListDataChatKitTaskGroupTaskTypeThought ChatKitThreadItemListDataChatKitTaskGroupTaskType = "thought"
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type > (member) 1>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks > (items) > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) tasks>)
ThreadID string
Identifier of the parent thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) thread_id>)
Type ChatKitTaskGroup
Type discriminator that is always `chatkit.task\_group`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items) > (variant) 5>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread_item_list > (schema) > (property) data > (items)>)
### List ChatKit thread items
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
client := openai.NewClient()
page, err := client.Beta.ChatKit.Threads.ListItems(
context.TODO(),
"cthr\_123",
openai.BetaChatKitThreadListItemsParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
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