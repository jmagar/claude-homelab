List vector store files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
[Files](/api/reference/typescript/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List vector store files
client.vectorStores.files.list(stringvectorStoreID, FileListParams { after, before, filter, 2 more } query?, RequestOptionsoptions?): CursorPage\<[VectorStoreFile](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file > (schema)>) { id, created\_at, last\_error, 6 more } \>
GET/vector\_stores/{vector\_store\_id}/files
Returns a list of vector store files.
##### ParametersExpand Collapse
vectorStoreID: string
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) vector_store_id > (schema)>)
query: FileListParams { after, before, filter, 2 more }
after?: string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) after>)
before?: string
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) before>)
filter?: "in\_progress" | "completed" | "failed" | "cancelled"
Filter by file status. One of `in\_progress`, `completed`, `failed`, `cancelled`.
One of the following:
"in\_progress"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 0>)
"completed"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 1>)
"failed"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 2>)
"cancelled"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter > (schema) > (member) 3>)
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) filter>)
limit?: number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) vector_stores.files > (method) list > (params) default > (param) order>)
[](<#(resource) vector_stores.files > (method) list > (params) default>)
##### ReturnsExpand Collapse
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
One of the following:
StaticFileChunkingStrategyObject { static, type }
static: [StaticFileChunkingStrategy](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) static_file_chunking_strategy > (schema)>) { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static + (resource) vector_stores > (model) static_file_chunking_strategy > (schema) > (property) max_chunk_size_tokens>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) static>)
type: "static"
Always `static`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) static_file_chunking_strategy_object > (schema)>)
OtherFileChunkingStrategyObject { type }
This is returned when the chunking strategy is unknown. Typically, this is because the file was indexed before the `chunking\_strategy` concept was introduced in the API.
type: "other"
Always `other`.
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy + (resource) vector_stores > (model) other_file_chunking_strategy_object > (schema)>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema) > (property) chunking_strategy>)
[](<#(resource) vector_stores.files > (model) vector_store_file > (schema)>)
### List vector store files
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const vectorStoreFiles = await openai.vectorStores.files.list(
"vs\_abc123"
);
console.log(vectorStoreFiles);
}
main();
`
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