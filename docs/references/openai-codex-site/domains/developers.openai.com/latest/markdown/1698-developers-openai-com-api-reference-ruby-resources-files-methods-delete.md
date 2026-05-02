Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Files](/api/reference/ruby/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
files.delete(file\_id) -\> [FileDeleted](</api/reference/ruby/resources/files#(resource) files > (model) file_deleted > (schema)>) { id, deleted, object }
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### ParametersExpand Collapse
file\_id: String
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileDeleted { id, deleted, object }
id: String
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: :file
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
file\_deleted = openai.files.delete("file\_id")
puts(file\_deleted)`
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