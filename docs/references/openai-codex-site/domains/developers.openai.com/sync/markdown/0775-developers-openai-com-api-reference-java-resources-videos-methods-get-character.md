Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Videos](/api/reference/java/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
[VideoGetCharacterResponse](</api/reference/java/resources/videos#(resource) videos > (model) VideoGetCharacterResponse > (schema)>) videos().getCharacter(VideoGetCharacterParamsparams = VideoGetCharacterParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos/characters/{character\_id}
Fetch a character.
##### ParametersExpand Collapse
VideoGetCharacterParams params
Optional\<String\> characterId
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
[](<#(resource) videos > (method) get_character > (params) default>)
##### ReturnsExpand Collapse
class VideoGetCharacterResponse:
Optional\<String\> id
Identifier for the character creation cameo.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) created_at>)
Optional\<String\> name
Display name for the character.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) name>)
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema)>)
### Fetch a character.
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.videos.VideoGetCharacterParams;
import com.openai.models.videos.VideoGetCharacterResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VideoGetCharacterResponse response = client.videos().getCharacter("char\_123");
}
}`
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