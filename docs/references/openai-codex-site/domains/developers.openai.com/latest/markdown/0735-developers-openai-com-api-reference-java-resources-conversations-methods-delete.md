Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Conversations](/api/reference/java/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
[ConversationDeletedResource](</api/reference/java/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>) conversations().delete(ConversationDeleteParamsparams = ConversationDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### ParametersExpand Collapse
ConversationDeleteParams params
Optional\<String\> conversationId
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
[](<#(resource) conversations > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ConversationDeletedResource:
String id
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
boolean deleted
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
JsonValue; object\_ "conversation.deleted"constant"conversation.deleted"constant
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
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
import com.openai.models.conversations.ConversationDeleteParams;
import com.openai.models.conversations.ConversationDeletedResource;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ConversationDeletedResource conversationDeletedResource = client.conversations().delete("conv\_123");
}
}`
```
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```