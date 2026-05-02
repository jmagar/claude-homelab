Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Containers](/api/reference/ruby/resources/containers)
[Files](/api/reference/ruby/resources/containers/subresources/files)
[Content](/api/reference/ruby/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
containers.files.content.retrieve(file\_id, \*\*kwargs) -\> StringIO
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### ParametersExpand Collapse
container\_id: String
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id > (schema)>)
file\_id: String
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
StringIO
[](<#(resource) containers.files.content > (method) retrieve > (network schema)>)
### Retrieve container file content
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
content = openai.containers.files.content.retrieve("file\_id", container\_id: "container\_id")
puts(content)`
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