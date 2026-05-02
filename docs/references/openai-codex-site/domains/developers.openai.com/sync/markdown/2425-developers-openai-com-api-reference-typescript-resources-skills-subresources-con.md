Download a skill zip bundle by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
[Content](/api/reference/typescript/resources/skills/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill zip bundle by its ID.
client.skills.content.retrieve(stringskillID, RequestOptionsoptions?): Response
GET/skills/{skill\_id}/content
Download a skill zip bundle by its ID.
##### ParametersExpand Collapse
skillID: string
[](<#(resource) skills.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
unnamed\_schema\_3 = Response
[](<#(resource) skills.content > (method) retrieve > (network schema)>)
### Download a skill zip bundle by its ID.
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
const content = await client.skills.content.retrieve('skill\_123');
console.log(content);
const data = await content.blob();
console.log(data);`
```
##### Returns Examples