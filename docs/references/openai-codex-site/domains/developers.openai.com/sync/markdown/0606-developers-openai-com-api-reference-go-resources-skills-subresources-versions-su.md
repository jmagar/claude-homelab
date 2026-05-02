Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
[Versions](/api/reference/go/resources/skills/subresources/versions)
[Content](/api/reference/go/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
client.Skills.Versions.Content.Get(ctx, skillID, version) (\*Response, error)
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version string
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
type SkillVersionContentGetResponse interface{…}
[](<#(resource) skills.versions.content > (method) retrieve > (network schema)>)
### Download a skill version zip bundle.
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
content, err := client.Skills.Versions.Content.Get(
context.TODO(),
"skill\_123",
"version",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", content)
}
`
```
##### Returns Examples