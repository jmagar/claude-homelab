Reject call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Realtime](/api/reference/typescript/resources/realtime)
[Calls](/api/reference/typescript/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Reject call
client.realtime.calls.reject(stringcallID, CallRejectParams { status\_code } body?, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/reject
Decline an incoming SIP call by returning a SIP status code to the caller.
##### ParametersExpand Collapse
callID: string
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) call_id > (schema)>)
body: CallRejectParams { status\_code }
status\_code?: number
SIP response code to send back to the caller. Defaults to `603` (Decline)
when omitted.
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) status_code>)
[](<#(resource) realtime.calls > (method) reject > (params) default>)
### Reject call
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
await client.realtime.calls.reject('call\_id');`
```
##### Returns Examples