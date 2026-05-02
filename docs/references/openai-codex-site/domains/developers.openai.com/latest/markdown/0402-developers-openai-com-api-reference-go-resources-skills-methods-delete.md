Delete a skill by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a skill by its ID.
client.Skills.Delete(ctx, skillID) (\*[DeletedSkill](</api/reference/go/resources/skills#(resource) skills > (model) deleted_skill > (schema)>), error)
DELETE/skills/{skill\_id}
Delete a skill by its ID.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills > (method) delete > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
type DeletedSkill struct{…}
ID string
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) id>)
Deleted bool
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) deleted>)
Object SkillDeleted
[](<#(resource) skills > (model) deleted_skill > (schema) > (property) object>)
[](<#(resource) skills > (model) deleted_skill > (schema)>)
### Delete a skill by its ID.
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
deletedSkill, err := client.Skills.Delete(context.TODO(), "skill\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", deletedSkill.ID)
}
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "skill.deleted"
}`
```