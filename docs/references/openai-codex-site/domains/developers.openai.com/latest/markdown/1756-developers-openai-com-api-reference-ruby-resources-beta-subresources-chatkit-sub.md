List ChatKit threads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[ChatKit](/api/reference/ruby/resources/beta/subresources/chatkit)
[Threads](/api/reference/ruby/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List ChatKit threads
beta.chatkit.threads.list(\*\*kwargs) -\> ConversationCursorPage\<[ChatKitThread](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) { id, created\_at, object, 3 more } \>
GET/chatkit/threads
List ChatKit threads with optional pagination and user filters.
##### ParametersExpand Collapse
after: String
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) after > (schema)>)
before: String
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) before > (schema)>)
limit: Integer
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Sort order for results by creation time. Defaults to `desc`.
One of the following:
:asc
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)
user: String
Filter threads that belong to this user identifier. Defaults to null to return all users.
minLength1
maxLength512
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) user > (schema)>)
##### ReturnsExpand Collapse
class ChatKitThread { id, created\_at, object, 3 more }
Represents a ChatKit thread and its current status.
id: String
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
object: :"chatkit.thread"
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
status: Active{ type} | Locked{ reason, type} | Closed{ reason, type}
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
class Active { type }
Indicates that a thread is active.
type: :active
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class Locked { reason, type }
Indicates that a thread is locked and cannot accept new input.
reason: String
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
type: :locked
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class Closed { reason, type }
Indicates that a thread has been closed.
reason: String
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
type: :closed
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
title: String
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
user: String
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
### List ChatKit threads
Ruby
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
`require "openai"
openai = OpenAI::Client.new
page = openai.beta.chatkit.threads.list
puts(page)
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