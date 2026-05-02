Vector Stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Vector Stores
##### [List vector stores](/api/reference/python/resources/vector_stores/methods/list)
vector\_stores.list(VectorStoreListParams\*\*kwargs) -\> SyncCursorPage[[VectorStore](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>)]
GET/vector\_stores
##### [Create vector store](/api/reference/python/resources/vector_stores/methods/create)
vector\_stores.create(VectorStoreCreateParams\*\*kwargs) -\> [VectorStore](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>)
POST/vector\_stores
##### [Retrieve vector store](/api/reference/python/resources/vector_stores/methods/retrieve)
vector\_stores.retrieve(strvector\_store\_id) -\> [VectorStore](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>)
GET/vector\_stores/{vector\_store\_id}
##### [Modify vector store](/api/reference/python/resources/vector_stores/methods/update)
vector\_stores.update(strvector\_store\_id, VectorStoreUpdateParams\*\*kwargs) -\> [VectorStore](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>)
POST/vector\_stores/{vector\_store\_id}
##### [Delete vector store](/api/reference/python/resources/vector_stores/methods/delete)
vector\_stores.delete(strvector\_store\_id) -\> [VectorStoreDeleted](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
DELETE/vector\_stores/{vector\_store\_id}
##### [Search vector store](/api/reference/python/resources/vector_stores/methods/search)
vector\_stores.search(strvector\_store\_id, VectorStoreSearchParams\*\*kwargs) -\> SyncPage[[VectorStoreSearchResponse](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store_search_response > (schema)>)]
POST/vector\_stores/{vector\_store\_id}/search
##### ModelsExpand Collapse
class AutoFileChunkingStrategyParam: …
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: Literal["auto"]
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
[FileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
The strategy used to chunk the file.
One of the following:
class StaticFileChunkingStrategyObject: …
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
class OtherFileChunkingStrategyObject: …
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: Literal["other"]
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
[FileChunkingStrategyParam](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
One of the following:
class AutoFileChunkingStrategyParam: …
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: Literal["auto"]
Always `auto`.
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) auto_file_chunking_strategy_param > (schema)>)
class StaticFileChunkingStrategyObjectParam: …
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
[](<#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)
class OtherFileChunkingStrategyObject: …
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: Literal["other"]
Always `other`.
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
class StaticFileChunkingStrategy: …
chunk\_overlap\_tokens: int
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: int
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
class StaticFileChunkingStrategyObject: …
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
class StaticFileChunkingStrategyObjectParam: …
Customize your own chunking strategy by setting chunk size and chunk overlap.
static: [StaticFileChunkingStrategy](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema) > (property) type>)
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object_param > (schema)>)
class VectorStore: …
A vector store is a collection of processed files can be used by the `file\_search` tool.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
file\_counts: FileCounts
cancelled: int
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
completed: int
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
failed: int
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
in\_progress: int
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
total: int
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
last\_active\_at: Optional[int]
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
name: str
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
object: Literal["vector\_store"]
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
status: Literal["expired", "in\_progress", "completed"]
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
"expired"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
usage\_bytes: int
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
expires\_after: Optional[ExpiresAfter]
The expiration policy for a vector store.
anchor: Literal["last\_active\_at"]
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
days: int
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
class VectorStoreDeleted: …
id: str
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: Literal["vector\_store.deleted"]
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
class VectorStoreSearchResponse: …
attributes: Optional[Dict[str, Union[str, float, bool]]]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
str
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 0>)
float
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) attributes>)
content: List[Content]
Content chunks from the file.
text: str
The text content returned from search.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) text>)
type: Literal["text"]
The type of content.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) content>)
file\_id: str
The ID of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) file_id>)
filename: str
The name of the vector store file.
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) filename>)
score: float
The similarity score for the result.
minimum0
maximum1
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema) > (property) score>)
[](<#(resource) vector_stores > (model) vector_store_search_response > (schema)>)
#### Vector StoresFiles
##### [List vector store files](/api/reference/python/resources/vector_stores/subresources/files/methods/list)
vector\_stores.files.list(strvector\_store\_id, FileListParams\*\*kwargs) -\> SyncCursorPage[[VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)]
GET/vector\_stores/{vector\_store\_id}/files
##### [Create vector store file](/api/reference/python/resources/vector_stores/subresources/files/methods/create)
vector\_stores.files.create(strvector\_store\_id, FileCreateParams\*\*kwargs) -\> [VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
POST/vector\_stores/{vector\_store\_id}/files
##### [Update vector store file attributes](/api/reference/python/resources/vector_stores/subresources/files/methods/update)
vector\_stores.files.update(strfile\_id, FileUpdateParams\*\*kwargs) -\> [VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
POST/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file](/api/reference/python/resources/vector_stores/subresources/files/methods/retrieve)
vector\_stores.files.retrieve(strfile\_id, FileRetrieveParams\*\*kwargs) -\> [VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Delete vector store file](/api/reference/python/resources/vector_stores/subresources/files/methods/delete)
vector\_stores.files.delete(strfile\_id, FileDeleteParams\*\*kwargs) -\> [VectorStoreFileDeleted](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file content](/api/reference/python/resources/vector_stores/subresources/files/methods/content)
vector\_stores.files.content(strfile\_id, FileContentParams\*\*kwargs) -\> SyncPage[[FileContentResponse](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>)]
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
##### ModelsExpand Collapse
class VectorStoreFile: …
A list of files attached to a vector store.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
last\_error: Optional[LastError]
The last error associated with this vector store file. Will be `null` if there are no errors.
code: Literal["server\_error", "unsupported\_file", "invalid\_file"]
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
"server\_error"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
"unsupported\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_file"
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
message: str
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
object: Literal["vector\_store.file"]
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
status: Literal["in\_progress", "completed", "cancelled", "failed"]
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
usage\_bytes: int
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
vector\_store\_id: str
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
attributes: Optional[Dict[str, Union[str, float, bool]]]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
str
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
float
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
chunking\_strategy: Optional[FileChunkingStrategy]
The strategy used to chunk the file.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
class VectorStoreFileDeleted: …
id: str
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: Literal["vector\_store.file.deleted"]
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
class FileContentResponse: …
text: Optional[str]
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type: Optional[str]
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)
#### Vector StoresFile Batches
##### [Create vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/create)
vector\_stores.file\_batches.create(strvector\_store\_id, FileBatchCreateParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
POST/vector\_stores/{vector\_store\_id}/file\_batches
##### [Retrieve vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/retrieve)
vector\_stores.file\_batches.retrieve(strbatch\_id, FileBatchRetrieveParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}
##### [Cancel vector store file batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/cancel)
vector\_stores.file\_batches.cancel(strbatch\_id, FileBatchCancelParams\*\*kwargs) -\> [VectorStoreFileBatch](</api/reference/python/resources/vector_stores#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)
POST/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/cancel
##### [List vector store files in a batch](/api/reference/python/resources/vector_stores/subresources/file_batches/methods/list_files)
vector\_stores.file\_batches.list\_files(strbatch\_id, FileBatchListFilesParams\*\*kwargs) -\> SyncCursorPage[[VectorStoreFile](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>)]
GET/vector\_stores/{vector\_store\_id}/file\_batches/{batch\_id}/files
##### ModelsExpand Collapse
class VectorStoreFileBatch: …
A batch of files attached to a vector store.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the vector store files batch was created.
formatunixtime
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) created_at>)
file\_counts: FileCounts
cancelled: int
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) cancelled>)
completed: int
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) completed>)
failed: int
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) failed>)
in\_progress: int
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) in_progress>)
total: int
The total number of files.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) file_counts>)
object: Literal["vector\_store.files\_batch"]
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) object>)
status: Literal["in\_progress", "completed", "cancelled", "failed"]
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
vector\_store\_id: str
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema) > (property) vector_store_id>)
[](<#(resource) vector_stores.file_batches > (model) vector_store_file_batch > (schema)>)