Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
GET/videos/characters/{character\_id}
Fetch a character.
##### Path ParametersExpand Collapse
character\_id: string
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
##### ReturnsExpand Collapse
id: string
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) created_at>)
name: string
Display name for the character.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) name>)
### Fetch a character.
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
`curl https://api.openai.com/v1/videos/characters/$CHARACTER\_ID \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name"
}`
```