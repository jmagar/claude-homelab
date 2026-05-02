Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
[Files](/api/reference/go/resources/containers/subresources/files)
[Content](/api/reference/go/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
client.Containers.Files.Content.Get(ctx, containerID, fileID) (\*Response, error)
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id > (schema)>)
fileID string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type ContainerFileContentGetResponse interface{…}
[](<#(resource) containers.files.content > (method) retrieve > (network schema)>)
### Retrieve container file content
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
content, err := client.Containers.Files.Content.Get(
context.TODO(),
"container\_id",
"file\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", content)
}
`
```
```
`\<binary content of the file\>
`
```
##### Returns Examples
```
`\<binary content of the file\>
`
```