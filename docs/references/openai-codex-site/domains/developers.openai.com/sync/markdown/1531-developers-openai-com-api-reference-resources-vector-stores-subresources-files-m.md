Delete vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
[Files](/api/reference/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store file
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](/docs/api-reference/files/delete) endpoint.
##### Path ParametersExpand Collapse
vector\_store\_id: string
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id > (schema)>)
file\_id: string
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
VectorStoreFileDeleted object { id, deleted, object }
id: string
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: "vector\_store.file.deleted"
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
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
`curl https://api.openai.com/v1/vector\_stores/vs\_abc123/files/file-abc123 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-X DELETE
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