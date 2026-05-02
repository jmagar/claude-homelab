Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Files](/api/reference/python/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
files.delete(strfile\_id) -\> [FileDeleted](</api/reference/python/resources/files#(resource) files > (model) file_deleted > (schema)>)
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### ParametersExpand Collapse
file\_id: str
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileDeleted: …
id: str
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: Literal["file"]
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
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
client.files.delete("file-abc123")
`
```
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```