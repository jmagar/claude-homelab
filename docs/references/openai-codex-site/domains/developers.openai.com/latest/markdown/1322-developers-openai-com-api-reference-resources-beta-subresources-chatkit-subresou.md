Delete ChatKit thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[ChatKit](/api/reference/resources/beta/subresources/chatkit)
[Threads](/api/reference/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete ChatKit thread
DELETE/chatkit/threads/{thread\_id}
Delete a ChatKit thread along with its items and stored attachments.
##### Path ParametersExpand Collapse
thread\_id: string
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
id: string
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: boolean
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: "chatkit.thread.deleted"
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
### Delete ChatKit thread
HTTP
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
`curl https://api.openai.com/v1/chatkit/threads/$THREAD\_ID \\
-X DELETE \\
-H 'OpenAI-Beta: chatkit\_beta=v1' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
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