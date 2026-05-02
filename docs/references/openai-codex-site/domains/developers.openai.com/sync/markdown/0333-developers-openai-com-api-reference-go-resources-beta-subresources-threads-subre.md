Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
[Messages](/api/reference/go/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.Beta.Threads.Messages.Delete(ctx, threadID, messageID) (\*[MessageDeleted](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>), error)
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id > (schema)>)
messageID string
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
##### ReturnsExpand Collapse
type MessageDeleted struct{…}
ID string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
Object ThreadMessageDeleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
messageDeleted, err := client.Beta.Threads.Messages.Delete(
context.TODO(),
"thread\_id",
"message\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", messageDeleted.ID)
}
`
```
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```