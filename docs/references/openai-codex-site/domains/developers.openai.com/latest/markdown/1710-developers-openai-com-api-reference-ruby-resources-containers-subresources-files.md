Delete a container file | OpenAI API Reference
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
# Delete a container file
containers.files.delete(file\_id, \*\*kwargs) -\> void
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### ParametersExpand Collapse
container\_id: String
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id > (schema)>)
file\_id: String
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
### Delete a container file
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
result = openai.containers.files.delete("file\_id", container\_id: "container\_id")
puts(result)`
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