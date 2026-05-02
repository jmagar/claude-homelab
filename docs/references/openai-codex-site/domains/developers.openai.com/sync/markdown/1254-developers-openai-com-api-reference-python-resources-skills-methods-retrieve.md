Get a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get a skill by its ID.
skills.retrieve(strskill\_id) -\> [Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)
GET/skills/{skill\_id}
Get a skill by its ID.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
class Skill: …
id: str
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: str
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: str
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: str
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: str
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: Literal["skill"]
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### Get a skill by its ID.
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
skill = client.skills.retrieve(
"skill\_123",
)
print(skill.id)`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```