Vector Stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Vector Stores
##### [List vector stores](/api/reference/go/resources/vector_stores/methods/list)
client.VectorStores.List(ctx, query) (\*CursorPage[[VectorStore](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>)], error)
GET/vector\_stores
##### [Create vector store](/api/reference/go/resources/vector_stores/methods/create)
client.VectorStores.New(ctx, body) (\*[VectorStore](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>), error)
POST/vector\_stores
##### [Retrieve vector store](/api/reference/go/resources/vector_stores/methods/retrieve)
client.VectorStores.Get(ctx, vectorStoreID) (\*[VectorStore](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>), error)
GET/vector\_stores/{vector\_store\_id}
##### [Modify vector store](/api/reference/go/resources/vector_stores/methods/update)
client.VectorStores.Update(ctx, vectorStoreID, body) (\*[VectorStore](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>), error)
POST/vector\_stores/{vector\_store\_id}
##### [Delete vector store](/api/reference/go/resources/vector_stores/methods/delete)
client.VectorStores.Delete(ctx, vectorStoreID) (\*[VectorStoreDeleted](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>), error)
DELETE/vector\_stores/{vector\_store\_id}
##### [Search vector store](/api/reference/go/resources/vector_stores/methods/search)
client.VectorStores.Search(ctx, vectorStoreID, body) (\*Page[[VectorStoreSearchResponse](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) VectorStoreSearchResponse > (schema)>)], error)
POST/vector\_stores/{vector\_store\_id}/search
##### ModelsExpand Collapse
type AutoFileChunkingStrategyParamResp struct{…}
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
Type Auto
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
type FileChunkingStrategyUnion interface{…}
The strategy used to chunk the file.
One of the following:
type StaticFileChunkingStrategyObject struct{…}
Static [StaticFileChunkingStrategy](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
Type Static
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
type OtherFileChunkingStrategyObject struct{…}
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
Type Other
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
type FileChunkingStrategyParamUnionResp interface{…}
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
type AutoFileChunkingStrategyParamResp struct{…}
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
Type Auto
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
type StaticFileChunkingStrategyObjectParamResp struct{…}
Customize your own chunking strategy by setting chunk size and chunk overlap.
Static [StaticFileChunkingStrategy](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
Type Static
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
type OtherFileChunkingStrategyObject struct{…}
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
Type Other
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
type StaticFileChunkingStrategy struct{…}
ChunkOverlapTokens int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
MaxChunkSizeTokens int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
type StaticFileChunkingStrategyObject struct{…}
Static [StaticFileChunkingStrategy](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
Type Static
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
type StaticFileChunkingStrategyObjectParamResp struct{…}
Customize your own chunking strategy by setting chunk size and chunk overlap.
Static [StaticFileChunkingStrategy](</api/reference/go/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
Type Static
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
type VectorStore struct{…}
A vector store is a collection of processed files can be used by the `file\_search` tool.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
FileCounts VectorStoreFileCounts
Cancelled int64
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
Completed int64
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
Failed int64
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
InProgress int64
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
Total int64
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
LastActiveAt int64
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
Name string
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
Object VectorStore
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
Status VectorStoreStatus
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
const VectorStoreStatusExpired VectorStoreStatus = "expired"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
const VectorStoreStatusInProgress VectorStoreStatus = "in\_progress"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
const VectorStoreStatusCompleted VectorStoreStatus = "completed"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
UsageBytes int64
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
ExpiresAfter VectorStoreExpiresAfterOptional
The expiration policy for a vector store.
Anchor LastActiveAt
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
Days int64
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
type VectorStoreDeleted struct{…}
ID string
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
Object VectorStoreDeleted
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
#### Vector StoresFiles
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
#### Vector StoresFile Batches
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