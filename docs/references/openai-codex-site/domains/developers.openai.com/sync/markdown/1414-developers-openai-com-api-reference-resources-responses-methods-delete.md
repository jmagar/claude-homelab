Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Responses](/api/reference/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### Path ParametersExpand Collapse
response\_id: string
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
### Delete a model response
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
`curl -X DELETE https://api.openai.com/v1/responses/resp\_123 \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```