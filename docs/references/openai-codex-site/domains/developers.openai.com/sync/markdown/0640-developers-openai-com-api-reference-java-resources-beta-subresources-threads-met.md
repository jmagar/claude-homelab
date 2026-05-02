Retrieve thread | OpenAI API Reference
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
# Retrieve thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
[Thread](</api/reference/java/resources/beta#(resource) beta.threads > (model) thread > (schema)>) beta().threads().retrieve(ThreadRetrieveParamsparams = ThreadRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}
Retrieves a thread.
##### ParametersExpand Collapse
ThreadRetrieveParams params
Optional\<String\> threadId
[](<#(resource) beta.threads > (method) retrieve > (params) default > (param) thread_id > (schema)>)
[](<#(resource) beta.threads > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class Thread:
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
JsonValue; object\_ "thread"constant"thread"constant
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
Optional\<ToolResources\> toolResources
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
Optional\<CodeInterpreter\> codeInterpreter
Optional\<List\<String\>\> fileIds
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
Optional\<FileSearch\> fileSearch
Optional\<List\<String\>\> vectorStoreIds
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
### Retrieve thread
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
import com.openai.models.beta.threads.Thread;
import com.openai.models.beta.threads.ThreadRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Thread thread = client.beta().threads().retrieve("thread\_id");
}
}`
```
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699014083,
"metadata": {},
"tool\_resources": {
"code\_interpreter": {
"file\_ids": []
}
}
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699014083,
"metadata": {},
"tool\_resources": {
"code\_interpreter": {
"file\_ids": []
}
}
}
`
```