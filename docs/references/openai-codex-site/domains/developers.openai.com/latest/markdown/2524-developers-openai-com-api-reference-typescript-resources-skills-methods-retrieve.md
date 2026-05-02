Get a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get a skill by its ID.
client.skills.retrieve(stringskillID, RequestOptionsoptions?): [Skill](</api/reference/typescript/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
GET/skills/{skill\_id}
Get a skill by its ID.
##### ParametersExpand Collapse
skillID: string
[](<#(resource) skills > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
Skill { id, created\_at, default\_version, 4 more }
id: string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: number
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: "skill"
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### Get a skill by its ID.
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
const skill = await client.skills.retrieve('skill\_123');
console.log(skill.id);`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```