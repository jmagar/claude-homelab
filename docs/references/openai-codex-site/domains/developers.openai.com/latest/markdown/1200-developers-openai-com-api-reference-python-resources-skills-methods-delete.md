Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Skills](/api/reference/python/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
skills.delete(strskill\_id) -\> [DeletedSkill](</api/reference/python/resources/skills#(resource) skills > (model) deleted_skill > (schema)>)
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### ParametersExpand Collapse
skill\_id: str
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
class DeletedSkill: …
id: str
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: Literal["skill.deleted"]
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
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
deleted\_skill = client.skills.delete(
"skill\_123",
)
print(deleted\_skill.id)`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```