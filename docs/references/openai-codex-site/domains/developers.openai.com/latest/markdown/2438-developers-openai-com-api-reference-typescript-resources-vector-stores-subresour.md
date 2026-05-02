Retrieve vector store file batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
[File Batches](/api/reference/typescript/resources/vector_stores/subresources/file_batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file batch
client.vectorStores.fileBatches.retrieve(stringbatchID, FileBatchRetrieveParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFileBatch](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
Retrieves a vector store file batch.
##### ParametersExpand Collapse
batchID: string
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) batch_id > (schema)>)
params: FileBatchRetrieveParams { vector\_store\_id }
vector\_store\_id: string
The ID of the vector store that the file batch belongs to.
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
VectorStoreFileBatch { id, created\_at, file\_counts, 3 more }
A batch of files attached to a vector store.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
file\_counts: FileCounts { cancelled, completed, failed, 2 more }
cancelled: number
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
completed: number
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
failed: number
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
in\_progress: number
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
total: number
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
object: "vector\_store.files\_batch"
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
status: "in\_progress" | "completed" | "cancelled" | "failed"
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
vector\_store\_id: string
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
### Retrieve vector store file batch
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const vectorStoreFileBatch = await openai.vectorStores.fileBatches.retrieve(
"vsfb\_abc123",
{ vector\_store\_id: "vs\_abc123" }
);
console.log(vectorStoreFileBatch);
}
main();
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