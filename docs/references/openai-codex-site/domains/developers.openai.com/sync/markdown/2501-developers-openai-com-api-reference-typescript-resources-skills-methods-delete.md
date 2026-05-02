Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
client.skills.delete(stringskillID, RequestOptionsoptions?): [DeletedSkill](</api/reference/typescript/resources/skills#(resource) skills > (model) deleted_skill > (schema)>) { id, deleted, object }
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### ParametersExpand Collapse
skillID: string
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
DeletedSkill { id, deleted, object }
id: string
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
deleted: boolean
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
object: "skill.deleted"
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
const deletedSkill = await client.skills.delete('skill\_123');
console.log(deletedSkill.id);`
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