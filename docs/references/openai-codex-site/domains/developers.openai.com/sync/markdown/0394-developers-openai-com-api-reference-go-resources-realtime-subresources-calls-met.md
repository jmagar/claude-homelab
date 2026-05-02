Reject call | OpenAI API Reference
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
# Reject call
client.Realtime.Calls.Reject(ctx, callID, body) error
POST/realtime/calls/{call\_id}/reject
Decline an incoming SIP call by returning a SIP status code to the caller.
##### ParametersExpand Collapse
callID string
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) call_id > (schema)>)
body CallRejectParams
StatusCode param.Field[int64]Optional
SIP response code to send back to the caller. Defaults to `603` (Decline)
when omitted.
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) status_code>)
[](<#(resource) realtime.calls > (method) reject > (params) default>)
### Reject call
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
"github.com/openai/openai-go/realtime"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
err := client.Realtime.Calls.Reject(
context.TODO(),
"call\_id",
realtime.CallRejectParams{
},
)
if err != nil {
panic(err.Error())
}
}
`
```
##### Returns Examples