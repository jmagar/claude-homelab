List ChatKit threads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[ChatKit](/api/reference/python/resources/beta/subresources/chatkit)
[Threads](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List ChatKit threads
beta.chatkit.threads.list(ThreadListParams\*\*kwargs) -\> SyncConversationCursorPage[[ChatKitThread](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)]
GET/chatkit/threads
List ChatKit threads with optional pagination and user filters.
##### ParametersExpand Collapse
after: Optional[str]
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) after > (schema)>)
before: Optional[str]
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) before > (schema)>)
limit: Optional[int]
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order for results by creation time. Defaults to `desc`.
One of the following:
"asc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)
user: Optional[str]
Filter threads that belong to this user identifier. Defaults to null to return all users.
minLength1
maxLength512
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) user > (schema)>)
##### ReturnsExpand Collapse
class ChatKitThread: …
Represents a ChatKit thread and its current status.
id: str
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: Literal["chatkit.thread"]
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: Status
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
class StatusActive: …
Indicates that a thread is active.
type: Literal["active"]
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class StatusLocked: …
Indicates that a thread is locked and cannot accept new input.
reason: Optional[str]
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: Literal["locked"]
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class StatusClosed: …
Indicates that a thread has been closed.
reason: Optional[str]
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: Literal["closed"]
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: Optional[str]
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: str
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
### List ChatKit threads
Python
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
`from openai import OpenAI
client = OpenAI()
page = client.beta.chatkit.threads.list()
page = page.data[0]
print(page.id)
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