Download a skill zip bundle by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
[Content](/api/reference/go/resources/skills/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill zip bundle by its ID.
client.Skills.Content.Get(ctx, skillID) (\*Response, error)
GET/skills/{skill\_id}/content
Download a skill zip bundle by its ID.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
type SkillContentGetResponse interface{…}
[](<#(resource) skills.content > (method) retrieve > (network schema)>)
### Download a skill zip bundle by its ID.
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
content, err := client.Skills.Content.Get(context.TODO(), "skill\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", content)
}
`
```
##### Returns Examples