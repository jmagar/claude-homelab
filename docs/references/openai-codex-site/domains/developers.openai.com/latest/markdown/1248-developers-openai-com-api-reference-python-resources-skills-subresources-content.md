Download a skill zip bundle by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
[Content](/api/reference/python/resources/skills/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill zip bundle by its ID.
skills.content.retrieve(strskill\_id) -\> BinaryResponseContent
GET/skills/{skill\_id}/content
Download a skill zip bundle by its ID.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
BinaryResponseContent
[](<#(resource) skills.content > (method) retrieve > (network schema)>)
### Download a skill zip bundle by its ID.
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
content = client.skills.content.retrieve(
"skill\_123",
)
print(content)
data = content.read()
print(data)`
```
##### Returns Examples