Delete a skill version. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
[Versions](/api/reference/typescript/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill version.
client.skills.versions.delete(stringversion, VersionDeleteParams { skill\_id } params, RequestOptionsoptions?): [DeletedSkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>) { id, deleted, object, version }
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### ParametersExpand Collapse
version: string
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
params: VersionDeleteParams { skill\_id }
skill\_id: string
The identifier of the skill.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id>)
[](<#(resource) skills.versions > (method) delete > (params) default>)
##### ReturnsExpand Collapse
DeletedSkillVersion { id, deleted, object, version }
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
const deletedSkillVersion = await client.skills.versions.delete('version', {
skill\_id: 'skill\_123',
});
console.log(deletedSkillVersion.id);`
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