Create a new skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new skill.
POST/skills
Create a new skill.
##### Body ParametersJSONExpand Collapse
files: array of string or string
Skill files to upload (directory upload) or a single zip file.
One of the following:
array of string
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills > (method) create > (params) 0 > (param) files > (schema) > (variant) 0>)
string
Skill zip file to upload.
[](<#(resource) skills > (method) create > (params) 0 > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills > (method) create > (params) 0 > (param) files > (schema)>)
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
### Create a new skill.
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
`curl https://api.openai.com/v1/skills \\
-H 'Content-Type: application/json' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F files='["Example data"]'`
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