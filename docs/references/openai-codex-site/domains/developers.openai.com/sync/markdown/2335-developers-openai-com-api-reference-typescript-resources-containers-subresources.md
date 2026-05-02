List container files | OpenAI API Reference
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
# List container files
client.containers.files.list(stringcontainerID, FileListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[FileListResponse](</api/reference/typescript/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>) { id, bytes, container\_id, 4 more } \>
GET/containers/{container\_id}/files
List Container files
##### ParametersExpand Collapse
containerID: string
[](<#(resource) containers.files > (method) list > (params) default > (param) container_id > (schema)>)
query: FileListParams { after, limit, order }
after?: string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers.files > (method) list > (params) default > (param) after>)
limit?: number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers.files > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers.files > (method) list > (params) default > (param) order>)
[](<#(resource) containers.files > (method) list > (params) default>)
##### ReturnsExpand Collapse
FileListResponse { id, bytes, container\_id, 4 more }
id: string
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: number
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: string
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: number
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: "container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
### List container files
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
// Automatically fetches more pages as needed.
for await (const fileListResponse of client.containers.files.list('container\_id')) {
console.log(fileListResponse.id);
}`
```
```
`{
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```