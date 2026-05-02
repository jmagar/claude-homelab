Update the default version pointer for a skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update the default version pointer for a skill.
client.Skills.Update(ctx, skillID, body) (\*[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>), error)
POST/skills/{skill\_id}
Update the default version pointer for a skill.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills > (method) update > (params) default > (param) skill_id > (schema)>)
body SkillUpdateParams
DefaultVersion param.Field[string]
The skill version number to set as default.
[](<#(resource) skills > (method) update > (params) default > (param) default_version>)
[](<#(resource) skills > (method) update > (params) default>)
##### ReturnsExpand Collapse
type Skill struct{…}
ID string
Unique identifier for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (model) skill > (schema) > (property) created_at>)
DefaultVersion string
Default version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) default_version>)
Description string
Description of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) description>)
LatestVersion string
Latest version for the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) latest_version>)
Name string
Name of the skill.
[](<#(resource) skills > (model) skill > (schema) > (property) name>)
Object Skill
The object type, which is `skill`.
[](<#(resource) skills > (model) skill > (schema) > (property) object>)
[](<#(resource) skills > (model) skill > (schema)>)
### Update the default version pointer for a skill.
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
skill, err := client.Skills.Update(
context.TODO(),
"skill\_123",
openai.SkillUpdateParams{
DefaultVersion: "default\_version",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", skill.ID)
}
`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}`
```