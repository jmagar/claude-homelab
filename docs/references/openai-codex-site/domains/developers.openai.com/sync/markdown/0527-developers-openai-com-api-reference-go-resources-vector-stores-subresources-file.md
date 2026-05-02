Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List vector store files](/api/reference/go/resources/vector_stores/subresources/files/methods/list)
client.VectorStores.Files.List(ctx, vectorStoreID, query) (\*CursorPage[[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)], error)
GET/vector\_stores/{vector\_store\_id}/files
##### [Create vector store file](/api/reference/go/resources/vector_stores/subresources/files/methods/create)
client.VectorStores.Files.New(ctx, vectorStoreID, body) (\*[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}/files
##### [Update vector store file attributes](/api/reference/go/resources/vector_stores/subresources/files/methods/update)
client.VectorStores.Files.Update(ctx, vectorStoreID, fileID, body) (\*[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file](/api/reference/go/resources/vector_stores/subresources/files/methods/retrieve)
client.VectorStores.Files.Get(ctx, vectorStoreID, fileID) (\*[VectorStoreFile](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>), error)
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Delete vector store file](/api/reference/go/resources/vector_stores/subresources/files/methods/delete)
client.VectorStores.Files.Delete(ctx, vectorStoreID, fileID) (\*[VectorStoreFileDeleted](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>), error)
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file content](/api/reference/go/resources/vector_stores/subresources/files/methods/content)
client.VectorStores.Files.Content(ctx, vectorStoreID, fileID) (\*Page[[VectorStoreFileContentResponse](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) VectorStoreFileContentResponse > (schema)>)], error)
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
##### ModelsExpand Collapse
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
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
type VectorStoreFileDeleted struct{…}
ID string
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
Object VectorStoreFileDeleted
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)