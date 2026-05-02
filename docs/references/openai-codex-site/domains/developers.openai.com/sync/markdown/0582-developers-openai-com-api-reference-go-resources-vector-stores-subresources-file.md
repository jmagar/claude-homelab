Retrieve vector store file batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
[File Batches](/api/reference/go/resources/vector_stores/subresources/file_batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file batch
client.VectorStores.FileBatches.Get(ctx, vectorStoreID, batchID) (\*[VectorStoreFileBatch](</api/reference/go/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>), error)
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
Retrieves a vector store file batch.
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) vector_store_id > (schema)>)
batchID string
[](<#(resource) vector_stores.file_batches > (method) retrieve > (params) default > (param) batch_id > (schema)>)
##### ReturnsExpand Collapse
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
### Retrieve vector store file batch
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
vectorStoreFileBatch, err := client.VectorStores.FileBatches.Get(
context.TODO(),
"vs\_abc123",
"vsfb\_abc123",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", vectorStoreFileBatch.ID)
}
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