Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Videos](/api/reference/typescript/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
client.videos.createCharacter(VideoCreateCharacterParams { name, video } body, RequestOptionsoptions?): [VideoCreateCharacterResponse](</api/reference/typescript/resources/videos#(resource) videos > (model) video_create_character_response > (schema)>) { id, created\_at, name }
POST/videos/characters
Create a character from an uploaded video.
##### ParametersExpand Collapse
body: VideoCreateCharacterParams { name, video }
name: string
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) default > (param) name>)
video: [Uploadable](</api/reference/typescript/resources/videos/methods/create_character#(resource) videos > (method) create_character > (params) default > (param) video > (schema)>)
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) default > (param) video>)
[](<#(resource) videos > (method) create_character > (params) default>)
##### ReturnsExpand Collapse
VideoCreateCharacterResponse { id, created\_at, name }
id: string | null
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) created_at>)
name: string | null
Display name for the character.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_create_character_response > (schema)>)
### Create a character from an uploaded video.
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
const response = await client.videos.createCharacter({
name: 'x',
video: fs.createReadStream('path/to/file'),
});
console.log(response.id);`
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