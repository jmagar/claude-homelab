Create a new skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new skill.
skills.create(\*\*kwargs) -\> [Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
POST/skills
Create a new skill.
##### ParametersExpand Collapse
files: Array[String] | String
Skill files to upload (directory upload) or a single zip file.
One of the following:
UnionMember0 = Array[String]
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
String = String
Skill zip file to upload.
[](<#(resource) skills > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills > (method) create > (params) default > (param) files > (schema)>)
##### ReturnsExpand Collapse
class Skill { id, created\_at, default\_version, 4 more }
id: String
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: :skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### Create a new skill.
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
skill = openai.skills.create
puts(skill)`
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