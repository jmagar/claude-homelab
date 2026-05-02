List models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Models](/api/reference/go/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List models
client.Models.List(ctx) (\*Page[[Model](</api/reference/go/resources/models#(resource) models > (model) model > (schema)>)], error)
GET/models
Lists the currently available models, and provides basic information about each one such as the owner and availability.
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
### List models
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
page, err := client.Models.List(context.TODO())
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```