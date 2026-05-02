Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Files](/api/reference/go/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
client.Files.Delete(ctx, fileID) (\*[FileDeleted](</api/reference/go/resources/files#(resource) files > (model) file_deleted > (schema)>), error)
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### ParametersExpand Collapse
fileID string
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type FileDeleted struct{…}
ID string
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
Object File
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
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
fileDeleted, err := client.Files.Delete(context.TODO(), "file\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", fileDeleted.ID)
}
`
```
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```