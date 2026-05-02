List all skills for the current project. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Skills](/api/reference/go/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all skills for the current project.
client.Skills.List(ctx, query) (\*CursorPage[[Skill](</api/reference/go/resources/skills#(resource) skills > (model) skill > (schema)>)], error)
GET/skills
List all skills for the current project.
##### ParametersExpand Collapse
query SkillListParams
After param.Field[string]Optional
Identifier for the last item from the previous pagination request
[](<#(resource) skills > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of items to retrieve
minimum0
maximum100
[](<#(resource) skills > (method) list > (params) default > (param) limit>)
Order param.Field[[SkillListParamsOrder](</api/reference/go/resources/skills/methods/list#(resource) skills > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
const SkillListParamsOrderAsc [SkillListParamsOrder](</api/reference/go/resources/skills/methods/list#(resource) skills > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const SkillListParamsOrderDesc [SkillListParamsOrder](</api/reference/go/resources/skills/methods/list#(resource) skills > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) skills > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) skills > (method) list > (params) default > (param) order>)
[](<#(resource) skills > (method) list > (params) default>)
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
### List all skills for the current project.
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
page, err := client.Skills.List(context.TODO(), openai.SkillListParams{
})
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
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
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
"default\_version": "default\_version",
"description": "description",
"latest\_version": "latest\_version",
"name": "name",
"object": "skill"
}
],
"first\_id": "first\_id",
"has\_more": true,
"last\_id": "last\_id",
"object": "list"
}`
```