Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### Path ParametersExpand Collapse
vector\_store\_id: string
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
##### ReturnsExpand Collapse
VectorStoreDeleted object { id, deleted, object }
id: string
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: "vector\_store.deleted"
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
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
`curl https://api.openai.com/v1/vector\_stores/vs\_abc123 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-X DELETE
`
```
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```
##### Returns Examples
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```