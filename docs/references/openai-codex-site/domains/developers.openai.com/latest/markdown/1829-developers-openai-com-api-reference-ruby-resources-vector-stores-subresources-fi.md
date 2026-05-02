Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List vector store files](/api/reference/ruby/resources/vector_stores/subresources/files/methods/list)
vector\_stores.files.list(vector\_store\_id, \*\*kwargs) -\> CursorPage\<[VectorStoreFile](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more } \>
GET/vector\_stores/{vector\_store\_id}/files
##### [Create vector store file](/api/reference/ruby/resources/vector_stores/subresources/files/methods/create)
vector\_stores.files.create(vector\_store\_id, \*\*kwargs) -\> [VectorStoreFile](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
POST/vector\_stores/{vector\_store\_id}/files
##### [Update vector store file attributes](/api/reference/ruby/resources/vector_stores/subresources/files/methods/update)
vector\_stores.files.update(file\_id, \*\*kwargs) -\> [VectorStoreFile](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
POST/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file](/api/reference/ruby/resources/vector_stores/subresources/files/methods/retrieve)
vector\_stores.files.retrieve(file\_id, \*\*kwargs) -\> [VectorStoreFile](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more }
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Delete vector store file](/api/reference/ruby/resources/vector_stores/subresources/files/methods/delete)
vector\_stores.files.delete(file\_id, \*\*kwargs) -\> [VectorStoreFileDeleted](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
##### [Retrieve vector store file content](/api/reference/ruby/resources/vector_stores/subresources/files/methods/content)
vector\_stores.files.content(file\_id, \*\*kwargs) -\> Page\<[FileContentResponse](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>) { text, type } \>
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
##### ModelsExpand Collapse
class VectorStoreFile { id, created\_at, last\_error, 6 more }
A list of files attached to a vector store.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the vector store file was created.
formatunixtime
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) created_at>)
last\_error: LastError{ code, message}
The last error associated with this vector store file. Will be `null` if there are no errors.
code: :server\_error | :unsupported\_file | :invalid\_file
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
One of the following:
:server\_error
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 0>)
:unsupported\_file
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 1>)
:invalid\_file
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) code>)
message: String
A human-readable description of the error.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error > (property) message>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) last_error>)
object: :"vector\_store.file"
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) object>)
status: :in\_progress | :completed | :cancelled | :failed
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
One of the following:
:in\_progress
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 0>)
:completed
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 1>)
:cancelled
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 2>)
:failed
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status > (member) 3>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) status>)
usage\_bytes: Integer
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) usage_bytes>)
vector\_store\_id: String
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) vector_store_id>)
attributes: Hash[Symbol, String | Float | bool]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
String = String
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 0>)
Float = Float
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 1>)
UnionMember2 = bool
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) attributes>)
chunking\_strategy: [FileChunkingStrategy](</api/reference/ruby/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy > (schema)>)
The strategy used to chunk the file.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
class VectorStoreFileDeleted { id, deleted, object }
id: String
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: :"vector\_store.file.deleted"
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
class FileContentResponse { text, type }
text: String
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type: String
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)