Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Files](/api/reference/typescript/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
client.files.delete(stringfileID, RequestOptionsoptions?): [FileDeleted](</api/reference/typescript/resources/files#(resource) files > (model) file_deleted > (schema)>) { id, deleted, object }
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### ParametersExpand Collapse
fileID: string
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
FileDeleted { id, deleted, object }
id: string
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: "file"
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
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
const file = await openai.files.delete("file-abc123");
console.log(file);
}
main();`
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