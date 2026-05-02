Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
POST/videos/characters
Create a character from an uploaded video.
##### Body ParametersForm DataExpand Collapse
name: string
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) 0 > (param) name > (schema)>)
video: file
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) 0 > (param) video > (schema)>)
##### ReturnsExpand Collapse
id: string
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) created_at>)
name: string
Display name for the character.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) name>)
### Create a character from an uploaded video.
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
`curl https://api.openai.com/v1/videos/characters \\
-H 'Content-Type: multipart/form-data' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F name=x \\
-F 'video=@/path/to/video'`
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