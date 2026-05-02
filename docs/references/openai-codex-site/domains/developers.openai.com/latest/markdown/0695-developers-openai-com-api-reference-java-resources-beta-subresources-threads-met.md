Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Threads](/api/reference/java/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
[ThreadDeleted](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) beta().threads().delete(ThreadDeleteParamsparams = ThreadDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}
Delete a thread.
##### ParametersExpand Collapse
ThreadDeleteParams params
Optional\<String\> threadId
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
[](<#(resource) beta.threads > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ThreadDeleted:
String id
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.deleted"constant"thread.deleted"constant
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
import com.openai.models.beta.threads.ThreadDeleteParams;
import com.openai.models.beta.threads.ThreadDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ThreadDeleted threadDeleted = client.beta().threads().delete("thread\_id");
}
}`
```
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```