File Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# File Batches
##### [Create vector store file batch](/api/reference/java/resources/vector_stores/subresources/file_batches/methods/create)
[VectorStoreFileBatch](</api/reference/java/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) vectorStores().fileBatches().create(FileBatchCreateParamsparams = FileBatchCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/java/resources/vector_stores/subresources/file_batches/methods/retrieve)
[VectorStoreFileBatch](</api/reference/java/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) vectorStores().fileBatches().retrieve(FileBatchRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/java/resources/vector_stores/subresources/file_batches/methods/cancel)
[VectorStoreFileBatch](</api/reference/java/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) vectorStores().fileBatches().cancel(FileBatchCancelParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/java/resources/vector_stores/subresources/file_batches/methods/list_files)
FileBatchListFilesPage vectorStores().fileBatches().listFiles(FileBatchListFilesParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
class VectorStoreFileBatch:
A batch of files attached to a vector store.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
FileCounts fileCounts
long cancelled
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
long completed
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
long failed
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
long inProgress
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
long total
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
JsonValue; object\_ "vector\_store.files\_batch"constant"vector\_store.files\_batch"constant
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
Status status
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 2>)
FAILED("failed")
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status>)
String vectorStoreId
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)