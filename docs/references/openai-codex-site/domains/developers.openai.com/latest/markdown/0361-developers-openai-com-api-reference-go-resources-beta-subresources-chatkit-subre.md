List ChatKit threads | OpenAI API Reference
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
# List ChatKit threads
client.Beta.ChatKit.Threads.List(ctx, query) (\*ConversationCursorPage[[ChatKitThread](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)], error)
GET/chatkit/threads
List ChatKit threads with optional pagination and user filters.
##### ParametersExpand Collapse
query BetaChatKitThreadListParams
After param.Field[string]Optional
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) after>)
Before param.Field[string]Optional
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) before>)
Limit param.Field[int64]Optional
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) limit>)
Order param.Field[[BetaChatKitThreadListParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for results by creation time. Defaults to `desc`.
const BetaChatKitThreadListParamsOrderAsc [BetaChatKitThreadListParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const BetaChatKitThreadListParamsOrderDesc [BetaChatKitThreadListParamsOrder](</api/reference/go/resources/beta/subresources/chatkit/subresources/threads/methods/list#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order>)
User param.Field[string]Optional
Filter threads that belong to this user identifier. Defaults to null to return all users.
minLength1
maxLength512
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) user>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default>)
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
### List ChatKit threads
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
page, err := client.Beta.ChatKit.Threads.List(context.TODO(), openai.BetaChatKitThreadListParams{
})
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
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation"
},
{
"id": "cthr\_def456",
"object": "chatkit.thread",
"title": "Demo feedback"
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
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation"
},
{
"id": "cthr\_def456",
"object": "chatkit.thread",
"title": "Demo feedback"
}
],
"has\_more": false,
"object": "list"
}
`
```