List vector store files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
[Files](/api/reference/java/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List vector store files
FileListPage vectorStores().files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/files
Returns a list of vector store files.
##### ParametersExpand Collapse
FileListParams params
Optional\<String\> vectorStoreId
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) vector_store_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) after > (schema)>)
Optional\<String\> before
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) before > (schema)>)
Optional\<[Filter](</api/reference/java/resources/vector_stores/subresources/files/methods/list#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema)>)\> filter
Filter by file status. One of `in\_progress`, `completed`, `failed`, `cancelled`.
IN\_PROGRESS("in\_progress")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 0>)
COMPLETED("completed")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 1>)
FAILED("failed")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 2>)
CANCELLED("cancelled")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 3>)
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/vector_stores/subresources/files/methods/list#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
ASC("asc")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) vector_stores.files > (method) list > (params) default>)
##### ReturnsExpand Collapse
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
One of the following:
class StaticFileChunkingStrategyObject:
[StaticFileChunkingStrategy](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) static\_
long chunkOverlapTokens
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
long maxChunkSizeTokens
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
JsonValue; type "static"constant"static"constant
Always `static`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
class OtherFileChunkingStrategyObject:
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
JsonValue; type "other"constant"other"constant
Always `other`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
### List vector store files
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.vectorstores.files.FileListPage;
import com.openai.models.vectorstores.files.FileListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileListPage page = client.vectorStores().files().list("vector\_store\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "file-abc123",
"object": "vector\_store.file",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123"
},
{
"id": "file-abc456",
"object": "vector\_store.file",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123"
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "file-abc123",
"object": "vector\_store.file",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123"
},
{
"id": "file-abc456",
"object": "vector\_store.file",
"created\_at": 1699061776,
"vector\_store\_id": "vs\_abc123"
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```