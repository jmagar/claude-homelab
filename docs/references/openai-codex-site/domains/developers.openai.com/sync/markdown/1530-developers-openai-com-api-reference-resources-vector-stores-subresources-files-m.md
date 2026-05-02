Create vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
[Files](/api/reference/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create vector store file
POST/vector\_stores/{vector\_store\_id}/files
Create a vector store file by attaching a [File](/docs/api-reference/files) to a [vector store](/docs/api-reference/vector-stores/object).
##### Path ParametersExpand Collapse
vector\_store\_id: string
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) vector_store_id > (schema)>)
##### Body ParametersJSONExpand Collapse
file\_id: string
A [File](/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) file_id > (schema)>)
attributes: optional map[string or number or boolean]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) attributes > (schema) > (items) > (variant) 0>)
number
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) attributes > (schema) > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) attributes > (schema) > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) attributes > (schema)>)
chunking\_strategy: optional [FileChunkingStrategyParam](</api/reference/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
One of the following:
AutoFileChunkingStrategyParam object { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
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
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores.files > (method) create > (params) 0 > (param) chunking_strategy > (schema)>)
##### ReturnsExpand Collapse
VectorStoreFile object { id, created\_at, last\_error, 6 more }
A list of files attached to a vector store.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
last\_error: object { code, message }
The last error associated with this vector store file. Will be `null` if there are no errors.
code: "server\_error" or "unsupported\_file" or "invalid\_file"
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
"server\_error"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
"unsupported\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
object: "vector\_store.file"
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
status: "in\_progress" or "completed" or "cancelled" or "failed"
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
One of the following:
"in\_progress"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 1>)
"cancelled"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status>)
usage\_bytes: number
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
vector\_store\_id: string
The ID of the [vector store](/docs/api-reference/vector-stores/object) that the [File](/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
attributes: optional map[string or number or boolean]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
chunking\_strategy: optional [StaticFileChunkingStrategyObject](</api/reference/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>) { static, type } or [OtherFileChunkingStrategyObject](</api/reference/resources/vector_stores#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>) { type }
The strategy used to chunk the file.
One of the following:
StaticFileChunkingStrategyObject object { static, type }
static: [StaticFileChunkingStrategy](</api/reference/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
OtherFileChunkingStrategyObject object { type }
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: "other"
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
### Create vector store file
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
`curl https://api.openai.com/v1/vector\_stores/vs\_abc123/files \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"file\_id": "file-abc123"
}'
`
```
```
`{
"id": "file-abc123",
"object": "vector\_store.file",
"created\_at": 1699061776,
"usage\_bytes": 1234,
"vector\_store\_id": "vs\_abcd",
"status": "completed",
"last\_error": null
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "vector\_store.file",
"created\_at": 1699061776,
"usage\_bytes": 1234,
"vector\_store\_id": "vs\_abcd",
"status": "completed",
"last\_error": null
}
`
```