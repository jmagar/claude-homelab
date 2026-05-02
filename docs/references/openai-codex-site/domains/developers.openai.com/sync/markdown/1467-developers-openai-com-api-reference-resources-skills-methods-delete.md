Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
DeletedSkill object { id, deleted, object }
id: string
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: boolean
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: "skill.deleted"
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
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
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
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