Delete a container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Containers](/api/reference/typescript/resources/containers)
[Files](/api/reference/typescript/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container file
client.containers.files.delete(stringfileID, FileDeleteParams { container\_id } params, RequestOptionsoptions?): void
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### ParametersExpand Collapse
fileID: string
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
params: FileDeleteParams { container\_id }
container\_id: string
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id>)
[](<#(resource) containers.files > (method) delete > (params) default>)
### Delete a container file
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
await client.containers.files.delete('file\_id', { container\_id: 'container\_id' });`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```