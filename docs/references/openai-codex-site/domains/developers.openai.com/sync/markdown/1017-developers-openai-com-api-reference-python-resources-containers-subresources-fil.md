Create container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Containers](/api/reference/python/resources/containers)
[Files](/api/reference/python/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create container file
containers.files.create(strcontainer\_id, FileCreateParams\*\*kwargs) -\> [FileCreateResponse](</api/reference/python/resources/containers#(resource) containers.files > (model) file_create_response > (schema)>)
POST/containers/{container\_id}/files
Create a Container File
You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.
##### ParametersExpand Collapse
container\_id: str
[](<#(resource) containers.files > (method) create > (params) default > (param) container_id > (schema)>)
file: Optional[[FileTypes](</api/reference/python/resources/containers/subresources/files/methods/create#(resource) containers.files > (method) create > (params) default > (param) file > (schema)>)]
The File object (not file name) to be uploaded.
[](<#(resource) containers.files > (method) create > (params) default > (param) file > (schema)>)
file\_id: Optional[str]
Name of the file to create.
[](<#(resource) containers.files > (method) create > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileCreateResponse: …
id: str
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) id>)
bytes: int
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) bytes>)
container\_id: str
The container this file belongs to.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) container_id>)
created\_at: int
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) created_at>)
object: Literal["container.file"]
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) object>)
path: str
Path of the file in the container.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) path>)
source: str
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_create_response > (schema)>)
### Create container file
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
file = client.containers.files.create(
container\_id="container\_id",
)
print(file.id)`
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