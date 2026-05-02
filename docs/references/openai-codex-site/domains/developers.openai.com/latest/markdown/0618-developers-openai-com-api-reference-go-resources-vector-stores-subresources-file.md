Delete vector store file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Vector Stores](/api/reference/go/resources/vector_stores)
[Files](/api/reference/go/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store file
client.VectorStores.Files.Delete(ctx, vectorStoreID, fileID) (\*[VectorStoreFileDeleted](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>), error)
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id > (schema)>)
fileID string
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type VectorStoreFileDeleted struct{…}
ID string
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
Object VectorStoreFileDeleted
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
vectorStoreFileDeleted, err := client.VectorStores.Files.Delete(
context.TODO(),
"vector\_store\_id",
"file\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", vectorStoreFileDeleted.ID)
}
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