Delete vector store file | OpenAI API Reference
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
# Delete vector store file
client.vectorStores.files.delete(stringfileID, FileDeleteParams { vector\_store\_id } params, RequestOptionsoptions?): [VectorStoreFileDeleted](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
##### ParametersExpand Collapse
fileID: string
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
params: FileDeleteParams { vector\_store\_id }
vector\_store\_id: string
The ID of the vector store that the file belongs to.
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id>)
[](<#(resource) vector_stores.files > (method) delete > (params) default>)
##### ReturnsExpand Collapse
VectorStoreFileDeleted { id, deleted, object }
id: string
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: "vector\_store.file.deleted"
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
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
const deletedVectorStoreFile = await openai.vectorStores.files.delete(
"file-abc123",
{ vector\_store\_id: "vs\_abc123" }
);
console.log(deletedVectorStoreFile);
}
main();
`
```
```
`{
id: "file-abc123",
object: "vector\_store.file.deleted",
deleted: true
}
`
```
##### Returns Examples
```
`{
id: "file-abc123",
object: "vector\_store.file.deleted",
deleted: true
}
`
```