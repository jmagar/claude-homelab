Accept call | OpenAI API Reference
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
# Accept call
client.Realtime.Calls.Accept(ctx, callID, body) error
POST/realtime/calls/{call\_id}/accept
Accept an incoming SIP call and configure the realtime session that will
handle it.
##### ParametersExpand Collapse
callID string
[](<#(resource) realtime.calls > (method) accept > (params) default > (param) call_id > (schema)>)
body CallAcceptParams
RealtimeSessionCreateRequest param.Field[[RealtimeSessionCreateRequest](</api/reference/go/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>)]
Realtime session object configuration.
[](<#(resource) realtime.calls > (method) accept > (params) default > (param) realtime_session_create_request>)
[](<#(resource) realtime.calls > (method) accept > (params) default>)
### Accept call
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
err := client.Realtime.Calls.Accept(
context.TODO(),
"call\_id",
realtime.CallAcceptParams{
RealtimeSessionCreateRequest: realtime.RealtimeSessionCreateRequestParam{
},
},
)
if err != nil {
panic(err.Error())
}
}
`
```
##### Returns Examples