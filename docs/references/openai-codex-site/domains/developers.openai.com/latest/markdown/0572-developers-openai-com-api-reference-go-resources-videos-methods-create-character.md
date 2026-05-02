Create a character from an uploaded video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Videos](/api/reference/go/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a character from an uploaded video.
client.Videos.NewCharacter(ctx, body) (\*[VideoNewCharacterResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoNewCharacterResponse > (schema)>), error)
POST/videos/characters
Create a character from an uploaded video.
##### ParametersExpand Collapse
body VideoNewCharacterParams
Name param.Field[string]
Display name for this API character.
maxLength80
minLength1
[](<#(resource) videos > (method) create_character > (params) default > (param) name>)
Video param.Field[[Reader](</api/reference/go/resources/videos/methods/create_character#(resource) videos > (method) create_character > (params) default > (param) video > (schema)>)]
Video file used to create a character.
[](<#(resource) videos > (method) create_character > (params) default > (param) video>)
[](<#(resource) videos > (method) create_character > (params) default>)
##### ReturnsExpand Collapse
type VideoNewCharacterResponse struct{…}
ID string
Identifier for the character creation cameo.
[](<#(resource) videos > (model) VideoNewCharacterResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) VideoNewCharacterResponse > (schema) > (property) created_at>)
Name string
Display name for the character.
[](<#(resource) videos > (model) VideoNewCharacterResponse > (schema) > (property) name>)
[](<#(resource) videos > (model) VideoNewCharacterResponse > (schema)>)
### Create a character from an uploaded video.
Go
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
`package main
import (
"bytes"
"context"
"fmt"
"io"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
response, err := client.Videos.NewCharacter(context.TODO(), openai.VideoNewCharacterParams{
Name: "x",
Video: io.Reader(bytes.NewBuffer([]byte("Example data"))),
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", response.ID)
}
`
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