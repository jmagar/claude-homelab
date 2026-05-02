Delete a skill version. | OpenAI API Reference
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
# Delete a skill version.
skills.versions.delete(strversion, VersionDeleteParams\*\*kwargs) -\> [DeletedSkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id > (schema)>)
version: str
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
class DeletedSkillVersion: …
id: str
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: Literal["skill.version.deleted"]
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: str
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
### Delete a skill version.
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
deleted\_skill\_version = client.skills.versions.delete(
version="version",
skill\_id="skill\_123",
)
print(deleted\_skill\_version.id)`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```