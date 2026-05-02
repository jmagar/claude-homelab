Create a new immutable skill version. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
[Versions](/api/reference/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new immutable skill version.
POST/skills/{skill\_id}/versions
Create a new immutable skill version.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills.versions > (method) create > (params) default > (param) skill_id > (schema)>)
##### Body ParametersJSONExpand Collapse
files: array of string or string
Skill files to upload (directory upload) or a single zip file.
One of the following:
array of string
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills.versions > (method) create > (params) 0 > (param) files > (schema) > (variant) 0>)
string
Skill zip file to upload.
[](<#(resource) skills.versions > (method) create > (params) 0 > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills.versions > (method) create > (params) 0 > (param) files > (schema)>)
default: optional boolean
Whether to set this version as the default.
[](<#(resource) skills.versions > (method) create > (params) 0 > (param) default > (schema)>)
##### ReturnsExpand Collapse
SkillVersion object { id, created\_at, description, 4 more }
id: string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: "skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
### Create a new immutable skill version.
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
`curl https://api.openai.com/v1/skills/$SKILL\_ID/versions \\
-H 'Content-Type: application/json' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F files='["Example data"]'`
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