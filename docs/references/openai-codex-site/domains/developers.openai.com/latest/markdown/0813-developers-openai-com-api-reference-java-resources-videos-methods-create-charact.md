Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Videos](/api/reference/java/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
[VideoCreateCharacterResponse](</api/reference/java/resources/videos#(resource) videos > (model) VideoCreateCharacterResponse > (schema)>) videos().createCharacter(VideoCreateCharacterParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos/characters
Create a character from an uploaded video.
##### ParametersExpand Collapse
VideoCreateCharacterParams params
String name
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) default > (param) body > (schema) > (property) name>)
InputStream video
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) default > (param) body > (schema) > (property) video>)
[](<#(resource) videos > (method) create_character > (params) default>)
##### ReturnsExpand Collapse
class VideoCreateCharacterResponse:
Optional\<String\> id
Identifier for the character creation cameo.
[](<#(resource) videos > (model) VideoCreateCharacterResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) VideoCreateCharacterResponse > (schema) > (property) created_at>)
Optional\<String\> name
Display name for the character.
[](<#(resource) videos > (model) VideoCreateCharacterResponse > (schema) > (property) name>)
[](<#(resource) videos > (model) VideoCreateCharacterResponse > (schema)>)
### Create a character from an uploaded video.
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
import com.openai.models.videos.VideoCreateCharacterParams;
import com.openai.models.videos.VideoCreateCharacterResponse;
import java.io.ByteArrayInputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VideoCreateCharacterParams params = VideoCreateCharacterParams.builder()
.name("x")
.video(new ByteArrayInputStream("Example data".getBytes()))
.build();
VideoCreateCharacterResponse response = client.videos().createCharacter(params);
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