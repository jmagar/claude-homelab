Delete a skill version. | OpenAI API Reference
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
# Delete a skill version.
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id > (schema)>)
version: string
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
DeletedSkillVersion object { id, deleted, object, version }
id: string
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
deleted: boolean
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
object: "skill.version.deleted"
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
version: string
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
### Delete a skill version.
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
`curl https://api.openai.com/v1/skills/$SKILL\_ID/versions/$VERSION \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
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