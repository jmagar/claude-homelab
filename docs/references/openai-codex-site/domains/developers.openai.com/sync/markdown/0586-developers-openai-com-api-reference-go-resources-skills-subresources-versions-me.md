Get a specific skill version. | OpenAI API Reference
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
# Get a specific skill version.
client.Skills.Versions.Get(ctx, skillID, version) (\*[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>), error)
GET/skills/{skill\_id}/versions/{version}
Get a specific skill version.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version string
The version number to retrieve.
[](<#(resource) skills.versions > (method) retrieve > (params) default > (param) version > (schema)>)
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
### Get a specific skill version.
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
skillVersion, err := client.Skills.Versions.Get(
context.TODO(),
"skill\_123",
"version",
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