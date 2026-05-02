Retrieve model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Models](/api/reference/go/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve model
client.Models.Get(ctx, model) (\*[Model](</api/reference/go/resources/models#(resource) models > (model) model > (schema)>), error)
GET/models/{model}
Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
##### ParametersExpand Collapse
model string
[](<#(resource) models > (method) retrieve > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
type Model struct{…}
Describes an OpenAI model offering that can be used with the API.
ID string
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
Created int64
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
Object Model
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
OwnedBy string
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
### Retrieve model
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
model, err := client.Models.Get(context.TODO(), "gpt-4o-mini")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", model.ID)
}
`
```
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```
##### Returns Examples
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```