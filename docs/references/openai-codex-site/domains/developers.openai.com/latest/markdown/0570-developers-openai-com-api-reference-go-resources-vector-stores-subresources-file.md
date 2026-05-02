Create vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
[Files](/api/reference/go/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create vector store file
client.VectorStores.Files.New(ctx, vectorStoreID, body) (\*[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}/files
Create a vector store file by attaching a [File](https://platform.openai.com/docs/api-reference/files) to a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object).
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) vector_store_id > (schema)>)
body VectorStoreFileNewParams
FileID param.Field[string]
A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) file_id>)
Attributes param.Field[map[string, VectorStoreFileNewParamsAttributeUnion]]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
string
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 0>)
float64
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) attributes > (schema) > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) attributes>)
ChunkingStrategy param.Field[[FileChunkingStrategyParamUnionResp](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)]Optional
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
[](<#(resource) vector_stores.files > (method) create > (params) default > (param) chunking_strategy>)
[](<#(resource) vector_stores.files > (method) create > (params) default>)
##### ReturnsExpand Collapse
type VectorStoreFile struct{…}
A list of files attached to a vector store.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
LastError VectorStoreFileLastError
The last error associated with this vector store file. Will be `null` if there are no errors.
Code string
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
const VectorStoreFileLastErrorCodeServerError VectorStoreFileLastErrorCode = "server\_error"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
const VectorStoreFileLastErrorCodeUnsupportedFile VectorStoreFileLastErrorCode = "unsupported\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
const VectorStoreFileLastErrorCodeInvalidFile VectorStoreFileLastErrorCode = "invalid\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
Object VectorStoreFile
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
Status VectorStoreFileStatus
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
One of the following:
const VectorStoreFileStatusInProgress VectorStoreFileStatus = "in\_progress"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 0>)
const VectorStoreFileStatusCompleted VectorStoreFileStatus = "completed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 1>)
const VectorStoreFileStatusCancelled VectorStoreFileStatus = "cancelled"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 2>)
const VectorStoreFileStatusFailed VectorStoreFileStatus = "failed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status>)
UsageBytes int64
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
VectorStoreID string
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
Attributes map[string, VectorStoreFileAttributeUnion]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
float64
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
ChunkingStrategy [FileChunkingStrategyUnion](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)Optional
The strategy used to chunk the file.
One of the following:
type StaticFileChunkingStrategyObject struct{…}
Static [StaticFileChunkingStrategy](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
ChunkOverlapTokens int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
MaxChunkSizeTokens int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
Type Static
Always `static`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
type OtherFileChunkingStrategyObject struct{…}
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
Type Other
Always `other`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
### Create vector store file
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
vectorStoreFile, err := client.VectorStores.Files.New(
context.TODO(),
"vs\_abc123",
openai.VectorStoreFileNewParams{
FileID: "file\_id",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", vectorStoreFile.ID)
}
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