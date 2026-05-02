Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
client.vectorStores.delete(stringvectorStoreID, RequestOptionsoptions?): [VectorStoreDeleted](</api/reference/typescript/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### ParametersExpand Collapse
vectorStoreID: string
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
##### ReturnsExpand Collapse
VectorStoreDeleted { id, deleted, object }
id: string
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
object: "vector\_store.deleted"
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
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
const deletedVectorStore = await openai.vectorStores.delete(
"vs\_abc123"
);
console.log(deletedVectorStore);
}
main();
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