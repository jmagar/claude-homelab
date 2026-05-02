List container files | OpenAI API Reference
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
# List container files
client.Containers.Files.List(ctx, containerID, query) (\*CursorPage[[ContainerFileListResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileListResponse > (schema)>)], error)
GET/containers/{container\_id}/files
List Container files
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers.files > (method) list > (params) default > (param) container_id > (schema)>)
query ContainerFileListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers.files > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers.files > (method) list > (params) default > (param) limit>)
Order param.Field[[ContainerFileListParamsOrder](</api/reference/go/resources/containers/subresources/files/methods/list#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
const ContainerFileListParamsOrderAsc [ContainerFileListParamsOrder](</api/reference/go/resources/containers/subresources/files/methods/list#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const ContainerFileListParamsOrderDesc [ContainerFileListParamsOrder](</api/reference/go/resources/containers/subresources/files/methods/list#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers.files > (method) list > (params) default > (param) order>)
[](<#(resource) containers.files > (method) list > (params) default>)
##### ReturnsExpand Collapse
type ContainerFileListResponse struct{…}
ID string
Unique identifier for the file.
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) id>)
Bytes int64
Size of the file in bytes.
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) bytes>)
ContainerID string
The container this file belongs to.
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) container_id>)
CreatedAt int64
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) created_at>)
Object ContainerFile
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) object>)
Path string
Path of the file in the container.
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) path>)
Source string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) ContainerFileListResponse > (schema)>)
### List container files
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
page, err := client.Containers.Files.List(
context.TODO(),
"container\_id",
openai.ContainerFileListParams{
},
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
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```