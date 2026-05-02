Fetch a character. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Videos](/api/reference/go/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Fetch a character.
client.Videos.GetCharacter(ctx, characterID) (\*[VideoGetCharacterResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoGetCharacterResponse > (schema)>), error)
GET/videos/characters/{character\_id}
Fetch a character.
##### ParametersExpand Collapse
characterID string
[](<#(resource) videos > (method) get_character > (params) default > (param) character_id > (schema)>)
##### ReturnsExpand Collapse
type VideoGetCharacterResponse struct{…}
ID string
Identifier for the character creation cameo.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) created_at>)
Name string
Display name for the character.
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema) > (property) name>)
[](<#(resource) videos > (model) VideoGetCharacterResponse > (schema)>)
### Fetch a character.
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
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
response, err := client.Videos.GetCharacter(context.TODO(), "char\_123")
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