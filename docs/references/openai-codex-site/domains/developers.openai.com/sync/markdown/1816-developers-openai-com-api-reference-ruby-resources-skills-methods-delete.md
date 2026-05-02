Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
skills.delete(skill\_id) -\> [DeletedSkill](</api/reference/ruby/resources/skills#(resource) skills > (model) deleted_skill > (schema)>) { id, deleted, object }
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
class DeletedSkill { id, deleted, object }
id: String
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: :"skill.deleted"
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
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
deleted\_skill = openai.skills.delete("skill\_123")
puts(deleted\_skill)`
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