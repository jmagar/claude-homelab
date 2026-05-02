Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[Threads](/api/reference/python/resources/beta/subresources/threads)
[Messages](/api/reference/python/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.messages.delete(strmessage\_id, MessageDeleteParams\*\*kwargs) -\> [MessageDeleted](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### ParametersExpand Collapse
thread\_id: str
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id > (schema)>)
message\_id: str
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
##### ReturnsExpand Collapse
class MessageDeleted: …
id: str
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: Literal["thread.message.deleted"]
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
deleted\_message = client.beta.threads.messages.delete(
message\_id="msg\_abc12",
thread\_id="thread\_abc123",
)
print(deleted\_message)
`
```
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```