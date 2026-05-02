Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Models](/api/reference/go/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
client.Models.Delete(ctx, model) (\*[ModelDeleted](</api/reference/go/resources/models#(resource) models > (model) model_deleted > (schema)>), error)
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### ParametersExpand Collapse
model string
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
type ModelDeleted struct{…}
ID string
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
Object string
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
modelDeleted, err := client.Models.Delete(context.TODO(), "ft:gpt-4o-mini:acemeco:suffix:abc123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", modelDeleted.ID)
}
`
```
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```