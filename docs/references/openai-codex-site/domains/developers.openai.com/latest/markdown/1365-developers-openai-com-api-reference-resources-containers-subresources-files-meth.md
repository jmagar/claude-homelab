Delete a container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Containers](/api/reference/resources/containers)
[Files](/api/reference/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container file
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### Path ParametersExpand Collapse
container\_id: string
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id > (schema)>)
file\_id: string
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
### Delete a container file
HTTP
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
`curl -X DELETE https://api.openai.com/v1/containers/cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863/files/cfile\_682e0e8a43c88191a7978f477a09bdf5 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
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