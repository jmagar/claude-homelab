Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Videos](/api/reference/typescript/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
client.videos.getCharacter(stringcharacterID, RequestOptionsoptions?): [VideoGetCharacterResponse](</api/reference/typescript/resources/videos#(resource) videos > (model) video_get_character_response > (schema)>) { id, created\_at, name }
GET/videos/characters/{character\_id}
Fetch a character.
##### ParametersExpand Collapse
characterID: string
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
##### ReturnsExpand Collapse
VideoGetCharacterResponse { id, created\_at, name }
id: string | null
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) created_at>)
name: string | null
Display name for the character.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_get_character_response > (schema)>)
### Fetch a character.
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
const response = await client.videos.getCharacter('char\_123');
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