Delete a skill version. | OpenAI API Reference
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
# Delete a skill version.
client.Skills.Versions.Delete(ctx, skillID, version) (\*[DeletedSkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) deleted_skill_version > (schema)>), error)
DELETE/skills/{skill\_id}/versions/{version}
Delete a skill version.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.versions > (method) delete > (params) default > (param) skill_id > (schema)>)
version string
The skill version number.
[](<#(resource) skills.versions > (method) delete > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
type DeletedSkillVersion struct{…}
ID string
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) id>)
Deleted bool
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) deleted>)
Object SkillVersionDeleted
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) object>)
Version string
The deleted skill version.
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema) > (property) version>)
[](<#(resource) skills.versions > (model) deleted_skill_version > (schema)>)
### Delete a skill version.
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
deletedSkillVersion, err := client.Skills.Versions.Delete(
context.TODO(),
"skill\_123",
"version",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", deletedSkillVersion.ID)
}
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.version.deleted",
"version": "version"
}`
```