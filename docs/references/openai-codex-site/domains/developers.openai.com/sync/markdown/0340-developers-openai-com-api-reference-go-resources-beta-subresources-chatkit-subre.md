Delete ChatKit thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[ChatKit](/api/reference/go/resources/beta/subresources/chatkit)
[Threads](/api/reference/go/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete ChatKit thread
client.Beta.ChatKit.Threads.Delete(ctx, threadID) (\*[BetaChatKitThreadDeleteResponse](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema)>), error)
DELETE/chatkit/threads/{thread\_id}
Delete a ChatKit thread along with its items and stored attachments.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
type BetaChatKitThreadDeleteResponse struct{…}
Confirmation payload returned after deleting a thread.
ID string
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema) > (property) id>)
Deleted bool
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema) > (property) deleted>)
Object ChatKitThreadDeleted
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) BetaChatKitThreadDeleteResponse > (schema)>)
### Delete ChatKit thread
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
)
func main() {
client := openai.NewClient()
thread, err := client.Beta.ChatKit.Threads.Delete(context.TODO(), "cthr\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", thread.ID)
}
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```