Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Containers](/api/reference/python/resources/containers)
[Files](/api/reference/python/resources/containers/subresources/files)
[Content](/api/reference/python/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
containers.files.content.retrieve(strfile\_id, ContentRetrieveParams\*\*kwargs) -\> BinaryResponseContent
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### ParametersExpand Collapse
container\_id: str
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id > (schema)>)
file\_id: str
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
BinaryResponseContent
[](<#(resource) containers.files.content > (method) retrieve > (network schema)>)
### Retrieve container file content
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
content = client.containers.files.content.retrieve(
file\_id="file\_id",
container\_id="container\_id",
)
print(content)
data = content.read()
print(data)`
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