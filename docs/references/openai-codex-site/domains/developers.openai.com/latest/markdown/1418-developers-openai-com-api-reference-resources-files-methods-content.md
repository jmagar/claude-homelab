Retrieve file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Files](/api/reference/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file content
GET/files/{file\_id}/content
Returns the contents of the specified file.
##### Path ParametersExpand Collapse
file\_id: string
[](<#(resource) files > (method) content > (params) default > (param) file_id > (schema)>)
### Retrieve file content
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
`curl https://api.openai.com/v1/files/file-abc123/content \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \> file.jsonl
`
```
##### Returns Examples