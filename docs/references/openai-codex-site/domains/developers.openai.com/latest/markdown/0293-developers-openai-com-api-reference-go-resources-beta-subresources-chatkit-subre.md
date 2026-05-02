Retrieve ChatKit thread | OpenAI API Reference
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
# Retrieve ChatKit thread
client.Beta.ChatKit.Threads.Get(ctx, threadID) (\*[ChatKitThread](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>), error)
GET/chatkit/threads/{thread\_id}
Retrieve a ChatKit thread by its identifier.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.chatkit.threads > (method) retrieve > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
type ChatKitThread struct{…}
Represents a ChatKit thread and its current status.
ID string
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
Object ChatKitThread
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
Status ChatKitThreadStatusUnion
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
type ChatKitThreadStatusActive struct{…}
Indicates that a thread is active.
Type Active
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
type ChatKitThreadStatusLocked struct{…}
Indicates that a thread is locked and cannot accept new input.
Reason string
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
Type Locked
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
type ChatKitThreadStatusClosed struct{…}
Indicates that a thread has been closed.
Reason string
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
Type Closed
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
Title string
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
User string
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
### Retrieve ChatKit thread
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
)
func main() {
client := openai.NewClient()
chatkitThread, err := client.Beta.ChatKit.Threads.Get(context.TODO(), "cthr\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", chatkitThread.ID)
}
`
```
```
`{
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation",
"items": {
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
"has\_more": false
}
}
`
```
##### Returns Examples
```
`{
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation",
"items": {
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
"has\_more": false
}
}
`
```