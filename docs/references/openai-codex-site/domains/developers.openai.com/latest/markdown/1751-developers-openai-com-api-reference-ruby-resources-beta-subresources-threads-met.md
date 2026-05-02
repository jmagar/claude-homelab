Modify thread | OpenAI API Reference
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
# Modify thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.update(thread\_id, \*\*kwargs) -\> [Thread](</api/reference/ruby/resources/beta#(resource) beta.threads > (model) thread > (schema)>) { id, created\_at, metadata, 2 more }
POST/threads/{thread\_id}
Modifies a thread.
##### ParametersExpand Collapse
thread\_id: String
[](<#(resource) beta.threads > (method) update > (params) default > (param) thread_id > (schema)>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) update > (params) default > (param) metadata > (schema)>)
tool\_resources: ToolResources{ code\_interpreter, file\_search}
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: CodeInterpreter{ file\_ids}
file\_ids: Array[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (method) update > (params) default > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (method) update > (params) default > (param) tool_resources > (schema) > (property) code_interpreter>)
file\_search: FileSearch{ vector\_store\_ids}
vector\_store\_ids: Array[String]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (method) update > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (method) update > (params) default > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.threads > (method) update > (params) default > (param) tool_resources > (schema)>)
##### ReturnsExpand Collapse
class Thread { id, created\_at, metadata, 2 more }
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: :thread
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: ToolResources{ code\_interpreter, file\_search}
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: CodeInterpreter{ file\_ids}
file\_ids: Array[String]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: FileSearch{ vector\_store\_ids}
vector\_store\_ids: Array[String]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
### Modify thread
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
thread = openai.beta.threads.update("thread\_id")
puts(thread)`
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