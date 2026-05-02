Delete ChatKit thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[ChatKit](/api/reference/python/resources/beta/subresources/chatkit)
[Threads](/api/reference/python/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete ChatKit thread
beta.chatkit.threads.delete(strthread\_id) -\> [ThreadDeleteResponse](</api/reference/python/resources/beta#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
DELETE/chatkit/threads/{thread\_id}
Delete a ChatKit thread along with its items and stored attachments.
##### ParametersExpand Collapse
thread\_id: str
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
class ThreadDeleteResponse: …
Confirmation payload returned after deleting a thread.
id: str
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: Literal["chatkit.thread.deleted"]
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
### Delete ChatKit thread
Python
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
`from openai import OpenAI
client = OpenAI()
thread = client.beta.chat\_kit.threads.delete(
"cthr\_123",
)
print(thread.id)
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