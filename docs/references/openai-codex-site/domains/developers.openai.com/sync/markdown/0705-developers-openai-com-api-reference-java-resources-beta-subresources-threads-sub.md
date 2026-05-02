Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Threads](/api/reference/java/resources/beta/subresources/threads)
[Messages](/api/reference/java/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
[MessageDeleted](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) beta().threads().messages().delete(MessageDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### ParametersExpand Collapse
MessageDeleteParams params
String threadId
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id > (schema)>)
Optional\<String\> messageId
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
[](<#(resource) beta.threads.messages > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class MessageDeleted:
String id
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.message.deleted"constant"thread.message.deleted"constant
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
import com.openai.models.beta.threads.messages.MessageDeleteParams;
import com.openai.models.beta.threads.messages.MessageDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
MessageDeleteParams params = MessageDeleteParams.builder()
.threadId("thread\_id")
.messageId("message\_id")
.build();
MessageDeleted messageDeleted = client.beta().threads().messages().delete(params);
}
}`
```
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```