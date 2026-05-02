Vector Stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Vector Stores
##### [List vector stores](/api/reference/java/resources/vector_stores/methods/list)
VectorStoreListPage vectorStores().list(VectorStoreListParamsparams = VectorStoreListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores
##### [Create vector store](/api/reference/java/resources/vector_stores/methods/create)
[VectorStore](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) vectorStores().create(VectorStoreCreateParamsparams = VectorStoreCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores
##### [Retrieve vector store](/api/reference/java/resources/vector_stores/methods/retrieve)
[VectorStore](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) vectorStores().retrieve(VectorStoreRetrieveParamsparams = VectorStoreRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}
##### [Modify vector store](/api/reference/java/resources/vector_stores/methods/update)
[VectorStore](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) vectorStores().update(VectorStoreUpdateParamsparams = VectorStoreUpdateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}
##### [Delete vector store](/api/reference/java/resources/vector_stores/methods/delete)
[VectorStoreDeleted](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>) vectorStores().delete(VectorStoreDeleteParamsparams = VectorStoreDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/vector\_stores/{vector\_store\_id}
##### [Search vector store](/api/reference/java/resources/vector_stores/methods/search)
VectorStoreSearchPage vectorStores().search(VectorStoreSearchParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/search
##### ModelsExpand Collapse
class AutoFileChunkingStrategyParam:
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
JsonValue; type "auto"constant"auto"constant
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
class FileChunkingStrategy: A class that can be one of several variants.union
The strategy used to chunk the file.
class StaticFileChunkingStrategyObject:
[StaticFileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) static\_
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
JsonValue; type "static"constant"static"constant
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
class OtherFileChunkingStrategyObject:
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
JsonValue; type "other"constant"other"constant
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
class FileChunkingStrategyParam: A class that can be one of several variants.union
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
class AutoFileChunkingStrategyParam:
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
JsonValue; type "auto"constant"auto"constant
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
class StaticFileChunkingStrategyObjectParam:
Customize your own chunking strategy by setting chunk size and chunk overlap.
[StaticFileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) static\_
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
JsonValue; type "static"constant"static"constant
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
class OtherFileChunkingStrategyObject:
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
JsonValue; type "other"constant"other"constant
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
class StaticFileChunkingStrategy:
long chunkOverlapTokens
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
long maxChunkSizeTokens
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
class StaticFileChunkingStrategyObject:
[StaticFileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) static\_
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
JsonValue; type "static"constant"static"constant
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
class StaticFileChunkingStrategyObjectParam:
Customize your own chunking strategy by setting chunk size and chunk overlap.
[StaticFileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) static\_
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
JsonValue; type "static"constant"static"constant
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
class VectorStore:
A vector store is a collection of processed files can be used by the `file\_search` tool.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
FileCounts fileCounts
long cancelled
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
long completed
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
long failed
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
long inProgress
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
long total
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
Optional\<Long\> lastActiveAt
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
String name
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
JsonValue; object\_ "vector\_store"constant"vector\_store"constant
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
Status status
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
EXPIRED("expired")
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
IN\_PROGRESS("in\_progress")
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
long usageBytes
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
Optional\<ExpiresAfter\> expiresAfter
The expiration policy for a vector store.
JsonValue; anchor "last\_active\_at"constant"last\_active\_at"constant
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
long days
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
class VectorStoreDeleted:
String id
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "vector\_store.deleted"constant"vector\_store.deleted"constant
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
#### Vector StoresFiles
##### [List vector store files](/api/reference/java/resources/vector_stores/subresources/files/methods/list)
FileListPage vectorStores().files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/files
##### [Create vector store file](/api/reference/java/resources/vector_stores/subresources/files/methods/create)
[VectorStoreFile](</api/reference/java/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) vectorStores().files().create(FileCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/files
##### [Update vector store file attributes](/api/reference/java/resources/vector_stores/subresources/files/methods/update)
[VectorStoreFile](</api/reference/java/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) vectorStores().files().update(FileUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file](/api/reference/java/resources/vector_stores/subresources/files/methods/retrieve)
[VectorStoreFile](</api/reference/java/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) vectorStores().files().retrieve(FileRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Delete vector store file](/api/reference/java/resources/vector_stores/subresources/files/methods/delete)
[VectorStoreFileDeleted](</api/reference/java/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) vectorStores().files().delete(FileDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file content](/api/reference/java/resources/vector_stores/subresources/files/methods/content)
FileContentPage vectorStores().files().content(FileContentParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
##### ModelsExpand Collapse
class VectorStoreFile:
A list of files attached to a vector store.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
Optional\<LastError\> lastError
The last error associated with this vector store file. Will be `null` if there are no errors.
Code code
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
SERVER\_ERROR("server\_error")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
UNSUPPORTED\_FILE("unsupported\_file")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
INVALID\_FILE("invalid\_file")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
String message
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
JsonValue; object\_ "vector\_store.file"constant"vector\_store.file"constant
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
Status status
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 2>)
FAILED("failed")
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status>)
long usageBytes
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
String vectorStoreId
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
Optional\<Attributes\> attributes
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
String
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
double
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
Optional\<[FileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)\> chunkingStrategy
The strategy used to chunk the file.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
class VectorStoreFileDeleted:
String id
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "vector\_store.file.deleted"constant"vector\_store.file.deleted"constant
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
#### Vector StoresFile Batches
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