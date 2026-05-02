Create a new immutable skill version. | OpenAI API Reference
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
# Create a new immutable skill version.
skills.versions.create(strskill\_id, VersionCreateParams\*\*kwargs) -\> [SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)
POST/skills/{skill\_id}/versions
Create a new immutable skill version.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.versions > (method) create > (params) default > (param) skill_id > (schema)>)
default: Optional[[bool](</api/reference/python/resources/skills/subresources/versions/methods/create#(resource) skills.versions > (method) create > (params) default > (param) default > (schema)>)]
Whether to set this version as the default.
[](<#(resource) skills.versions > (method) create > (params) default > (param) default > (schema)>)
files: Optional[Union[Sequence[FileTypes], FileTypes]]
Skill files to upload (directory upload) or a single zip file.
One of the following:
Sequence[FileTypes]
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
FileTypes
Skill zip file to upload.
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema)>)
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
### Create a new immutable skill version.
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
skill\_version = client.skills.versions.create(
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