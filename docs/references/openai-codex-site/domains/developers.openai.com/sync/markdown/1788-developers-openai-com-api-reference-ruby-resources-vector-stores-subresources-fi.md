Retrieve vector store file batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
[File Batches](/api/reference/ruby/resources/vector_stores/subresources/file_batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file batch
vector\_stores.file\_batches.retrieve(batch\_id, \*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
Retrieves a vector store file batch.
##### ParametersExpand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) vector_store_id > (schema)>)
batch\_id: String
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) batch_id > (schema)>)
##### ReturnsExpand Collapse
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
### Retrieve vector store file batch
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
vector\_store\_file\_batch = openai.vector\_stores.file\_batches.retrieve("vsfb\_abc123", vector\_store\_id: "vs\_abc123")
puts(vector\_store\_file\_batch)`
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