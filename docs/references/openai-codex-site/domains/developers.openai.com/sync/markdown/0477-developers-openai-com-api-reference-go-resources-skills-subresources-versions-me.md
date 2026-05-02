List skill versions for a skill. | OpenAI API Reference
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
# List skill versions for a skill.
client.Skills.Versions.List(ctx, skillID, query) (\*CursorPage[[SkillVersion](</api/reference/go/resources/skills#(resource) skills.versions > (model) skill_version > (schema)>)], error)
GET/skills/{skill\_id}/versions
List skill versions for a skill.
##### ParametersExpand Collapse
skillID string
[](<#(resource) skills.versions > (method) list > (params) default > (param) skill_id > (schema)>)
query SkillVersionListParams
After param.Field[string]Optional
The skill version ID to start after.
[](<#(resource) skills.versions > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of versions to retrieve.
minimum0
maximum100
[](<#(resource) skills.versions > (method) list > (params) default > (param) limit>)
Order param.Field[[SkillVersionListParamsOrder](</api/reference/go/resources/skills/subresources/versions/methods/list#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order of results by version number.
const SkillVersionListParamsOrderAsc [SkillVersionListParamsOrder](</api/reference/go/resources/skills/subresources/versions/methods/list#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const SkillVersionListParamsOrderDesc [SkillVersionListParamsOrder](</api/reference/go/resources/skills/subresources/versions/methods/list#(resource) skills.versions > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) skills.versions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills.versions > (method) list > (params) default > (param) order>)
[](<#(resource) skills.versions > (method) list > (params) default>)
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
### List skill versions for a skill.
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
page, err := client.Skills.Versions.List(
context.TODO(),
"skill\_123",
openai.SkillVersionListParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```
##### Returns Examples
200 example
```
`{
"data": [
{
"id": "id",
"created\_at": 0,
"description": "description",
"name": "name",
"object": "skill.version",
"skill\_id": "skill\_id",
"version": "version"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```