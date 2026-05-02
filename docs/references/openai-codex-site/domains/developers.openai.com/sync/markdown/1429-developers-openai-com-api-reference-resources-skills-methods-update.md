Update the default version pointer for a skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update the default version pointer for a skill.
POST/skills/{skill\_id}
Update the default version pointer for a skill.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills > (method) update > (params) default > (param) skill_id > (schema)>)
##### Body ParametersJSONExpand Collapse
default\_version: string
The skill version number to set as default.
[](<#(resource) skills > (method) update > (params) 0 > (param) default_version > (schema)>)
##### ReturnsExpand Collapse
Skill object { id, created\_at, default\_version, 4 more }
id: string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: "skill"
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### Update the default version pointer for a skill.
HTTP
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
`curl https://api.openai.com/v1/skills/$SKILL\_ID \\
-H 'Content-Type: application/json' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"default\_version": "default\_version"
}'`
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