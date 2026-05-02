Delete a skill version. | OpenAI API Reference
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
# Delete a skill version.
skills.versions.delete(version, \*\*kwargs) -\> [DeletedSkillVersion](</api/reference/ruby/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) { id, deleted, object, version }
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id > (schema)>)
version: String
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
class DeletedSkillVersion { id, deleted, object, version }
id: String
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: :"skill.version.deleted"
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: String
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
### Delete a skill version.
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
deleted\_skill\_version = openai.skills.versions.delete("version", skill\_id: "skill\_123")
puts(deleted\_skill\_version)`
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