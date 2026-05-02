Delete a container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container
client.Containers.Delete(ctx, containerID) error
DELETE/containers/{container\_id}
Delete Container
##### ParametersExpand Collapse
containerID string
[](<#(resource) containers > (method) delete > (params) default > (param) container_id > (schema)>)
### Delete a container
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
err := client.Containers.Delete(context.TODO(), "container\_id")
if err != nil {
panic(err.Error())
}
}
`
```
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```