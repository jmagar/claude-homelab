Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Files](/api/reference/python/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
Deprecated: The `.content()` method should be used instead
files.retrieve\_content(strfile\_id) -\> [FileContent](</api/reference/python/resources/files#(resource) files > (model) file_content > (schema)>)
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### ParametersExpand Collapse
file\_id: str
[](<#(resource) files > (method) retrieve_content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
str
[](<#(resource) files > (method) retrieve_content > (network schema)>)
### Retrieve file content
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
`from openai import OpenAI
client = OpenAI()
content = client.files.content("file-abc123")
`
```
200 example
```
`"string"`
```
##### Returns Examples
200 example
```
`"string"`
```