Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Videos](/api/reference/ruby/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
videos.get\_character(character\_id) -\> [VideoGetCharacterResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_get_character_response > (schema)>) { id, created\_at, name }
GET/videos/characters/{character\_id}
Fetch a character.
##### ParametersExpand Collapse
character\_id: String
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
##### ReturnsExpand Collapse
class VideoGetCharacterResponse { id, created\_at, name }
id: String
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) created_at>)
name: String
Display name for the character.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_get_character_response > (schema)>)
### Fetch a character.
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
response = openai.videos.get\_character("char\_123")
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