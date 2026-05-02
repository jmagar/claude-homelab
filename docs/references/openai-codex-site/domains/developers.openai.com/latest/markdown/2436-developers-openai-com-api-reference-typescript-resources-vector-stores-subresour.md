Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
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