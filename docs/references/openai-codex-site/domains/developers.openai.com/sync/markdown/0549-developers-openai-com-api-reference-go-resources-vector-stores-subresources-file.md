Retrieve vector store file content | OpenAI API Reference
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
# Retrieve vector store file content
client.VectorStores.Files.Content(ctx, vectorStoreID, fileID) (\*Page[[VectorStoreFileContentResponse](</api/reference/go/resources/vector_stores#(resource) vector_stores.files > (model) VectorStoreFileContentResponse > (schema)>)], error)
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### ParametersExpand Collapse
vectorStoreID string
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id > (schema)>)
fileID string
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type VectorStoreFileContentResponse struct{…}
Text stringOptional
The text content
[](<#(resource) vector_stores.files > (model) VectorStoreFileContentResponse > (schema) > (property) text>)
Type stringOptional
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) VectorStoreFileContentResponse > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) VectorStoreFileContentResponse > (schema)>)
### Retrieve vector store file content
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
page, err := client.VectorStores.Files.Content(
context.TODO(),
"vs\_abc123",
"file-abc123",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"file\_id": "file-abc123",
"filename": "example.txt",
"attributes": {"key": "value"},
"content": [
{"type": "text", "text": "..."},
...
]
}
`
```
##### Returns Examples
```
`{
"file\_id": "file-abc123",
"filename": "example.txt",
"attributes": {"key": "value"},
"content": [
{"type": "text", "text": "..."},
...
]
}
`
```