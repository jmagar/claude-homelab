Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Chat](/api/reference/java/resources/chat)
[Completions](/api/reference/java/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
[ChatCompletionDeleted](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>) chat().completions().delete(ChatCompletionDeleteParamsparams = ChatCompletionDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### ParametersExpand Collapse
ChatCompletionDeleteParams params
Optional\<String\> completionId
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
[](<#(resource) chat.completions > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ChatCompletionDeleted:
String id
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
boolean deleted
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "chat.completion.deleted"constant"chat.completion.deleted"constant
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
### Delete chat completion
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
import com.openai.models.chat.completions.ChatCompletionDeleteParams;
import com.openai.models.chat.completions.ChatCompletionDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ChatCompletionDeleted chatCompletionDeleted = client.chat().completions().delete("completion\_id");
}
}`
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