Hang up call | OpenAI API Reference
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
# Hang up call
realtime().calls().hangup(CallHangupParamsparams = CallHangupParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### ParametersExpand Collapse
CallHangupParams params
Optional\<String\> callId
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
[](<#(resource) realtime.calls > (method) hangup > (params) default>)
### Hang up call
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
import com.openai.models.realtime.calls.CallHangupParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
client.realtime().calls().hangup("call\_id");
}
}`
```
##### Returns Examples