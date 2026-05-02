Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Files](/api/reference/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### Path ParametersExpand Collapse
file\_id: string
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
FileDeleted object { id, deleted, object }
id: string
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: "file"
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
HTTP
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
`curl https://api.openai.com/v1/files/file-abc123 \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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