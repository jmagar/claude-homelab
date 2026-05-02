Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
[Versions](/api/reference/python/resources/skills/subresources/versions)
[Content](/api/reference/python/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
skills.versions.content.retrieve(strversion, ContentRetrieveParams\*\*kwargs) -\> BinaryResponseContent
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version: str
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
BinaryResponseContent
[](<#(resource) skills.versions.content > (method) retrieve > (network schema)>)
### Download a skill version zip bundle.
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
content = client.skills.versions.content.retrieve(
version="version",
skill\_id="skill\_123",
)
print(content)
data = content.read()
print(data)`
```
##### Returns Examples