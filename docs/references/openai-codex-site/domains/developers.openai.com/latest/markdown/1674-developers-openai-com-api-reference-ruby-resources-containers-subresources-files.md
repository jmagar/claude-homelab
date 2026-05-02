Retrieve container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Containers](/api/reference/ruby/resources/containers)
[Files](/api/reference/ruby/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file
containers.files.retrieve(file\_id, \*\*kwargs) -\> [FileRetrieveResponse](</api/reference/ruby/resources/containers#(resource) containers.files > (model) file_retrieve_response > (schema)>) { id, bytes, container\_id, 4 more }
GET/containers/{container\_id}/files/{file\_id}
Retrieve Container File
##### ParametersExpand Collapse
container\_id: String
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) container_id > (schema)>)
file\_id: String
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileRetrieveResponse { id, bytes, container\_id, 4 more }
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) id>)
bytes: Integer
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) container_id>)
created\_at: Integer
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) created_at>)
object: :"container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_retrieve_response > (schema)>)
### Retrieve container file
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
file = openai.containers.files.retrieve("file\_id", container\_id: "container\_id")
puts(file)`
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