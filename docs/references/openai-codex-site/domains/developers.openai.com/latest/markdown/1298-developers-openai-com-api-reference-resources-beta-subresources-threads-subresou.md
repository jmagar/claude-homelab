Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[Threads](/api/reference/resources/beta/subresources/threads)
[Messages](/api/reference/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### Path ParametersExpand Collapse
thread\_id: string
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id > (schema)>)
message\_id: string
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
##### ReturnsExpand Collapse
MessageDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: "thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
`curl -X DELETE https://api.openai.com/v1/threads/thread\_abc123/messages/msg\_abc123 \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Beta: assistants=v2"
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