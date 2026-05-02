Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Vector Stores](/api/reference/python/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
vector\_stores.delete(strvector\_store\_id) -\> [VectorStoreDeleted](</api/reference/python/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### ParametersExpand Collapse
vector\_store\_id: str
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreDeleted: …
id: str
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: Literal["vector\_store.deleted"]
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
Python
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
`from openai import OpenAI
client = OpenAI()
deleted\_vector\_store = client.vector\_stores.delete(
vector\_store\_id="vs\_abc123"
)
print(deleted\_vector\_store)
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