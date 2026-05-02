Delete a container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Containers](/api/reference/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container
DELETE/containers/{container\_id}
Delete Container
##### Path ParametersExpand Collapse
container\_id: string
[](<#(resource) containers > (method) delete > (params) default > (param) container_id > (schema)>)
### Delete a container
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
`curl -X DELETE https://api.openai.com/v1/containers/cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
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