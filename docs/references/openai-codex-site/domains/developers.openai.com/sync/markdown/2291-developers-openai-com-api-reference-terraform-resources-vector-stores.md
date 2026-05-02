Vector Stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Vector Stores
#### resource openai\_vector\_store
##### optional Expand Collapse
description?: String
A description for the vector store. Can be used to describe the vector store’s purpose.
[](<#(resource) vector_stores > (terraform resource) > (attribute) description>)
file\_ids?: List[String]
A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_ids>)
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores > (terraform resource) > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores > (terraform resource) > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores > (terraform resource) > (attribute) chunking_strategy>)
name?: String
The name of the vector store.
[](<#(resource) vector_stores > (terraform resource) > (attribute) name>)
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (terraform resource) > (attribute) metadata>)
expires\_after?: Attributes
The expiration policy for a vector store.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (terraform resource) > (attribute) expires_after > (attribute) anchor>)
days: Int64
The number of days after the anchor time that the vector store will expire.
[](<#(resource) vector_stores > (terraform resource) > (attribute) expires_after > (attribute) days>)
[](<#(resource) vector_stores > (terraform resource) > (attribute) expires_after>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store was created.
[](<#(resource) vector_stores > (terraform resource) > (attribute) created_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the vector store will expire.
[](<#(resource) vector_stores > (terraform resource) > (attribute) expires_at>)
last\_active\_at: Int64
The Unix timestamp (in seconds) for when the vector store was last active.
[](<#(resource) vector_stores > (terraform resource) > (attribute) last_active_at>)
object: String
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (terraform resource) > (attribute) object>)
status: String
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
[](<#(resource) vector_stores > (terraform resource) > (attribute) status>)
usage\_bytes: Int64
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (terraform resource) > (attribute) usage_bytes>)
file\_counts: Attributes
cancelled: Int64
The number of files that were cancelled.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores > (terraform resource) > (attribute) file_counts>)
### openai\_vector\_store
Terraform
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
`resource "openai\_vector\_store" "example\_vector\_store" {
chunking\_strategy = {
type = "auto"
}
description = "description"
expires\_after = {
anchor = "last\_active\_at"
days = 1
}
file\_ids = ["string"]
metadata = {
foo = "string"
}
name = "name"
}
`
```
#### data openai\_vector\_store
##### optional Expand Collapse
vector\_store\_id?: String
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) vector_store_id>)
find\_one\_by?: Attributes
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) find_one_by > (attribute) before>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store was created.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) created_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the vector store will expire.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) expires_at>)
last\_active\_at: Int64
The Unix timestamp (in seconds) for when the vector store was last active.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) last_active_at>)
name: String
The name of the vector store.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) object>)
status: String
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) status>)
usage\_bytes: Int64
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) usage_bytes>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) metadata>)
expires\_after: Attributes
The expiration policy for a vector store.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) expires_after > (attribute) anchor>)
days: Int64
The number of days after the anchor time that the vector store will expire.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) expires_after > (attribute) days>)
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) expires_after>)
file\_counts: Attributes
cancelled: Int64
The number of files that were cancelled.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores > (terraform datasource-single) > (attribute) file_counts>)
### openai\_vector\_store
Terraform
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
`data "openai\_vector\_store" "example\_vector\_store" {
vector\_store\_id = "vector\_store\_id"
}
`
```
#### data openai\_vector\_stores
##### optional Expand Collapse
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) before>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store was created.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
file\_counts: Attributes
cancelled: Int64
The number of files that were cancelled.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) file_counts>)
last\_active\_at: Int64
The Unix timestamp (in seconds) for when the vector store was last active.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) last_active_at>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
The name of the vector store.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) status>)
usage\_bytes: Int64
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) usage_bytes>)
expires\_after: Attributes
The expiration policy for a vector store.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) expires_after > (attribute) anchor>)
days: Int64
The number of days after the anchor time that the vector store will expire.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) expires_after > (attribute) days>)
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) expires_after>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the vector store will expire.
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
[](<#(resource) vector_stores > (terraform datasource-plural) > (attribute) items>)
### openai\_vector\_stores
Terraform
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
`data "openai\_vector\_stores" "example\_vector\_stores" {
before = "before"
}
`
```
#### Vector StoresFiles
#### resource openai\_vector\_store\_file
##### required Expand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) vector_store_id>)
file\_id: String
A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) file_id>)
##### optional Expand Collapse
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) chunking_strategy>)
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) attributes>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store file was created.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) object>)
status: String
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) status>)
usage\_bytes: Int64
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) usage_bytes>)
last\_error: Attributes
The last error associated with this vector store file. Will be `null` if there are no errors.
code: String
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) last_error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) last_error > (attribute) message>)
[](<#(resource) vector_stores.files > (terraform resource) > (attribute) last_error>)
### openai\_vector\_store\_file
Terraform
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
`resource "openai\_vector\_store\_file" "example\_vector\_store\_file" {
vector\_store\_id = "vs\_abc123"
file\_id = "file\_id"
attributes = {
foo = "string"
}
chunking\_strategy = {
type = "auto"
}
}
`
```
#### data openai\_vector\_store\_file
##### required Expand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) vector_store_id>)
##### optional Expand Collapse
file\_id?: String
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) file_id>)
find\_one\_by?: Attributes
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) find_one_by > (attribute) before>)
filter?: String
Filter by file status. One of `in\_progress`, `completed`, `failed`, `cancelled`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) find_one_by > (attribute) filter>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store file was created.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) object>)
status: String
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) status>)
usage\_bytes: Int64
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) usage_bytes>)
chunking\_strategy: Attributes
The strategy used to chunk the file.
static: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) chunking_strategy > (attribute) static>)
type: String
Always `static`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) chunking_strategy > (attribute) type>)
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) chunking_strategy>)
last\_error: Attributes
The last error associated with this vector store file. Will be `null` if there are no errors.
code: String
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) last_error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) last_error > (attribute) message>)
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) last_error>)
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.files > (terraform datasource-single) > (attribute) attributes>)
### openai\_vector\_store\_file
Terraform
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
`data "openai\_vector\_store\_file" "example\_vector\_store\_file" {
vector\_store\_id = "vs\_abc123"
file\_id = "file-abc123"
}
`
```
#### data openai\_vector\_store\_files
##### required Expand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) vector_store_id>)
##### optional Expand Collapse
before?: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) before>)
filter?: String
Filter by file status. One of `in\_progress`, `completed`, `failed`, `cancelled`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) filter>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store file was created.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
last\_error: Attributes
The last error associated with this vector store file. Will be `null` if there are no errors.
code: String
One of `server\_error`, `unsupported\_file`, or `invalid\_file`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) last_error > (attribute) code>)
message: String
A human-readable description of the error.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) last_error > (attribute) message>)
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) last_error>)
object: String
The object type, which is always `vector\_store.file`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
The status of the vector store file, which can be either `in\_progress`, `completed`, `cancelled`, or `failed`. The status `completed` indicates that the vector store file is ready for use.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) status>)
usage\_bytes: Int64
The total vector store usage in bytes. Note that this may be different from the original file size.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) usage_bytes>)
vector\_store\_id: String
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) that the [File](https://platform.openai.com/docs/api-reference/files) is attached to.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) vector_store_id>)
attributes: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) attributes>)
chunking\_strategy: Attributes
The strategy used to chunk the file.
static: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) chunking_strategy > (attribute) static>)
type: String
Always `static`.
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) chunking_strategy > (attribute) type>)
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items > (attribute) chunking_strategy>)
[](<#(resource) vector_stores.files > (terraform datasource-plural) > (attribute) items>)
### openai\_vector\_store\_files
Terraform
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
`data "openai\_vector\_store\_files" "example\_vector\_store\_files" {
vector\_store\_id = "vector\_store\_id"
before = "before"
filter = "in\_progress"
}
`
```
#### Vector StoresFile Batches
#### resource openai\_vector\_store\_file\_batch
##### required Expand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) vector_store_id>)
##### optional Expand Collapse
file\_ids?: List[String]
A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files. If `attributes` or `chunking\_strategy` are provided, they will be applied to all files in the batch. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `files`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_ids>)
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) chunking_strategy>)
files?: List[Attributes]
A list of objects that each include a `file\_id` plus optional `attributes` or `chunking\_strategy`. Use this when you need to override metadata for specific files. The global `attributes` or `chunking\_strategy` will be ignored and must be specified for each file. The maximum batch size is 2000 files. This endpoint is recommended for multi-file ingestion and helps reduce per-vector-store write request pressure. Mutually exclusive with `file\_ids`.
file\_id: String
A [File](https://platform.openai.com/docs/api-reference/files) ID that the vector store should use. Useful for tools like `file\_search` that can access files. For multi-file ingestion, we recommend [`file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch) to minimize per-vector-store write requests.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) file_id>)
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) attributes>)
chunking\_strategy?: Attributes
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
type: String
Always `auto`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) type>)
static?: Attributes
chunk\_overlap\_tokens: Int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static > (attribute) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: Int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static > (attribute) max_chunk_size_tokens>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy > (attribute) static>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files > (attribute) chunking_strategy>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) files>)
attributes?: Dynamic
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) attributes>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store files batch was created.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) object>)
status: String
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) status>)
file\_counts: Attributes
cancelled: Int64
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores.file_batches > (terraform resource) > (attribute) file_counts>)
### openai\_vector\_store\_file\_batch
Terraform
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
`resource "openai\_vector\_store\_file\_batch" "example\_vector\_store\_file\_batch" {
vector\_store\_id = "vs\_abc123"
attributes = {
foo = "string"
}
chunking\_strategy = {
type = "auto"
}
file\_ids = ["string"]
files = [{
file\_id = "file\_id"
attributes = {
foo = "string"
}
chunking\_strategy = {
type = "auto"
}
}]
}
`
```
#### data openai\_vector\_store\_file\_batch
##### required Expand Collapse
batch\_id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) batch_id>)
vector\_store\_id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) vector_store_id>)
##### computed Expand Collapse
id: String
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the vector store files batch was created.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) created_at>)
object: String
The object type, which is always `vector\_store.file\_batch`.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) object>)
status: String
The status of the vector store files batch, which can be either `in\_progress`, `completed`, `cancelled` or `failed`.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) status>)
file\_counts: Attributes
cancelled: Int64
The number of files that where cancelled.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) cancelled>)
completed: Int64
The number of files that have been processed.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) completed>)
failed: Int64
The number of files that have failed to process.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) failed>)
in\_progress: Int64
The number of files that are currently being processed.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) in_progress>)
total: Int64
The total number of files.
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts > (attribute) total>)
[](<#(resource) vector_stores.file_batches > (terraform datasource-single) > (attribute) file_counts>)
### openai\_vector\_store\_file\_batch
Terraform
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
`data "openai\_vector\_store\_file\_batch" "example\_vector\_store\_file\_batch" {
vector\_store\_id = "vs\_abc123"
batch\_id = "vsfb\_abc123"
}
`
```