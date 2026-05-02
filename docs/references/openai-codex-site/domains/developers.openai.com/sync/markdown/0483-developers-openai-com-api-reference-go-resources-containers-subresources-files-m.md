Delete a container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
[Files](/api/reference/go/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container file
client.Containers.Files.Delete(ctx, containerID, fileID) error
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id > (schema)>)
fileID string
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
### Delete a container file
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
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
err := client.Containers.Files.Delete(
context.TODO(),
"container\_id",
"file\_id",
)
if err != nil {
panic(err.Error())
}
}
`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```