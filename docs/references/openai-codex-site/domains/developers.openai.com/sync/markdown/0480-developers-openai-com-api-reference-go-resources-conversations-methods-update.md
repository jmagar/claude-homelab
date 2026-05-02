Update a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Conversations](/api/reference/go/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update a conversation
client.Conversations.Update(ctx, conversationID, body) (\*[Conversation](</api/reference/go/resources/conversations#(resource) conversations > (model) conversation > (schema)>), error)
POST/conversations/{conversation\_id}
Update a conversation
##### ParametersExpand Collapse
conversationID string
[](<#(resource) conversations > (method) update > (params) default > (param) conversation_id > (schema)>)
body ConversationUpdateParams
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) conversations > (method) update > (params) default > (param) metadata>)
[](<#(resource) conversations > (method) update > (params) default>)
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
### Update a conversation
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
"github.com/openai/openai-go/conversations"
"github.com/openai/openai-go/option"
"github.com/openai/openai-go/shared"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
conversation, err := client.Conversations.Update(
context.TODO(),
"conv\_123",
conversations.ConversationUpdateParams{
Metadata: shared.Metadata{
"foo": "string",
},
},
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
"metadata": {"topic": "project-x"}
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "project-x"}
}
`
```