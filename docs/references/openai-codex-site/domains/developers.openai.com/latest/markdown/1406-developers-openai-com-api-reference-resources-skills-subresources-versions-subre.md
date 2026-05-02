Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Skills](/api/reference/resources/skills)
[Versions](/api/reference/resources/skills/subresources/versions)
[Content](/api/reference/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### Path ParametersExpand Collapse
skill\_id: string
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version: string
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
### Download a skill version zip bundle.
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
`curl https://api.openai.com/v1/skills/$SKILL\_ID/versions/$VERSION/content \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
```
##### Returns Examples