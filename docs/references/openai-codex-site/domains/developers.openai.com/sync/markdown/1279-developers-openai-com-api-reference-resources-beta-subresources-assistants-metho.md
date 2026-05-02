Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[Assistants](/api/reference/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### Path ParametersExpand Collapse
assistant\_id: string
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
##### ReturnsExpand Collapse
AssistantDeleted object { id, deleted, object }
id: string
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: "assistant.deleted"
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
`curl https://api.openai.com/v1/assistants/asst\_abc123 \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "OpenAI-Beta: assistants=v2" \\
-X DELETE
`
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