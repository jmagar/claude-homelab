Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Videos](/api/reference/python/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
videos.get\_character(strcharacter\_id) -\> [VideoGetCharacterResponse](</api/reference/python/resources/videos#(resource) videos > (model) video_get_character_response > (schema)>)
GET/videos/characters/{character\_id}
Fetch a character.
##### ParametersExpand Collapse
character\_id: str
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
##### ReturnsExpand Collapse
class VideoGetCharacterResponse: …
id: Optional[str]
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) created_at>)
name: Optional[str]
Display name for the character.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_get_character_response > (schema)>)
### Fetch a character.
Python
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
response = client.videos.get\_character(
"char\_123",
)
print(response.id)`
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