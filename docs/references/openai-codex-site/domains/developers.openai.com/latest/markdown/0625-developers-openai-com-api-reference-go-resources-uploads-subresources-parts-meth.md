Add upload part | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Uploads](/api/reference/go/resources/uploads)
[Parts](/api/reference/go/resources/uploads/subresources/parts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add upload part
client.Uploads.Parts.New(ctx, uploadID, body) (\*[UploadPart](</api/reference/go/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>), error)
POST/uploads/{upload\_id}/parts
Adds a [Part](https://platform.openai.com/docs/api-reference/uploads/part-object) to an [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object. A Part represents a chunk of bytes from the file you are trying to upload.
Each Part can be at most 64 MB, and you can add Parts until you hit the Upload maximum of 8 GB.
It is possible to add multiple Parts in parallel. You can decide the intended order of the Parts when you [complete the Upload](https://platform.openai.com/docs/api-reference/uploads/complete).
##### ParametersExpand Collapse
uploadID string
[](<#(resource) uploads.parts > (method) create > (params) default > (param) upload_id > (schema)>)
body UploadPartNewParams
Data param.Field[[Reader](</api/reference/go/resources/uploads/subresources/parts/methods/create#(resource) uploads.parts > (method) create > (params) default > (param) data > (schema)>)]
The chunk of bytes for this Part.
[](<#(resource) uploads.parts > (method) create > (params) default > (param) data>)
[](<#(resource) uploads.parts > (method) create > (params) default>)
##### ReturnsExpand Collapse
type UploadPart struct{…}
The upload Part represents a chunk of bytes we can add to an Upload object.
ID string
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
Object UploadPart
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
UploadID string
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)
### Add upload part
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
"bytes"
"context"
"fmt"
"io"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
uploadPart, err := client.Uploads.Parts.New(
context.TODO(),
"upload\_abc123",
openai.UploadPartNewParams{
Data: io.Reader(bytes.NewBuffer([]byte("Example data"))),
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", uploadPart.ID)
}
`
```
```
`{
"id": "part\_def456",
"object": "upload.part",
"created\_at": 1719185911,
"upload\_id": "upload\_abc123"
}
`
```
##### Returns Examples
```
`{
"id": "part\_def456",
"object": "upload.part",
"created\_at": 1719185911,
"upload\_id": "upload\_abc123"
}
`
```