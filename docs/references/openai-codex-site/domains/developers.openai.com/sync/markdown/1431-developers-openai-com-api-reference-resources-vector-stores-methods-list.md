List vector stores | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List vector stores
GET/vector\_stores
Returns a list of vector stores.
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) vector_stores > (method) list > (params) default > (param) after > (schema)>)
before: optional string
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) vector_stores > (method) list > (params) default > (param) before > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) vector_stores > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) vector_stores > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [VectorStore](</api/reference/resources/vector_stores#(resource) vector_stores > (model) vector_store > (schema)>) { id, created\_at, file\_counts, 8 more }
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the vector store was created.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) created_at>)
file\_counts: object { cancelled, completed, failed, 2 more }
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
last\_active\_at: number
The Unix timestamp (in seconds) for when the vector store was last active.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) last_active_at>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
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
status: "expired" or "in\_progress" or "completed"
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
expires\_after: optional object { anchor, days }
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
expires\_at: optional number
The Unix timestamp (in seconds) for when the vector store will expire.
formatunixtime
[](<#(resource) vector_stores > (model) vector_store > (schema) > (property) expires_at>)
[](<#(resource) vector_stores > (method) list > (network schema) > (property) data>)
first\_id: string
[](<#(resource) vector_stores > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
[](<#(resource) vector_stores > (method) list > (network schema) > (property) has_more>)
last\_id: string
[](<#(resource) vector_stores > (method) list > (network schema) > (property) last_id>)
object: string
[](<#(resource) vector_stores > (method) list > (network schema) > (property) object>)
### List vector stores
HTTP
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
`curl https://api.openai.com/v1/vector\_stores \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2"
`
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