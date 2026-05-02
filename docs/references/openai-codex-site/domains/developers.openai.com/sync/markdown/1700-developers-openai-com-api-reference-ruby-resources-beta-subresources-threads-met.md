Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[Threads](/api/reference/ruby/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.delete(thread\_id) -\> [ThreadDeleted](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}
Delete a thread.
##### ParametersExpand Collapse
thread\_id: String
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
class ThreadDeleted { id, deleted, object }
id: String
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: :"thread.deleted"
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
thread\_deleted = openai.beta.threads.delete("thread\_id")
puts(thread\_deleted)`
```
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```