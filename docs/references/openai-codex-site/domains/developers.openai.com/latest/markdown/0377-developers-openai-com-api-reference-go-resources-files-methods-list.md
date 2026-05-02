List files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Files](/api/reference/go/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List files
client.Files.List(ctx, query) (\*CursorPage[[FileObject](</api/reference/go/resources/files#(resource) files > (model) file_object > (schema)>)], error)
GET/files
Returns a list of files.
##### ParametersExpand Collapse
query FileListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) files > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 10,000, and the default is 10,000.
[](<#(resource) files > (method) list > (params) default > (param) limit>)
Order param.Field[[FileListParamsOrder](</api/reference/go/resources/files/methods/list#(resource) files > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
const FileListParamsOrderAsc [FileListParamsOrder](</api/reference/go/resources/files/methods/list#(resource) files > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const FileListParamsOrderDesc [FileListParamsOrder](</api/reference/go/resources/files/methods/list#(resource) files > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) files > (method) list > (params) default > (param) order>)
Purpose param.Field[string]Optional
Only return files with the given purpose.
[](<#(resource) files > (method) list > (params) default > (param) purpose>)
[](<#(resource) files > (method) list > (params) default>)
##### ReturnsExpand Collapse
type FileObject struct{…}
The `File` object represents a document that has been uploaded to OpenAI.
ID string
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
Bytes int64
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
CreatedAt int64
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
Filename string
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
Object File
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
Purpose FileObjectPurpose
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
const FileObjectPurposeAssistants FileObjectPurpose = "assistants"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
const FileObjectPurposeAssistantsOutput FileObjectPurpose = "assistants\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
const FileObjectPurposeBatch FileObjectPurpose = "batch"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
const FileObjectPurposeBatchOutput FileObjectPurpose = "batch\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
const FileObjectPurposeFineTune FileObjectPurpose = "fine-tune"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
const FileObjectPurposeFineTuneResults FileObjectPurpose = "fine-tune-results"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
const FileObjectPurposeVision FileObjectPurpose = "vision"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
const FileObjectPurposeUserData FileObjectPurpose = "user\_data"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
DeprecatedStatus FileObjectStatus
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
const FileObjectStatusUploaded FileObjectStatus = "uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
const FileObjectStatusProcessed FileObjectStatus = "processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
const FileObjectStatusError FileObjectStatus = "error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
DeprecatedStatusDetails stringOptional
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### List files
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
page, err := client.Files.List(context.TODO(), openai.FileListParams{
})
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
"id": "file-abc123",
"object": "file",
"bytes": 175,
"created\_at": 1613677385,
"expires\_at": 1677614202,
"filename": "salesOverview.pdf",
"purpose": "assistants",
},
{
"id": "file-abc456",
"object": "file",
"bytes": 140,
"created\_at": 1613779121,
"expires\_at": 1677614202,
"filename": "puppy.jsonl",
"purpose": "fine-tune",
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "file-abc123",
"object": "file",
"bytes": 175,
"created\_at": 1613677385,
"expires\_at": 1677614202,
"filename": "salesOverview.pdf",
"purpose": "assistants",
},
{
"id": "file-abc456",
"object": "file",
"bytes": 140,
"created\_at": 1613779121,
"expires\_at": 1677614202,
"filename": "puppy.jsonl",
"purpose": "fine-tune",
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```