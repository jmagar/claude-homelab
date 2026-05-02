Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Files](/api/reference/go/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
client.Files.Content(ctx, fileID) (\*Response, error)
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### ParametersExpand Collapse
fileID string
[](<#(resource) files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type FileContentResponse interface{…}
[](<#(resource) files > (method) content > (network schema)>)
### Retrieve file content
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
response, err := client.Files.Content(context.TODO(), "file\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", response)
}
`
```
##### Returns Examples