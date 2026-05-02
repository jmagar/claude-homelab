Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Skills](/api/reference/typescript/resources/skills)
[Versions](/api/reference/typescript/resources/skills/subresources/versions)
[Content](/api/reference/typescript/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
client.skills.versions.content.retrieve(stringversion, ContentRetrieveParams { skill\_id } params, RequestOptionsoptions?): Response
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### ParametersExpand Collapse
version: string
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
params: ContentRetrieveParams { skill\_id }
skill\_id: string
The identifier of the skill.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id>)
[](<#(resource) skills.versions.content > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
unnamed\_schema\_4 = Response
[](<#(resource) skills.versions.content > (method) retrieve > (network schema)>)
### Download a skill version zip bundle.
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
const content = await client.skills.versions.content.retrieve('version', { skill\_id: 'skill\_123' });
console.log(content);
const data = await content.blob();
console.log(data);`
```
##### Returns Examples