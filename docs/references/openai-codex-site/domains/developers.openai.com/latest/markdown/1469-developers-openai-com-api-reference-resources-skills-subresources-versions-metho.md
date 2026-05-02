List skill versions for a skill. | OpenAI API Reference
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
# List skill versions for a skill.
GET/skills/{skill\_id}/versions
List skill versions for a skill.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills.versions > (method) list > (params) default > (param) skill_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
The skill version ID to start after.
[](<#(resource) skills.versions > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of versions to retrieve.
minimum0
maximum100
[](<#(resource) skills.versions > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order of results by version number.
One of the following:
"asc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
SkillVersionList object { data, first\_id, has\_more, 2 more }
data: array of [SkillVersion](</api/reference/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>) { id, created\_at, description, 4 more }
A list of items
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
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) skills.versions > (model) skill_version_list > (schema) > (property) object>)
[](<#(resource) skills.versions > (model) skill_version_list > (schema)>)
### List skill versions for a skill.
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
`curl https://api.openai.com/v1/skills/$SKILL\_ID/versions \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
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