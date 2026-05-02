File Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# File Batches
##### [Create vector store file batch](/api/reference/go/resources/vector_stores/subresources/file_batches/methods/create)
client.VectorStores.FileBatches.New(ctx, vectorStoreID, body) (\*[VectorStoreFileBatch](</api/reference/go/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/go/resources/vector_stores/subresources/file_batches/methods/retrieve)
client.VectorStores.FileBatches.Get(ctx, vectorStoreID, batchID) (\*[VectorStoreFileBatch](</api/reference/go/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>), error)
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/go/resources/vector_stores/subresources/file_batches/methods/cancel)
client.VectorStores.FileBatches.Cancel(ctx, vectorStoreID, batchID) (\*[VectorStoreFileBatch](</api/reference/go/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/go/resources/vector_stores/subresources/file_batches/methods/list_files)
client.VectorStores.FileBatches.ListFiles(ctx, vectorStoreID, batchID, query) (\*CursorPage[[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)], error)
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
type VectorStoreFileBatch struct{…}
A batch of files attached to a vector store.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
FileCounts VectorStoreFileBatchFileCounts
Cancelled int64
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
Completed int64
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
Failed int64
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
InProgress int64
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
Total int64
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
Object VectorStoreFilesBatch
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
Status VectorStoreFileBatchStatus
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
One of the following:
const VectorStoreFileBatchStatusInProgress VectorStoreFileBatchStatus = "in\_progress"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 0>)
const VectorStoreFileBatchStatusCompleted VectorStoreFileBatchStatus = "completed"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 1>)
const VectorStoreFileBatchStatusCancelled VectorStoreFileBatchStatus = "cancelled"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 2>)
const VectorStoreFileBatchStatusFailed VectorStoreFileBatchStatus = "failed"
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status>)
VectorStoreID string
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)