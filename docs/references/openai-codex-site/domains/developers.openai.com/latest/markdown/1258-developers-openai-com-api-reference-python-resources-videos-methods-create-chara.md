Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Videos](/api/reference/python/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
videos.create\_character(VideoCreateCharacterParams\*\*kwargs) -\> [VideoCreateCharacterResponse](</api/reference/python/resources/videos#(resource) videos > (model) video_create_character_response > (schema)>)
POST/videos/characters
Create a character from an uploaded video.
##### ParametersExpand Collapse
name: str
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) default > (param) name > (schema)>)
video: [FileTypes](</api/reference/python/resources/videos/methods/create_character#(resource) videos > (method) create_character > (params) default > (param) video > (schema)>)
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) default > (param) video > (schema)>)
##### ReturnsExpand Collapse
class VideoCreateCharacterResponse: …
id: Optional[str]
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) created_at>)
name: Optional[str]
Display name for the character.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_create_character_response > (schema)>)
### Create a character from an uploaded video.
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
response = client.videos.create\_character(
name="x",
video=b"Example data",
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