Get a specific skill version. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
[Versions](/api/reference/python/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get a specific skill version.
skills.versions.retrieve(strversion, VersionRetrieveParams\*\*kwargs) -\> [SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)
GET/skills/{skill\_id}/versions/{version}
Get a specific skill version.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version: str
The version number to retrieve.
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
class SkillVersion: …
id: str
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: int
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: str
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: str
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: Literal["skill.version"]
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: str
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: str
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
### Get a specific skill version.
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
skill\_version = client.skills.versions.retrieve(
version="version",
skill\_id="skill\_123",
)
print(skill\_version.id)`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```