Create vector store file batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Vector Stores](/api/reference/python/resources/vector_stores)
[File Batches](/api/reference/python/resources/vector_stores/subresources/file_batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create vector store file batch
vector\_stores.file\_batches.create(strvector\_store\_id, FileBatchCreateParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
POST/vector\_stores/{vector\_store\_id}/file\_batches
Create a vector store file batch.
##### ParametersExpand Collapse
vector\_store\_id: str
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) vector_store_id > (schema)>)
attributes: Optional[Dict[str, Union[str, float, bool]]]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
str
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 0>)
float
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 2>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) attributes > (schema)>)
chunking\_strategy: Optional[[FileChunkingStrategyParam](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)]
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
class AutoFileChunkingStrategyParam: …
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: Literal["auto"]
Always `auto`.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
class StaticFileChunkingStrategyObjectParam: …
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
chunk\_overlap\_tokens: int
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: int
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema) + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) chunking_strategy > (schema)>)
file\_ids: Optional[Sequence[str]]
A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files. If `attributes` or `chunking\_strategy` are provided, they will be applied to all files in the batch. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `files`.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) file_ids > (schema)>)
files: Optional[Iterable[File]]
A list of objects that each include a `file\_id` plus optional `attributes` or `chunking\_strategy`. Use this when you need to override metadata for specific files. The global `attributes` or `chunking\_strategy` will be ignored and must be specified for each file. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `file\_ids`.
file\_id: str
A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) file_id>)
attributes: Optional[Dict[str, Union[str, float, bool]]]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
str
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) attributes > (items) > (variant) 0>)
float
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) attributes>)
chunking\_strategy: Optional[[FileChunkingStrategyParam](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)]
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
class AutoFileChunkingStrategyParam: …
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: Literal["auto"]
Always `auto`.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy + (resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
class StaticFileChunkingStrategyObjectParam: …
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
chunk\_overlap\_tokens: int
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: int
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema) > (items) > (property) chunking_strategy>)
[](<#(resource) vector_stores.file_batches > (method) create > (params) default > (param) files > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreFileBatch: …
A batch of files attached to a vector store.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
file\_counts: FileCounts
cancelled: int
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
completed: int
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
failed: int
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
in\_progress: int
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
total: int
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
object: Literal["vector\_store.files\_batch"]
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
status: Literal["in\_progress", "completed", "cancelled", "failed"]
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
One of the following:
"in\_progress"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 1>)
"cancelled"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status>)
vector\_store\_id: str
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
### Create vector store file batch
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
vector\_store\_file\_batch = client.vector\_stores.file\_batches.create(
vector\_store\_id="vs\_abc123",
files=[
{
"file\_id": "file-abc123",
"attributes": {"category": "finance"},
},
{
"file\_id": "file-abc456",
"chunking\_strategy": {
"type": "static",
"max\_chunk\_size\_tokens": 1200,
"chunk\_overlap\_tokens": 200,
},
},
],
)
print(vector\_store\_file\_batch)
`
```
```
`{
"id": "vsfb\_abc123",
"object": "vector\_store.file\_batch",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123",
"status": "in\_progress",
"file\_counts": {
"in\_progress": 1,
"completed": 1,
"failed": 0,
"cancelled": 0,
"total": 0,
}
}
`
```
##### Returns Examples
```
`{
"id": "vsfb\_abc123",
"object": "vector\_store.file\_batch",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123",
"status": "in\_progress",
"file\_counts": {
"in\_progress": 1,
"completed": 1,
"failed": 0,
"cancelled": 0,
"total": 0,
}
}
`
```