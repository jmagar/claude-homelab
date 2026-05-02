Create a new skill. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new skill.
client.Skills.New(ctx, body) (\*[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>), error)
POST/skills
Create a new skill.
##### ParametersExpand Collapse
body SkillNewParams
Files param.Field[[SkillNewParamsFilesUnion](</api/reference/go/resources/skills/methods/create#(resource) skills > (method) create > (params) default > (param) files > (schema)>)]Optional
Skill files to upload (directory upload) or a single zip file.
type SkillNewParamsFilesArray []Reader
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
Reader
[](<#(resource) skills > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills > (method) create > (params) default > (param) files>)
[](<#(resource) skills > (method) create > (params) default>)
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
### Create a new skill.
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
skill, err := client.Skills.New(context.TODO(), openai.SkillNewParams{
})
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