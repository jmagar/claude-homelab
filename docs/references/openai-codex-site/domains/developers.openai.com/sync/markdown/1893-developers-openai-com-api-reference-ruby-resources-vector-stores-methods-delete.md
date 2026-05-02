Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
vector\_stores.delete(vector\_store\_id) -\> [VectorStoreDeleted](</api/reference/ruby/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### ParametersExpand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreDeleted { id, deleted, object }
id: String
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: :"vector\_store.deleted"
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
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
vector\_store\_deleted = openai.vector\_stores.delete("vector\_store\_id")
puts(vector\_store\_deleted)`
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