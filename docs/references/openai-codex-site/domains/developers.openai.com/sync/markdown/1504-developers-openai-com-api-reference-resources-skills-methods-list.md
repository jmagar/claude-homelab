List all skills for the current project. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all skills for the current project.
GET/skills
List all skills for the current project.
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last item from the previous pagination request
[](<#(resource) skills > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of items to retrieve
minimum0
maximum100
[](<#(resource) skills > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
One of the following:
"asc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
SkillList object { data, first\_id, has\_more, 2 more }
data: array of [Skill](</api/reference/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more }
A list of items
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
[](<#(resource) skills > (model) skill_list > (schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) skills > (model) skill_list > (schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) skills > (model) skill_list > (schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) skills > (model) skill_list > (schema) > (property) object>)
[](<#(resource) skills > (model) skill_list > (schema)>)
### List all skills for the current project.
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
`curl https://api.openai.com/v1/skills \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
```
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
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
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```