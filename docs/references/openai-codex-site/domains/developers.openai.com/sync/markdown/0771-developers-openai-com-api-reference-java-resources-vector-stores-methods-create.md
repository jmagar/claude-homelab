Create vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create vector store
[VectorStore](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) vectorStores().create(VectorStoreCreateParamsparams = VectorStoreCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/vector\_stores
Create a vector store.
##### ParametersExpand Collapse
VectorStoreCreateParams params
Optional\<[FileChunkingStrategyParam](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) file_chunking_strategy_param > (schema)>)\> chunkingStrategy
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy. Only applicable if `file\_ids` is non-empty.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) chunking_strategy>)
Optional\<String\> description
A description for the vector store. Can be used to describe the vector store’s purpose.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) description>)
Optional\<ExpiresAfter\> expiresAfter
The expiration policy for a vector store.
JsonValue; anchor "last\_active\_at"constant"last\_active\_at"constant
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) anchor>)
long days
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) expires_after>)
Optional\<List\<String\>\> fileIds
A list of [File](https://platform.openai.com/docs/api-reference/files) IDs that the vector store should use. Useful for tools like `file\_search` that can access files.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) file_ids>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) metadata>)
Optional\<String\> name
The name of the vector store.
[](<#(resource) vector_stores > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) vector_stores > (method) create > (params) default>)
##### ReturnsExpand Collapse
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
### Create vector store
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
import com.openai.models.vectorstores.VectorStore;
import com.openai.models.vectorstores.VectorStoreCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VectorStore vectorStore = client.vectorStores().create();
}
}`
```
```
`{
"id": "vs\_abc123",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ",
"description": "Contains commonly asked questions and answers, organized by topic.",
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
`
```
##### Returns Examples
```
`{
"id": "vs\_abc123",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ",
"description": "Contains commonly asked questions and answers, organized by topic.",
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
`
```