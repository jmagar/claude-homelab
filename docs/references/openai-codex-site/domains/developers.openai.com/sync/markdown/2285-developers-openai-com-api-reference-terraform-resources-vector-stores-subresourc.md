File Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Vector Stores](/api/reference/terraform/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# File Batches
#### resource openai\_vector\_store\_file\_batch
##### required Expand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) vector_store_id>)
##### optional Expand Collapse
file\_ids?: List[String]
A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files. If `attributes` or `chunking\_strategy` are provided, they will be applied to all files in the batch. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `files`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_ids>)
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy>)
files?: List[Attributes]
A list of objects that each include a `file\_id` plus optional `attributes` or `chunking\_strategy`. Use this when you need to override metadata for specific files. The global `attributes` or `chunking\_strategy` will be ignored and must be specified for each file. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `file\_ids`.
file\_id: String
A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) file_id>)
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) attributes>)
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files>)
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) attributes>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store files batch was created.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) object>)
status: String
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) status>)
file\_counts: Attributes
cancelled: Int64
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts>)
### openai\_vector\_store\_file\_batch
Terraform
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
`resource "openai\_vector\_store\_file\_batch" "example\_vector\_store\_file\_batch" {
vector\_store\_id = "vs\_abc123"
attributes = {
foo = "string"
}
chunking\_strategy = {
type = "auto"
}
file\_ids = ["string"]
files = [{
file\_id = "file\_id"
attributes = {
foo = "string"
}
chunking\_strategy = {
type = "auto"
}
}]
}
`
```
#### data openai\_vector\_store\_file\_batch
##### required Expand Collapse
batch\_id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) batch_id>)
vector\_store\_id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) vector_store_id>)
##### computed Expand Collapse
id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store files batch was created.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) object>)
status: String
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) status>)
file\_counts: Attributes
cancelled: Int64
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts>)
### openai\_vector\_store\_file\_batch
Terraform
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
`data "openai\_vector\_store\_file\_batch" "example\_vector\_store\_file\_batch" {
vector\_store\_id = "vs\_abc123"
batch\_id = "vsfb\_abc123"
}
`
```