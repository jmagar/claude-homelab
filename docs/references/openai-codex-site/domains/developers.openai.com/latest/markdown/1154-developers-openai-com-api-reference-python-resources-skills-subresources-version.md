List skill versions for a skill. | OpenAI API Reference
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
# List skill versions for a skill.
skills.versions.list(strskill\_id, VersionListParams\*\*kwargs) -\> SyncCursorPage[[SkillVersion](</api/reference/python/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)]
GET/skills/{skill\_id}/versions
List skill versions for a skill.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills.versions > (method) list > (params) default > (param) skill_id > (schema)>)
after: Optional[str]
The skill version ID to start after.
[](<#(resource) skills.versions > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
Number of versions to retrieve.
minimum0
maximum100
[](<#(resource) skills.versions > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order of results by version number.
One of the following:
"asc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>)
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
### List skill versions for a skill.
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
page = client.skills.versions.list(
skill\_id="skill\_123",
)
page = page.data[0]
print(page.id)`
```
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```
##### Returns Examples
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```