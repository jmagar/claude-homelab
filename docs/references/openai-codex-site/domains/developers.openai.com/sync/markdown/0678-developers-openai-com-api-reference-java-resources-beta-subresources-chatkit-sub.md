List ChatKit threads | OpenAI API Reference
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
# List ChatKit threads
ThreadListPage beta().chatkit().threads().list(ThreadListParamsparams = ThreadListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chatkit/threads
List ChatKit threads with optional pagination and user filters.
##### ParametersExpand Collapse
ThreadListParams params
Optional\<String\> after
List items created after this thread item ID. Defaults to null for the first page.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) after > (schema)>)
Optional\<String\> before
List items created before this thread item ID. Defaults to null for the newest results.
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) before > (schema)>)
Optional\<Long\> limit
Maximum number of thread items to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/beta/subresources/chatkit/subresources/threads/methods/list#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for results by creation time. Defaults to `desc`.
ASC("asc")
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) order > (schema)>)
Optional\<String\> user
Filter threads that belong to this user identifier. Defaults to null to return all users.
minLength1
maxLength512
[](<#(resource) beta.chatkit.threads > (method) list > (params) default > (param) user > (schema)>)
[](<#(resource) beta.chatkit.threads > (method) list > (params) default>)
##### ReturnsExpand Collapse
class ChatKitThread:
Represents a ChatKit thread and its current status.
String id
Identifier of the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) for when the thread was created.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) created_at>)
JsonValue; object\_ "chatkit.thread"constant"chatkit.thread"constant
Type discriminator that is always `chatkit.thread`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) object>)
Status status
Current status for the thread. Defaults to `active` for newly created threads.
One of the following:
JsonValue;
JsonValue; type "active"constant"active"constant
Status discriminator that is always `active`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 0>)
class Locked:
Indicates that a thread is locked and cannot accept new input.
Optional\<String\> reason
Reason that the thread was locked. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) reason>)
JsonValue; type "locked"constant"locked"constant
Status discriminator that is always `locked`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 1>)
class Closed:
Indicates that a thread has been closed.
Optional\<String\> reason
Reason that the thread was closed. Defaults to null when no reason is recorded.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) reason>)
JsonValue; type "closed"constant"closed"constant
Status discriminator that is always `closed`.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2 > (property) type>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) status>)
Optional\<String\> title
Optional human-readable title for the thread. Defaults to null when no title has been generated.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) title>)
String user
Free-form string that identifies your end user who owns the thread.
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema) > (property) user>)
[](<#(resource) beta.chatkit.threads > (model) chatkit_thread > (schema)>)
### List ChatKit threads
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
import com.openai.models.beta.chatkit.threads.ThreadListPage;
import com.openai.models.beta.chatkit.threads.ThreadListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ThreadListPage page = client.beta().chatkit().threads().list();
}
}
`
```
```
`{
"data": [
{
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation"
},
{
"id": "cthr\_def456",
"object": "chatkit.thread",
"title": "Demo feedback"
}
],
"has\_more": false,
"object": "list"
}
`
```
##### Returns Examples
```
`{
"data": [
{
"id": "cthr\_abc123",
"object": "chatkit.thread",
"title": "Customer escalation"
},
{
"id": "cthr\_def456",
"object": "chatkit.thread",
"title": "Demo feedback"
}
],
"has\_more": false,
"object": "list"
}
`
```