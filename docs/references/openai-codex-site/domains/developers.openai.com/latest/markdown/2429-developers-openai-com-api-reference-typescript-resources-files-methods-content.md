Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Files](/api/reference/typescript/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
client.files.content(stringfileID, RequestOptionsoptions?): Response
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### ParametersExpand Collapse
fileID: string
[](<#(resource) files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
unnamed\_schema\_0 = Response
[](<#(resource) files > (method) content > (network schema)>)
### Retrieve file content
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
const openai = new OpenAI();
async function main() {
const file = await openai.files.content("file-abc123");
console.log(file);
}
main();
`
```
##### Returns Examples