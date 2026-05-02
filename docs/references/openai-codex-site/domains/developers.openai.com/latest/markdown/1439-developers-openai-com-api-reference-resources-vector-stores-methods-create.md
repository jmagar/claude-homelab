Create vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create vector store
POST/vector\_stores
Create a vector store.
##### Body ParametersJSONExpand Collapse
chunking\_strategy: optional [AutoFileChunkingStrategyParam](</api/reference/resources/vector_stores#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>) { type } or [StaticFileChunkingStrategyObjectParam](</api/reference/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>) { static, type }
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
AutoFileChunkingStrategyParam object { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
StaticFileChunkingStrategyObjectParam object { static, type }
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) chunking_strategy > (schema)>)
description: optional string
A description for the vector store. Can be used to describe the vector store’s purpose.
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) description > (schema)>)
expires\_after: optional object { anchor, days }
The expiration policy for a vector store.
anchor: "last\_active\_at"
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) expires_after > (schema) > (property) anchor>)
days: number
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) expires_after > (schema) > (property) days>)
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) expires_after > (schema)>)
file\_ids: optional array of string
A list of [File](/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files.
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) file_ids > (schema)>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) metadata > (schema)>)
name: optional string
The name of the vector store.
[](<#(resource) vector_stores > (method) create > (params) 0 > (param) name > (schema)>)
##### ReturnsExpand Collapse
VectorStore object { id, created\_at, file\_counts, 8 more }
A vector store is a collection of processed files can be used by the `file\_search` tool.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
file\_counts: object { cancelled, completed, failed, 2 more }
cancelled: number
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
completed: number
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
failed: number
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
in\_progress: number
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
total: number
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
last\_active\_at: number
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
name: string
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
object: "vector\_store"
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
status: "expired" or "in\_progress" or "completed"
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
"expired"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
usage\_bytes: number
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
expires\_after: optional object { anchor, days }
The expiration policy for a vector store.
anchor: "last\_active\_at"
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
days: number
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
expires\_at: optional number
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
### Create vector store
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
`curl https://api.openai.com/v1/vector\_stores \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"name": "Support FAQ"
}'
`
```
```
`{
"id": "vs\_abc123",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ",
"description": "Contains commonly asked questions and answers, organized by topic.",
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
`
```
##### Returns Examples
```
`{
"id": "vs\_abc123",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ",
"description": "Contains commonly asked questions and answers, organized by topic.",
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
`
```