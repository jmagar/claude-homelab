Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[Threads](/api/reference/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
DELETE/threads/{thread\_id}
Delete a thread.
##### Path ParametersExpand Collapse
thread\_id: string
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
ThreadDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: "thread.deleted"
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
`curl https://api.openai.com/v1/threads/thread\_abc123 \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Beta: assistants=v2" \\
-X DELETE
`
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