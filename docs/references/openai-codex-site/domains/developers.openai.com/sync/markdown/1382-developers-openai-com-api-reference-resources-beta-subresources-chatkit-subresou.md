List ChatKit threads | OpenAI API Reference
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
# List ChatKit threads
GET/chatkit/threads
List ChatKit threads with optional pagination and user filters.
##### Query ParametersExpand Collapse
after: optional string
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) after > (schema)>)
before: optional string
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) before > (schema)>)
limit: optional number
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for results by creation time. Defaults to `desc`.
One of the following:
"asc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)
user: optional string
Filter threads that belong to this user identifier. Defaults to null to return all users.
minLength1
maxLength512
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) user > (schema)>)
##### ReturnsExpand Collapse
data: array of [ChatKitThread](</api/reference/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) { id, created\_at, object, 3 more }
A list of items
id: string
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: "chatkit.thread"
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: object { type } or object { reason, type } or object { reason, type }
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
Active object { type }
Indicates that a thread is active.
type: "active"
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
Locked object { reason, type }
Indicates that a thread is locked and cannot accept new input.
reason: string
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: "locked"
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
Closed object { reason, type }
Indicates that a thread has been closed.
reason: string
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: "closed"
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: string
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: string
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (method) list > (network schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) beta.chatkit.threads > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) beta.chatkit.threads > (method) list > (network schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) beta.chatkit.threads > (method) list > (network schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) beta.chatkit.threads > (method) list > (network schema) > (property) object>)
### List ChatKit threads
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
`curl "https://api.openai.com/v1/chatkit/threads?limit=2&order=desc" \\
-H "OpenAI-Beta: chatkit\_beta=v1" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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