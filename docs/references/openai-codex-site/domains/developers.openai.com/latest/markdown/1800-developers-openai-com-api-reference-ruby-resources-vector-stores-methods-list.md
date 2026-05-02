List vector stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List vector stores
vector\_stores.list(\*\*kwargs) -\> CursorPage\<[VectorStore](</api/reference/ruby/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more } \>
GET/vector\_stores
Returns a list of vector stores.
##### ParametersExpand Collapse
after: String
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) vector_stores > (method) list > (params) default > (param) after > (schema)>)
before: String
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores > (method) list > (params) default > (param) before > (schema)>)
limit: Integer
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) vector_stores > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
:asc
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class VectorStore { id, created\_at, file\_counts, 8 more }
A vector store is a collection of processed files can be used by the `file\_search` tool.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
file\_counts: FileCounts{ cancelled, completed, failed, 2 more}
cancelled: Integer
The number of files that were cancelled.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) cancelled>)
completed: Integer
The number of files that have been successfully processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) completed>)
failed: Integer
The number of files that have failed to process.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) failed>)
in\_progress: Integer
The number of files that are currently being processed.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) in_progress>)
total: Integer
The total number of files.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts > (property) total>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) file_counts>)
last\_active\_at: Integer
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) metadata>)
name: String
The name of the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) name>)
object: :vector\_store
The object type, which is always `vector\_store`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) object>)
status: :expired | :in\_progress | :completed
The status of the vector store, which can be either `expired`, `in\_progress`, or `completed`. A status of `completed` indicates that the vector store is ready for use.
One of the following:
:expired
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 0>)
:in\_progress
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 1>)
:completed
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status > (member) 2>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) status>)
usage\_bytes: Integer
The total number of bytes used by the files in the vector store.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) usage_bytes>)
expires\_after: ExpiresAfter{ anchor, days}
The expiration policy for a vector store.
anchor: :last\_active\_at
Anchor timestamp after which the expiration policy applies. Supported anchors: `last\_active\_at`.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) anchor>)
days: Integer
The number of days after the anchor time that the vector store will expire.
minimum1
maximum365
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after > (property) days>)
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_after>)
expires\_at: Integer
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (model) vector_store > (schema)>)
### List vector stores
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
page = openai.vector\_stores.list
puts(page)`
```
```
`{
"object": "list",
"data": [
{
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
},
{
"id": "vs\_abc456",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ v2",
"description": null,
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
],
"first\_id": "vs\_abc123",
"last\_id": "vs\_abc456",
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
},
{
"id": "vs\_abc456",
"object": "vector\_store",
"created\_at": 1699061776,
"name": "Support FAQ v2",
"description": null,
"bytes": 139920,
"file\_counts": {
"in\_progress": 0,
"completed": 3,
"failed": 0,
"cancelled": 0,
"total": 3
}
}
],
"first\_id": "vs\_abc123",
"last\_id": "vs\_abc456",
"has\_more": false
}
`
```