Retrieve container file | OpenAI API Reference
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
# Retrieve container file
client.Containers.Files.Get(ctx, containerID, fileID) (\*[ContainerFileGetResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileGetResponse > (schema)>), error)
GET/containers/{container\_id}/files/{file\_id}
Retrieve Container File
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) container_id > (schema)>)
fileID string
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
type ContainerFileGetResponse struct{…}
ID string
Unique identifier for the file.
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) id>)
Bytes int64
Size of the file in bytes.
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) bytes>)
ContainerID string
The container this file belongs to.
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) container_id>)
CreatedAt int64
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) created_at>)
Object ContainerFile
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) object>)
Path string
Path of the file in the container.
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) path>)
Source string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) ContainerFileGetResponse > (schema)>)
### Retrieve container file
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
file, err := client.Containers.Files.Get(
context.TODO(),
"container\_id",
"file\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", file.ID)
}
`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```