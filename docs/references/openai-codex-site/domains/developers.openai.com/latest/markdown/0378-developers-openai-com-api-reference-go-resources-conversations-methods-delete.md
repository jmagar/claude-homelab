Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Conversations](/api/reference/go/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
client.Conversations.Delete(ctx, conversationID) (\*[ConversationDeletedResource](</api/reference/go/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>), error)
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### ParametersExpand Collapse
conversationID string
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
type ConversationDeletedResource struct{…}
ID string
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
Deleted bool
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
Object ConversationDeleted
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
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
conversationDeletedResource, err := client.Conversations.Delete(context.TODO(), "conv\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", conversationDeletedResource.ID)
}
`
```
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```