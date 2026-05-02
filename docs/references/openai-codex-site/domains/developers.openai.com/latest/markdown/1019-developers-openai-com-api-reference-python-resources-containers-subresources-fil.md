Delete a container file | OpenAI API Reference
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
# Delete a container file
containers.files.delete(strfile\_id, FileDeleteParams\*\*kwargs)
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### ParametersExpand Collapse
container\_id: str
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id > (schema)>)
file\_id: str
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
### Delete a container file
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
client.containers.files.delete(
file\_id="file\_id",
container\_id="container\_id",
)`
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