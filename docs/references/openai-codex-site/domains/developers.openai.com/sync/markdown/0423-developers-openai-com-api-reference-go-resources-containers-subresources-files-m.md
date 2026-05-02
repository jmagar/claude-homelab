Create container file | OpenAI API Reference
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
# Create container file
client.Containers.Files.New(ctx, containerID, body) (\*[ContainerFileNewResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileNewResponse > (schema)>), error)
POST/containers/{container\_id}/files
Create a Container File
You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers.files > (method) create > (params) default > (param) container_id > (schema)>)
body ContainerFileNewParams
File param.Field[[Reader](</api/reference/go/resources/containers/subresources/files/methods/create#(resource) containers.files > (method) create > (params) default > (param) file > (schema)>)]Optional
The File object (not file name) to be uploaded.
[](<#(resource) containers.files > (method) create > (params) default > (param) file>)
FileID param.Field[string]Optional
Name of the file to create.
[](<#(resource) containers.files > (method) create > (params) default > (param) file_id>)
[](<#(resource) containers.files > (method) create > (params) default>)
##### ReturnsExpand Collapse
type ContainerFileNewResponse struct{…}
ID string
Unique identifier for the file.
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) id>)
Bytes int64
Size of the file in bytes.
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) bytes>)
ContainerID string
The container this file belongs to.
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) container_id>)
CreatedAt int64
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) created_at>)
Object ContainerFile
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) object>)
Path string
Path of the file in the container.
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) path>)
Source string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) ContainerFileNewResponse > (schema)>)
### Create container file
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
file, err := client.Containers.Files.New(
context.TODO(),
"container\_id",
openai.ContainerFileNewParams{
},
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