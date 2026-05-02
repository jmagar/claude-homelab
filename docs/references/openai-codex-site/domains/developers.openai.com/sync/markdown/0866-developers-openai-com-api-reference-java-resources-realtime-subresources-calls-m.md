Reject call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Realtime](/api/reference/java/resources/realtime)
[Calls](/api/reference/java/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Reject call
realtime().calls().reject(CallRejectParamsparams = CallRejectParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/realtime/calls/{call\_id}/reject
Decline an incoming SIP call by returning a SIP status code to the caller.
##### ParametersExpand Collapse
CallRejectParams params
Optional\<String\> callId
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) call_id > (schema)>)
Optional\<Long\> statusCode
SIP response code to send back to the caller. Defaults to `603` (Decline)
when omitted.
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) body > (schema) > (property) status_code>)
[](<#(resource) realtime.calls > (method) reject > (params) default>)
### Reject call
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.realtime.calls.CallRejectParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
client.realtime().calls().reject("call\_id");
}
}`
```
##### Returns Examples