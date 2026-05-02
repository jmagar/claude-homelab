Get a specific skill version. | OpenAI API Reference
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
# Get a specific skill version.
skills.versions.retrieve(version, \*\*kwargs) -\> [SkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
GET/skills/{skill\_id}/versions/{version}
Get a specific skill version.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version: String
The version number to retrieve.
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) version > (schema)>)
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
### Get a specific skill version.
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
skill\_version = openai.skills.versions.retrieve("version", skill\_id: "skill\_123")
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