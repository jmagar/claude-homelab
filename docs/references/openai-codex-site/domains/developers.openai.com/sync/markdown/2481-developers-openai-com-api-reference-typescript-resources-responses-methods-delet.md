Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Responses](/api/reference/typescript/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
client.responses.delete(stringresponseID, RequestOptionsoptions?): void
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### ParametersExpand Collapse
responseID: string
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
### Delete a model response
TypeScript
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
`import OpenAI from "openai";
const client = new OpenAI();
const response = await client.responses.delete("resp\_123");
console.log(response);
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