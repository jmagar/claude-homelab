File Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Vector Stores](/api/reference/python/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# File Batches
##### [Create vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/create)
vector\_stores.file\_batches.create(strvector\_store\_id, FileBatchCreateParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/retrieve)
vector\_stores.file\_batches.retrieve(strbatch\_id, FileBatchRetrieveParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/cancel)
vector\_stores.file\_batches.cancel(strbatch\_id, FileBatchCancelParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/list_files)
vector\_stores.file\_batches.list\_files(strbatch\_id, FileBatchListFilesParams\*\*kwargs) -\> SyncCursorPage[[VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)]
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
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