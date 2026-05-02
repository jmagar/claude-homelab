Vector Stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Vector Stores
##### [List vector stores](/api/reference/typescript/resources/vector_stores/methods/list)
client.vectorStores.list(VectorStoreListParams { after, before, limit, order } query?, RequestOptionsoptions?): CursorPage\<[VectorStore](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more } \>
GET/vector\_stores
##### [Create vector store](/api/reference/typescript/resources/vector_stores/methods/create)
client.vectorStores.create(VectorStoreCreateParams { chunking\_strategy, description, expires\_after, 3 more } body, RequestOptionsoptions?): [VectorStore](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more }
POST/vector\_stores
##### [Retrieve vector store](/api/reference/typescript/resources/vector_stores/methods/retrieve)
client.vectorStores.retrieve(stringvectorStoreID, RequestOptionsoptions?): [VectorStore](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more }
GET/vector\_stores/{vector\_store\_id}
##### [Modify vector store](/api/reference/typescript/resources/vector_stores/methods/update)
client.vectorStores.update(stringvectorStoreID, VectorStoreUpdateParams { expires\_after, metadata, name } body, RequestOptionsoptions?): [VectorStore](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more }
POST/vector\_stores/{vector\_store\_id}
##### [Delete vector store](/api/reference/typescript/resources/vector_stores/methods/delete)
client.vectorStores.delete(stringvectorStoreID, RequestOptionsoptions?): [VectorStoreDeleted](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}
##### [Search vector store](/api/reference/typescript/resources/vector_stores/methods/search)
client.vectorStores.search(stringvectorStoreID, VectorStoreSearchParams { query, filters, max\_num\_results, 2 more } body, RequestOptionsoptions?): Page\<[VectorStoreSearchResponse](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store_search_response > (schema)>) { attributes, content, file\_id, 2 more } \>
POST/vector\_stores/{vector\_store\_id}/search
##### ModelsExpand Collapse
AutoFileChunkingStrategyParam { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
FileChunkingStrategy = [StaticFileChunkingStrategyObject](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>) { static, type } | [OtherFileChunkingStrategyObject](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>) { type }
The strategy used to chunk the file.
One of the following:
StaticFileChunkingStrategyObject { static, type }
static: [StaticFileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
OtherFileChunkingStrategyObject { type }
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: "other"
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
FileChunkingStrategyParam = [AutoFileChunkingStrategyParam](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>) { type } | [StaticFileChunkingStrategyObjectParam](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>) { static, type }
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
AutoFileChunkingStrategyParam { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
StaticFileChunkingStrategyObjectParam { static, type }
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
OtherFileChunkingStrategyObject { type }
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: "other"
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
StaticFileChunkingStrategy { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
StaticFileChunkingStrategyObject { static, type }
static: [StaticFileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
StaticFileChunkingStrategyObjectParam { static, type }
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
VectorStore { id, created\_at, file\_counts, 8 more }
A vector store is a collection of processed files can be used by the `file\_search` tool.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
file\_counts: FileCounts { cancelled, completed, failed, 2 more }
cancelled: number
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
completed: number
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
failed: number
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
in\_progress: number
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
total: number
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
last\_active\_at: number | null
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
name: string
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
object: "vector\_store"
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
status: "expired" | "in\_progress" | "completed"
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
"expired"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
usage\_bytes: number
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
expires\_after?: ExpiresAfter { anchor, days }
The expiration policy for a vector store.
anchor: "last\_active\_at"
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
days: number
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
expires\_at?: number | null
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
VectorStoreDeleted { id, deleted, object }
id: string
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: "vector\_store.deleted"
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
VectorStoreSearchResponse { attributes, content, file\_id, 2 more }
attributes: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes>)
content: Array\<Content\>
Content chunks from the file.
text: string
The text content returned from search.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) text>)
type: "text"
The type of content.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content>)
file\_id: string
The ID of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) file_id>)
filename: string
The name of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) filename>)
score: number
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema)>)
#### Vector StoresFiles
##### [List vector store files](/api/reference/typescript/resources/vector_stores/subresources/files/methods/list)
client.vectorStores.files.list(stringvectorStoreID, FileListParams { after, before, filter, 2 more } query?, RequestOptionsoptions?): CursorPage\<[VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more } \>
GET/vector\_stores/{vector\_store\_id}/files
##### [Create vector store file](/api/reference/typescript/resources/vector_stores/subresources/files/methods/create)
client.vectorStores.files.create(stringvectorStoreID, FileCreateParams { file\_id, attributes, chunking\_strategy } body, RequestOptionsoptions?): [VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
POST/vector\_stores/{vector\_store\_id}/files
##### [Update vector store file attributes](/api/reference/typescript/resources/vector_stores/subresources/files/methods/update)
client.vectorStores.files.update(stringfileID, FileUpdateParams { vector\_store\_id, attributes } params, RequestOptionsoptions?): [VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
POST/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file](/api/reference/typescript/resources/vector_stores/subresources/files/methods/retrieve)
client.vectorStores.files.retrieve(stringfileID, FileRetrieveParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Delete vector store file](/api/reference/typescript/resources/vector_stores/subresources/files/methods/delete)
client.vectorStores.files.delete(stringfileID, FileDeleteParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFileDeleted](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file content](/api/reference/typescript/resources/vector_stores/subresources/files/methods/content)
client.vectorStores.files.content(stringfileID, FileContentParams { vector\_store\_id } params, RequestOptionsoptions?): Page\<[FileContentResponse](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>) { text, type } \>
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
##### ModelsExpand Collapse
VectorStoreFile { id, created\_at, last\_error, 6 more }
A list of files attached to a vector store.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
last\_error: LastError | null
The last error associated with this vector store file. Will be `null` if there are no errors.
code: "server\_error" | "unsupported\_file" | "invalid\_file"
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
"server\_error"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
"unsupported\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
object: "vector\_store.file"
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
status: "in\_progress" | "completed" | "cancelled" | "failed"
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
One of the following:
"in\_progress"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 1>)
"cancelled"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status>)
usage\_bytes: number
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
vector\_store\_id: string
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
attributes?: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
chunking\_strategy?: [FileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
The strategy used to chunk the file.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
VectorStoreFileDeleted { id, deleted, object }
id: string
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: "vector\_store.file.deleted"
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
FileContentResponse { text, type }
text?: string
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type?: string
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)
#### Vector StoresFile Batches
##### [Create vector store file batch](/api/reference/typescript/resources/vector_stores/subresources/file_batches/methods/create)
client.vectorStores.fileBatches.create(stringvectorStoreID, FileBatchCreateParams { attributes, chunking\_strategy, file\_ids, files } body, RequestOptionsoptions?): [VectorStoreFileBatch](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/typescript/resources/vector_stores/subresources/file_batches/methods/retrieve)
client.vectorStores.fileBatches.retrieve(stringbatchID, FileBatchRetrieveParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFileBatch](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/typescript/resources/vector_stores/subresources/file_batches/methods/cancel)
client.vectorStores.fileBatches.cancel(stringbatchID, FileBatchCancelParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFileBatch](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>) { id, created\_at, file\_counts, 3 more }
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/typescript/resources/vector_stores/subresources/file_batches/methods/list_files)
client.vectorStores.fileBatches.listFiles(stringbatchID, FileBatchListFilesParams { vector\_store\_id, after, before, 3 more } params, RequestOptionsoptions?): CursorPage\<[VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more } \>
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
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