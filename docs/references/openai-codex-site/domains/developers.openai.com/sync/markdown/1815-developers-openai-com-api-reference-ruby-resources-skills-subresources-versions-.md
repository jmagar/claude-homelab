Create a new immutable skill version. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
[Versions](/api/reference/ruby/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new immutable skill version.
skills.versions.create(skill\_id, \*\*kwargs) -\> [SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
POST/skills/{skill\_id}/versions
Create a new immutable skill version.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills.versions > (method) create > (params) default > (param) skill_id > (schema)>)
default: bool
Whether to set this version as the default.
[](<#(resource) skills.versions > (method) create > (params) default > (param) default > (schema)>)
files: Array[String] | String
Skill files to upload (directory upload) or a single zip file.
One of the following:
UnionMember0 = Array[String]
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
String = String
Skill zip file to upload.
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema)>)
##### ReturnsExpand Collapse
class SkillVersion { id, created\_at, description, 4 more }
id: String
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
object: :"skill.version"
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
skill\_id: String
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
version: String
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
### Create a new immutable skill version.
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
skill\_version = openai.skills.versions.create("skill\_123")
puts(skill\_version)`
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