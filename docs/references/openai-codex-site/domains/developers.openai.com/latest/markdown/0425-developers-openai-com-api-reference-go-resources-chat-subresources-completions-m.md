Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Chat](/api/reference/go/resources/chat)
[Completions](/api/reference/go/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
client.Chat.Completions.Delete(ctx, completionID) (\*[ChatCompletionDeleted](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>), error)
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### ParametersExpand Collapse
completionID string
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
##### ReturnsExpand Collapse
type ChatCompletionDeleted struct{…}
ID string
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
Deleted bool
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
Object ChatCompletionDeleted
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
### Delete chat completion
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
chatCompletionDeleted, err := client.Chat.Completions.Delete(context.TODO(), "completion\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", chatCompletionDeleted.ID)
}
`
```
```
`{
"object": "chat.completion.deleted",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "chat.completion.deleted",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"deleted": true
}
`
```