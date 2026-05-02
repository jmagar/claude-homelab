Retrieve container file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Containers](/api/reference/typescript/resources/containers)
[Files](/api/reference/typescript/resources/containers/subresources/files)
[Content](/api/reference/typescript/resources/containers/subresources/files/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve container file content
client.containers.files.content.retrieve(stringfileID, ContentRetrieveParams { container\_id } params, RequestOptionsoptions?): Response
GET/containers/{container\_id}/files/{file\_id}/content
Retrieve Container File Content
##### ParametersExpand Collapse
fileID: string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) file_id > (schema)>)
params: ContentRetrieveParams { container\_id }
container\_id: string
[](<#(resource) containers.files.content > (method) retrieve > (params) default > (param) container_id>)
[](<#(resource) containers.files.content > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
unnamed\_schema\_2 = Response
[](<#(resource) containers.files.content > (method) retrieve > (network schema)>)
### Retrieve container file content
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
const content = await client.containers.files.content.retrieve('file\_id', {
container\_id: 'container\_id',
});
console.log(content);
const data = await content.blob();
console.log(data);`
```
```
`\<binary content of the file\>
`
```
##### Returns Examples
```
`\<binary content of the file\>
`
```