Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.Beta.Threads.Delete(ctx, threadID) (\*[ThreadDeleted](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>), error)
DELETE/threads/{thread\_id}
Delete a thread.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
type ThreadDeleted struct{…}
ID string
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
Object ThreadDeleted
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
threadDeleted, err := client.Beta.Threads.Delete(context.TODO(), "thread\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", threadDeleted.ID)
}
`
```
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```