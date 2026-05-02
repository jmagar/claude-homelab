Create a new immutable skill version. | OpenAI API Reference
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
# Create a new immutable skill version.
client.skills.versions.create(stringskillID, VersionCreateParams { \_default, files } body?, RequestOptionsoptions?): [SkillVersion](</api/reference/typescript/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
POST/skills/{skill\_id}/versions
Create a new immutable skill version.
##### ParametersExpand Collapse
skillID: string
[](<#(resource) skills.versions > (method) create > (params) default > (param) skill_id > (schema)>)
body: VersionCreateParams { \_default, files }
\_default?: boolean
Whether to set this version as the default.
[](<#(resource) skills.versions > (method) create > (params) default > (param) default>)
files?: Array\<Uploadable\> | Uploadable
Skill files to upload (directory upload) or a single zip file.
One of the following:
Array\<Uploadable\>
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
Uploadable
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills.versions > (method) create > (params) default > (param) files>)
[](<#(resource) skills.versions > (method) create > (params) default>)
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
### Create a new immutable skill version.
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
const skillVersion = await client.skills.versions.create('skill\_123');
console.log(skillVersion.id);`
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