Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[Threads](/api/reference/python/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.delete(strthread\_id) -\> [ThreadDeleted](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>)
DELETE/threads/{thread\_id}
Delete a thread.
##### ParametersExpand Collapse
thread\_id: str
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
class ThreadDeleted: …
id: str
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: Literal["thread.deleted"]
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
response = client.beta.threads.delete("thread\_abc123")
print(response)
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