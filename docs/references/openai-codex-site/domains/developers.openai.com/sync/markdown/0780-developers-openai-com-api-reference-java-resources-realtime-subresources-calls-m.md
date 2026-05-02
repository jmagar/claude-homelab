Accept call | OpenAI API Reference
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
# Accept call
realtime().calls().accept(CallAcceptParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/realtime/calls/{call\_id}/accept
Accept an incoming SIP call and configure the realtime session that will
handle it.
##### ParametersExpand Collapse
CallAcceptParams params
Optional\<String\> callId
[](<#(resource) realtime.calls > (method) accept > (params) default > (param) call_id > (schema)>)
[RealtimeSessionCreateRequest](</api/reference/java/resources/realtime#(resource) realtime > (model) realtime_session_create_request > (schema)>) realtimeSessionCreateRequest
Realtime session object configuration.
[](<#(resource) realtime.calls > (method) accept > (params) default > (param) realtime_session_create_request > (schema)>)
[](<#(resource) realtime.calls > (method) accept > (params) default>)
### Accept call
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
import com.openai.models.realtime.RealtimeSessionCreateRequest;
import com.openai.models.realtime.calls.CallAcceptParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CallAcceptParams params = CallAcceptParams.builder()
.callId("call\_id")
.realtimeSessionCreateRequest(RealtimeSessionCreateRequest.builder().build())
.build();
client.realtime().calls().accept(params);
}
}`
```
##### Returns Examples