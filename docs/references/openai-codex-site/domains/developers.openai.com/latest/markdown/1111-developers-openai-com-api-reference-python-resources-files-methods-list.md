List files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Files](/api/reference/python/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List files
files.list(FileListParams\*\*kwargs) -\> SyncCursorPage[[FileObject](</api/reference/python/resources/files#(resource) files > (model) file_object > (schema)>)]
GET/files
Returns a list of files.
##### ParametersExpand Collapse
after: Optional[str]
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) files > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
A limit on the number of objects to be returned. Limit can range between 1 and 10,000, and the default is 10,000.
[](<#(resource) files > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) files > (method) list > (params) default > (param) order > (schema)>)
purpose: Optional[str]
Only return files with the given purpose.
[](<#(resource) files > (method) list > (params) default > (param) purpose > (schema)>)
##### ReturnsExpand Collapse
class FileObject: …
The `File` object represents a document that has been uploaded to OpenAI.
id: str
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
bytes: int
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: int
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
filename: str
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
object: Literal["file"]
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
purpose: Literal["assistants", "assistants\_output", "batch", 5 more]
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
"assistants"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
"assistants\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
"batch"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
"batch\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
"fine-tune"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
"fine-tune-results"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
"vision"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
"user\_data"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
Deprecatedstatus: Literal["uploaded", "processed", "error"]
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
"uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
"processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
"error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details: Optional[str]
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### List files
Python
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
`from openai import OpenAI
client = OpenAI()
client.files.list()
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