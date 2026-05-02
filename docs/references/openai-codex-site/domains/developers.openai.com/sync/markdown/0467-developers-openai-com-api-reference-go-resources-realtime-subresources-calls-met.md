Hang up call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Realtime](/api/reference/go/resources/realtime)
[Calls](/api/reference/go/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Hang up call
client.Realtime.Calls.Hangup(ctx, callID) error
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### ParametersExpand Collapse
callID string
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
### Hang up call
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
err := client.Realtime.Calls.Hangup(context.TODO(), "call\_id")
if err != nil {
panic(err.Error())
}
}
`
```
##### Returns Examples