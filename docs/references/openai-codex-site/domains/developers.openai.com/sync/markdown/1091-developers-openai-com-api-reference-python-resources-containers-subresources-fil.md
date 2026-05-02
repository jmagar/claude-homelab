List container files | OpenAI API Reference
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
# List container files
containers.files.list(strcontainer\_id, FileListParams\*\*kwargs) -\> SyncCursorPage[[FileListResponse](</api/reference/python/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>)]
GET/containers/{container\_id}/files
List Container files
##### ParametersExpand Collapse
container\_id: str
[](<#(resource) containers.files > (method) list > (params) default > (param) container_id > (schema)>)
after: Optional[str]
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers.files > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers.files > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
"asc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class FileListResponse: …
id: str
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: int
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: str
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: int
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: Literal["container.file"]
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: str
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: str
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
### List container files
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
page = client.containers.files.list(
container\_id="container\_id",
)
page = page.data[0]
print(page.id)`
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