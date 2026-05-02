List all skills for the current project. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all skills for the current project.
skills.list(SkillListParams\*\*kwargs) -\> SyncCursorPage[[Skill](</api/reference/python/resources/skills#(resource) skills > (model) skill > (schema)>)]
GET/skills
List all skills for the current project.
##### ParametersExpand Collapse
after: Optional[str]
Identifier for the last item from the previous pagination request
[](<#(resource) skills > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
Number of items to retrieve
minimum0
maximum100
[](<#(resource) skills > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
One of the following:
"asc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema)>)
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
### List all skills for the current project.
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
page = client.skills.list()
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
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
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
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```