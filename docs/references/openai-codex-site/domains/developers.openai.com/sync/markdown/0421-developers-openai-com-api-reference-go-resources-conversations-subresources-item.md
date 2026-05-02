Delete an item | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Conversations](/api/reference/go/resources/conversations)
[Items](/api/reference/go/resources/conversations/subresources/items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an item
client.Conversations.Items.Delete(ctx, conversationID, itemID) (\*[Conversation](</api/reference/go/resources/conversations#(resource) conversations > (model) conversation > (schema)>), error)
DELETE/conversations/{conversation\_id}/items/{item\_id}
Delete an item from a conversation with the given IDs.
##### ParametersExpand Collapse
conversationID string
[](<#(resource) conversations.items > (method) delete > (params) default > (param) conversation_id > (schema)>)
itemID string
[](<#(resource) conversations.items > (method) delete > (params) default > (param) item_id > (schema)>)
##### ReturnsExpand Collapse
type Conversation struct{…}
ID string
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
CreatedAt int64
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
Metadata any
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
Object Conversation
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
### Delete an item
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
conversation, err := client.Conversations.Items.Delete(
context.TODO(),
"conv\_123",
"msg\_abc",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", conversation.ID)
}
`
```
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "demo"}
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "demo"}
}
`
```