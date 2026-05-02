Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Responses](/api/reference/go/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
client.Responses.Delete(ctx, responseID) error
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### ParametersExpand Collapse
responseID string
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
### Delete a model response
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
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
err := client.Responses.Delete(context.TODO(), "resp\_677efb5139a88190b512bc3fef8e535d")
if err != nil {
panic(err.Error())
}
}
`
```
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```