Delete ChatKit thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[ChatKit](/api/reference/java/resources/beta/subresources/chatkit)
[Threads](/api/reference/java/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete ChatKit thread
[ThreadDeleteResponse](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema)>) beta().chatkit().threads().delete(ThreadDeleteParamsparams = ThreadDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/chatkit/threads/{thread\_id}
Delete a ChatKit thread along with its items and stored attachments.
##### ParametersExpand Collapse
ThreadDeleteParams params
Optional\<String\> threadId
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ThreadDeleteResponse:
Confirmation payload returned after deleting a thread.
String id
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema) > (property) id>)
boolean deleted
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "chatkit.thread.deleted"constant"chatkit.thread.deleted"constant
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) ThreadDeleteResponse > (schema)>)
### Delete ChatKit thread
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
import com.openai.models.beta.chat\_kit.threads.ThreadDeleteParams;
import com.openai.models.beta.chat\_kit.threads.ThreadDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ThreadDeleteResponse thread = client.beta().chat\_kit().threads().delete("cthr\_123");
}
}
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```