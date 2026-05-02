File Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# File Batches
##### [Create vector store file batch](/api/reference/ruby/resources/vector_stores/subresources/file_batches/methods/create)
vector\_stores.file\_batches.create(vector\_store\_id, \*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/ruby/resources/vector_stores/subresources/file_batches/methods/retrieve)
vector\_stores.file\_batches.retrieve(batch\_id, \*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/ruby/resources/vector_stores/subresources/file_batches/methods/cancel)
vector\_stores.file\_batches.cancel(batch\_id, \*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/ruby/resources/vector_stores/subresources/file_batches/methods/list_files)
vector\_stores.file\_batches.list\_files(batch\_id, \*\*kwargs) -\> CursorPage\<[VectorStoreFile](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more } \>
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
class VectorStoreFileBatch { id, created\_at, file\_counts, 3 more }
A batch of files attached to a vector store.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
file\_counts: FileCounts{ cancelled, completed, failed, 2 more}
cancelled: Integer
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
completed: Integer
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
failed: Integer
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
in\_progress: Integer
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
total: Integer
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
object: :"vector\_store.files\_batch"
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
status: :in\_progress | :completed | :cancelled | :failed
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
One of the following:
:in\_progress
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 0>)
:completed
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 1>)
:cancelled
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 2>)
:failed
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) status>)
vector\_store\_id: String
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)