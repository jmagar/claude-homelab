Retrieve file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Files](/api/reference/typescript/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file
client.files.retrieve(stringfileID, RequestOptionsoptions?): [FileObject](</api/reference/typescript/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
GET/files/{file\_id}
Returns information about a specific file.
##### ParametersExpand Collapse
fileID: string
[](<#(resource) files > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
FileObject { id, bytes, created\_at, 6 more }
The `File` object represents a document that has been uploaded to OpenAI.
id: string
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
bytes: number
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: number
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
filename: string
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
object: "file"
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
purpose: "assistants" | "assistants\_output" | "batch" | 5 more
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
Deprecatedstatus: "uploaded" | "processed" | "error"
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
"uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
"processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
"error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at?: number
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details?: string
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### Retrieve file
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const file = await openai.files.retrieve("file-abc123");
console.log(file);
}
main();`
```
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```