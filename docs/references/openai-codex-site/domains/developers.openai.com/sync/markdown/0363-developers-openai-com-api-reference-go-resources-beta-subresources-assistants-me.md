Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Assistants](/api/reference/go/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
client.Beta.Assistants.Delete(ctx, assistantID) (\*[AssistantDeleted](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>), error)
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### ParametersExpand Collapse
assistantID string
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
##### ReturnsExpand Collapse
type AssistantDeleted struct{…}
ID string
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
Object AssistantDeleted
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
assistantDeleted, err := client.Beta.Assistants.Delete(context.TODO(), "assistant\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", assistantDeleted.ID)
}
`
```
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```