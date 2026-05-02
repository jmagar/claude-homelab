Delete a container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Containers](/api/reference/typescript/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container
client.containers.delete(stringcontainerID, RequestOptionsoptions?): void
DELETE/containers/{container\_id}
Delete Container
##### ParametersExpand Collapse
containerID: string
[](<#(resource) containers > (method) delete > (params) default > (param) container_id > (schema)>)
### Delete a container
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
await client.containers.delete('container\_id');`
```
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```