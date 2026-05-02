Delete vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Vector Stores](/api/reference/python/resources/vector_stores)
[Files](/api/reference/python/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store file
vector\_stores.files.delete(strfile\_id, FileDeleteParams\*\*kwargs) -\> [VectorStoreFileDeleted](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
##### ParametersExpand Collapse
vector\_store\_id: str
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id > (schema)>)
file\_id: str
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreFileDeleted: …
id: str
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: Literal["vector\_store.file.deleted"]
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
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
deleted\_vector\_store\_file = client.vector\_stores.files.delete(
vector\_store\_id="vs\_abc123",
file\_id="file-abc123"
)
print(deleted\_vector\_store\_file)
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