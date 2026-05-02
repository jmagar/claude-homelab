List all skills for the current project. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all skills for the current project.
skills.list(\*\*kwargs) -\> CursorPage\<[Skill](</api/reference/ruby/resources/skills#(resource) skills > (model) skill > (schema)>) { id, created\_at, default\_version, 4 more } \>
GET/skills
List all skills for the current project.
##### ParametersExpand Collapse
after: String
Identifier for the last item from the previous pagination request
[](<#(resource) skills > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
Number of items to retrieve
minimum0
maximum100
[](<#(resource) skills > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
One of the following:
:asc
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class Skill { id, created\_at, default\_version, 4 more }
id: String
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
object: :skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### List all skills for the current project.
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
page = openai.skills.list
puts(page)`
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