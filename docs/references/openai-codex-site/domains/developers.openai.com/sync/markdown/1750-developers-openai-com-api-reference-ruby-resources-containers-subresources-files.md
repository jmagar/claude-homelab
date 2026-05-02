List container files | OpenAI API Reference
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
# List container files
containers.files.list(container\_id, \*\*kwargs) -\> CursorPage\<[FileListResponse](</api/reference/ruby/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>) { id, bytes, container\_id, 4 more } \>
GET/containers/{container\_id}/files
List Container files
##### ParametersExpand Collapse
container\_id: String
[](<#(resource) containers.files > (method) list > (params) default > (param) container_id > (schema)>)
after: String
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers.files > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers.files > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
One of the following:
:asc
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class FileListResponse { id, bytes, container\_id, 4 more }
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: Integer
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: Integer
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: :"container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
### List container files
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
page = openai.containers.files.list("container\_id")
puts(page)`
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