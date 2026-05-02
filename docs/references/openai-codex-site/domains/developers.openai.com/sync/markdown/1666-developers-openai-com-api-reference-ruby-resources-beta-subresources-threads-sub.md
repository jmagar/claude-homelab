Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[Threads](/api/reference/ruby/resources/beta/subresources/threads)
[Messages](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.messages.delete(message\_id, \*\*kwargs) -\> [MessageDeleted](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### ParametersExpand Collapse
thread\_id: String
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id > (schema)>)
message\_id: String
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
##### ReturnsExpand Collapse
class MessageDeleted { id, deleted, object }
id: String
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: :"thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
openai = OpenAI::Client.new(api\_key: "My API Key")
message\_deleted = openai.beta.threads.messages.delete("message\_id", thread\_id: "thread\_id")
puts(message\_deleted)`
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