Retrieve ChatKit thread | OpenAI API Reference
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
# Retrieve ChatKit thread
beta.chatkit.threads.retrieve(thread\_id) -\> [ChatKitThread](</api/reference/ruby/resources/beta#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>) { id, created\_at, object, 3 more }
GET/chatkit/threads/{thread\_id}
Retrieve a ChatKit thread by its identifier.
##### ParametersExpand Collapse
thread\_id: String
[](<#(resource) beta.chatkit.threads > (method) retrieve > (params) default > (param) thread_id > (schema)>)
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
### Retrieve ChatKit thread
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
chatkit\_thread = openai.beta.chatkit.threads.retrieve("cthr\_123")
puts(chatkit\_thread)
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