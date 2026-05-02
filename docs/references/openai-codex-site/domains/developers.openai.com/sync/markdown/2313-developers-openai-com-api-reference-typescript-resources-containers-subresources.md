Retrieve container file | OpenAI API Reference
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
# Retrieve container file
client.containers.files.retrieve(stringfileID, FileRetrieveParams { container\_id } params, RequestOptionsoptions?): [FileRetrieveResponse](</api/reference/typescript/resources/containers#(resource) containers.files > (model) file_retrieve_response > (schema)>) { id, bytes, container\_id, 4 more }
GET/containers/{container\_id}/files/{file\_id}
Retrieve Container File
##### ParametersExpand Collapse
fileID: string
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) file_id > (schema)>)
params: FileRetrieveParams { container\_id }
container\_id: string
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) container_id>)
[](<#(resource) containers.files > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
FileRetrieveResponse { id, bytes, container\_id, 4 more }
id: string
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) id>)
bytes: number
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) bytes>)
container\_id: string
The container this file belongs to.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) container_id>)
created\_at: number
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) created_at>)
object: "container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_retrieve_response > (schema)>)
### Retrieve container file
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
const file = await client.containers.files.retrieve('file\_id', { container\_id: 'container\_id' });
console.log(file.id);`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```