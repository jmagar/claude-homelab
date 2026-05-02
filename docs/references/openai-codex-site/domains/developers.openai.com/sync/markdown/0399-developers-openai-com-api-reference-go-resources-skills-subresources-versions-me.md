Create a new immutable skill version. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
[Versions](/api/reference/go/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new immutable skill version.
client.Skills.Versions.New(ctx, skillID, body) (\*[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>), error)
POST/skills/{skill\_id}/versions
Create a new immutable skill version.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.versions > (method) create > (params) default > (param) skill_id > (schema)>)
body SkillVersionNewParams
Default param.Field[bool]Optional
Whether to set this version as the default.
[](<#(resource) skills.versions > (method) create > (params) default > (param) default>)
Files param.Field[[SkillVersionNewParamsFilesUnion](</api/reference/go/resources/skills/subresources/versions/methods/create#(resource) skills.versions > (method) create > (params) default > (param) files > (schema)>)]Optional
Skill files to upload (directory upload) or a single zip file.
type SkillVersionNewParamsFilesArray []Reader
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 0>)
Reader
[](<#(resource) skills.versions > (method) create > (params) default > (param) files > (schema) > (variant) 1>)
[](<#(resource) skills.versions > (method) create > (params) default > (param) files>)
[](<#(resource) skills.versions > (method) create > (params) default>)
##### ReturnsExpand Collapse
type SkillVersion struct{…}
ID string
Unique identifier for the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) created_at>)
Description string
Description of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) description>)
Name string
Name of the skill version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) name>)
Object SkillVersion
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) object>)
SkillID string
Identifier of the skill for this version.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) skill_id>)
Version string
Version number for this skill.
[](<#(resource) skills.versions > (model) skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) skill_version > (schema)>)
### Create a new immutable skill version.
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
skillVersion, err := client.Skills.Versions.New(
context.TODO(),
"skill\_123",
openai.SkillVersionNewParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", skillVersion.ID)
}
`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}`
```