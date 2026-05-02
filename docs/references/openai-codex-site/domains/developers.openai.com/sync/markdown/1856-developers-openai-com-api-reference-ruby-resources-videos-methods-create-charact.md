Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Videos](/api/reference/ruby/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
videos.create\_character(\*\*kwargs) -\> [VideoCreateCharacterResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_create_character_response > (schema)>) { id, created\_at, name }
POST/videos/characters
Create a character from an uploaded video.
##### ParametersExpand Collapse
name: String
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) default > (param) name > (schema)>)
video: FileInput
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) default > (param) video > (schema)>)
##### ReturnsExpand Collapse
class VideoCreateCharacterResponse { id, created\_at, name }
id: String
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) created_at>)
name: String
Display name for the character.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_create_character_response > (schema)>)
### Create a character from an uploaded video.
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
response = openai.videos.create\_character(name: "x", video: StringIO.new("Example data"))
puts(response)`
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