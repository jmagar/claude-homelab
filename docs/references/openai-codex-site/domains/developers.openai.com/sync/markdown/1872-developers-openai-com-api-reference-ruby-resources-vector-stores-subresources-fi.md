Delete vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
[Files](/api/reference/ruby/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store file
vector\_stores.files.delete(file\_id, \*\*kwargs) -\> [VectorStoreFileDeleted](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) { id, deleted, object }
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
##### ParametersExpand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id > (schema)>)
file\_id: String
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class VectorStoreFileDeleted { id, deleted, object }
id: String
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
object: :"vector\_store.file.deleted"
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
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
vector\_store\_file\_deleted = openai.vector\_stores.files.delete("file\_id", vector\_store\_id: "vector\_store\_id")
puts(vector\_store\_file\_deleted)`
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