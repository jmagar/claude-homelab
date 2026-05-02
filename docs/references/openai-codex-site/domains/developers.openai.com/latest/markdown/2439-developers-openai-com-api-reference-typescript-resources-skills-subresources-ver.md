List skill versions for a skill. | OpenAI API Reference
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
# List skill versions for a skill.
client.skills.versions.list(stringskillID, VersionListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more } \>
GET/skills/{skill\_id}/versions
List skill versions for a skill.
##### ParametersExpand Collapse
skillID: string
[](<#(resource) skills.versions > (method) list > (params) default > (param) skill_id > (schema)>)
query: VersionListParams { after, limit, order }
after?: string
The skill version ID to start after.
[](<#(resource) skills.versions > (method) list > (params) default > (param) after>)
limit?: number
Number of versions to retrieve.
minimum0
maximum100
[](<#(resource) skills.versions > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Sort order of results by version number.
One of the following:
"asc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills.versions > (method) list > (params) default > (param) order>)
[](<#(resource) skills.versions > (method) list > (params) default>)
##### ReturnsExpand Collapse
SkillVersion { id, created\_at, description, 4 more }
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
### List skill versions for a skill.
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
// Automatically fetches more pages as needed.
for await (const skillVersion of client.skills.versions.list('skill\_123')) {
console.log(skillVersion.id);
}`
```
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```
##### Returns Examples
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```