Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Containers](/api/reference/resources/containers)
[Files](/api/reference/resources/containers/subresources/files)
[Content](/api/reference/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### Path ParametersExpand Collapse
container\_id: string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id > (schema)>)
file\_id: string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
### Retrieve container file content
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
`curl https://api.openai.com/v1/containers/container\_123/files/cfile\_456/content \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
```
`\<binary content of the file\>
`
```
##### Returns Examples
```
`\<binary content of the file\>
`
```