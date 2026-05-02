Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Files](/api/reference/ruby/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
files.content(file\_id) -\> StringIO
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### ParametersExpand Collapse
file\_id: String
[](<#(resource) files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
StringIO
[](<#(resource) files > (method) content > (network schema)>)
### Retrieve file content
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
response = openai.files.content("file\_id")
puts(response)`
```
##### Returns Examples