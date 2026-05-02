Modify thread | OpenAI API Reference
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
# Modify thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
POST/threads/{thread\_id}
Modifies a thread.
##### Path ParametersExpand Collapse
thread\_id: string
[](<#(resource) beta.threads > (method) update > (params) default > (param) thread_id > (schema)>)
##### Body ParametersJSONExpand Collapse
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) metadata > (schema)>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) tool_resources > (schema) > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.threads > (method) update > (params) 0 > (param) tool_resources > (schema)>)
##### ReturnsExpand Collapse
Thread object { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](/docs/api-reference/messages).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: "thread"
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: object { code\_interpreter, file\_search }
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
### Modify thread
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
-d '{
"metadata": {
"modified": "true",
"user": "abc123"
}
}'
`
```
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699014083,
"metadata": {
"modified": "true",
"user": "abc123"
},
"tool\_resources": {}
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699014083,
"metadata": {
"modified": "true",
"user": "abc123"
},
"tool\_resources": {}
}
`
```