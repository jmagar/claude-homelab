Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Assistants](/api/reference/java/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
[AssistantDeleted](</api/reference/java/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>) beta().assistants().delete(AssistantDeleteParamsparams = AssistantDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### ParametersExpand Collapse
AssistantDeleteParams params
Optional\<String\> assistantId
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
[](<#(resource) beta.assistants > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class AssistantDeleted:
String id
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "assistant.deleted"constant"assistant.deleted"constant
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
import com.openai.models.beta.assistants.AssistantDeleteParams;
import com.openai.models.beta.assistants.AssistantDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
AssistantDeleted assistantDeleted = client.beta().assistants().delete("assistant\_id");
}
}`
```
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```